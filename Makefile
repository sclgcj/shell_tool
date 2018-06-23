TARGET=IA-WA200G-MCU-L083

export CC 			= arm-none-eabi-gcc
export CPP 			= arm-none-eabi-g++
export AS 			= arm-none-eabi-as
export LD 			= arm-none-eabi-ld
export OBJCOPY 		= arm-none-eabi-objcopy

TOP = $(shell pwd)
INC_FLAGS = 	-I$(TOP)/Src -I$(TOP)/Inc -I$(TOP)/Src/mcu2mpu_client -I$(TOP)/Src/lora \
				-I$(TOP)/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/include \
				-I$(TOP)/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/ \
				-I$(TOP)/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/CMSIS_RTOS \
				-I$(TOP)/Middlewares/Third_Party/FreeRTOS/Source/include/ \
				-I$(TOP)/Drivers/CMSIS/Include/ \
				-I$(TOP)/Drivers/CMSIS/Device/ST/STM32L0xx/Include \
				-I$(TOP)/Drivers/STM32L0xx_HAL_Driver/Inc/ \
				-I$(TOP)/RTOS/Template/ \
				-I$(TOP)/STM32L0xx_HAl_Driver/Inc  \
				-I$(TOP)/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0/ \
				-I$(TOP)/Src/erpc/infra/ \
				-I$(TOP)/Src/erpc/port/ \
				-I$(TOP)/Src/erpc/config/ \
				-I$(TOP)/Src/erpc/setup/ \
				-I$(TOP)/Src/erpc/transports/ 
				
#-ffunction-sections -fdata-sections 
# 

cur_date=$(shell date)

export CFLAGS = -mcpu=cortex-m0plus -mthumb -mthumb-interwork -Os  -fsigned-char -ffunction-sections -fdata-sections  -DSTM32L083xx -DARM_MATH_CM0PLUS \
	-ffunction-sections -fdata-sections $(INC_FLAGS) -MMD -MP -MF"$(@:%.o=%.cdep)" -MT"$(@)"

export CPPFLAGS = -mcpu=cortex-m0plus -mthumb -mthumb-interwork -Os -fsigned-char -ffunction-sections -fdata-sections -DSTM32L083xx \
	-ffunction-sections -fdata-sections $(INC_FLAGS) -fabi-version=0 -MMD -MP -MF"$(@:%.o=%.cdep)" -MT"$(@)"

ASFLAGS = -W -Wall

LDFLAGS = -mcpu=cortex-m0plus -mthumb -mthumb-interwork -Os -fsigned-char -fmessage-length=0 -ffunction-sections -fdata-sections -T \
		"STM32L083V8_FLASH.ld" -Xlinker --gc-sections -Wl,-Map,"nucleo-stm32l073.map" -lnosys --specs=nano.specs  -specs=rdimon.specs

########################################################################
C_SRC = $(shell find ./ -name '*.c' | grep -v erpc | grep -v mcu2mpu_client)
C_OBJ = $(C_SRC:%.c=%.o)
C_DEP = $(C_SRC:%.c=%.cdep)

CPP_SRC = $(shell find ./ -name '*.cpp' | grep -v erpc | grep -v mcu2mpu_client)
CPP_OBJ = $(CPP_SRC:%.cpp=%.o)
CPP_DEP = $(CPP_SRC:%.cpp=%.cdep)

ASM_SRC = $(shell find ./ -name '*.S')
ASM_OBJ = $(ASM_SRC:%.S=%.o)
ASM_DEP = $(ASM_SRC:%.S=%.adep)

########################################################################
.PHONY: all clean
#-ffunction-sections -fdata-sections 
#all:$(CPP_DEP)  $(C_DEP) $(ASM_DEP) $(CPP_OBJ) $(C_OBJ) $(ASM_OBJ)
all:  $(ASM_OBJ) $(CPP_OBJ) $(C_OBJ)

	$(CC) $(LDFLAGS) -o "$(TARGET).elf" $(ASM_OBJ) $(C_OBJ) $(CPP_OBJ) -L./Drivers/CMSIS/Lib/GCC -larm_cortexM0l_math

	$(OBJCOPY) $(TARGET).elf $(TARGET).bin -Obinary
	$(OBJCOPY) $(TARGET).elf $(TARGET).hex -Oihex

########################################################################
$(C_OBJ):%.o:%.c
	$(CC) $(CFLAGS) -c $< -o $@ 

########################################################################
$(CPP_OBJ):%.o:%.cpp
	$(CPP) $(CPPFLAGS) -c $< -o $@ 


########################################################################
$(ASM_OBJ):%.o:%.S
	$(AS) -c $< -o $@ $(ASFLAGS)

########################################################################
clean:
	@rm -rf $(TARGET).bin
	@rm -rf $(TARGET).elf
	@rm -rf $(TARGET).hex
	@for i in $(shell find ./ -name '*.o'); do if [ -e $${i} ];then rm $${i};fi;done
	@for i in $(shell find ./ -name '*.cdep'); do if [ -e $${i} ]; then rm $${i};fi;done
	@for i in $(shell find ./ -name '*.adep'); do if [ -e $${i} ]; then rm $${i};fi; done
	@rm -rf $(TARGET) $(TARGET).elf $(TARGET).hex

