# Nuclei Software Development Kit

[![Build Documentation](https://github.com/Nuclei-Software/nuclei-sdk/workflows/Build%20Documentation/badge.svg)](https://github.com/Nuclei-Software/nuclei-sdk/actions?query=workflow%3A%22Build+Documentation%22)
[![Build SDK](https://github.com/Nuclei-Software/nuclei-sdk/workflows/Build%20SDK/badge.svg)](https://github.com/Nuclei-Software/nuclei-sdk/actions?query=workflow%3A%22Build+SDK%22)


**Nuclei Software Development Kit(Nuclei SDK)** is developed for developing and evaluating software using our FPGA evaluation board.

![Nuclei SDK Diagram](doc/source/asserts/images/nuclei_sdk_diagram.png)

This Nuclei SDK is built based on the **NMSIS** framework, user can access all the APIs provided by **NMSIS** and also the APIs that provided by Nuclei SDK which mainly for on-board peripherals access such as GPIO, UART, SPI and I2C etc.

We also intergated three RTOSes into Nuclei SDK, which are **FreeRTOS**, **UCOSII** and **RTThread**, you can easily find it in the *OS* folder.

## Quick Startup

Wanner to a try with Nuclei SDK, click [Quick Start with Nuclei SDK](https://doc.nucleisys.com/nuclei_sdk/quickstart.html) to start up.

## Requirements
* Ubuntu Linux >=16.04 LTS or Windows >=7
  - **Linux**: GNU Make >= 3.82
  - **Windows**: [Windows Build Tools](https://nucleisys.com/download.php)
* [Nuclei RISCV GNU GCC Toolchain](https://nucleisys.com/download.php)
* [Nuclei OpenOCD](https://nucleisys.com/download.php)

## Directory Structure

Here is the directory structure for this Nuclei SDK.

~~~console
$NUCLEI_SDK_ROOT
├── application
│   ├── baremetal
│   ├── freertos
│   ├── ucosii
│   └── rtthread
├── Build
│   ├── gmsl
│   ├── Makefile.base
│   ├── Makefile.conf
│   ├── Makefile.core
│   ├── Makefile.files
│   ├── Makefile.global
│   ├── Makefile.misc
│   ├── Makefile.rtos
│   ├── Makefile.rules
│   └── Makefile.soc
├── doc
│   ├── build
│   ├── source
│   ├── Makefile
│   └── requirements.txt
├── NMSIS
│   ├── Core
│   ├── DSP
│   ├── NN
│   └── Library
├── OS
│   ├── FreeRTOS
│   ├── UCOSII
│   └── RTThread
├── SoC
│   ├── gd32vf103
│   └── demosoc
├── test
│   ├── core
│   ├── ctest.h
│   ├── LICENSE
│   └── README.md
├── LICENSE
├── Makefile
├── NMSIS_VERSION
├── package.json
├── SConscript
├── README.md
├── setup.bat
└── setup.sh
~~~

* **application**

  This directory contains all the application softwares for this Nuclei SDK.

  The application code can be divided into mainly 4 parts, which are:
  - **Baremetal** applications, which will provide baremetal applications without any OS usage, these applications will be placed in *application/baremetal/* folder.
  - **FreeRTOS** applications, which will provide FreeRTOS applications using FreeRTOS RTOS, placed in *application/freertos/* folder.
  - **UCOSII** applications, which will provide UCOSII applications using UCOSII RTOS, placed in *application/ucosii/* folder.
  - **RTThread** applications, which will provide RT-Thread applications using RT-Thread RTOS, placed in *application/rtthread/* folder.

* **SoC**

  This directory contains all the supported SoCs for this Nuclei SDK, the directory name for SoC and its boards should always in lower case.

  Here we mainly support Nuclei processor cores running on Nuclei FPGA evaluation board(MCU200T/DDR200T), the support package placed in *SoC/demosoc/*.

  In each SoC's include directory, *nuclei_sdk_soc.h* must be provided, and include the soc header file, for example, *SoC/demosoc/Common/Include/nuclei_sdk_soc.h*.

  In each SoC Board's include directory, *nuclei_sdk_hal.h* must be provided, and include the board header file, for example, *SoC/demosoc/Board/nuclei_fpga_eval/Include/nuclei_sdk_hal.h*.

* **Build**

  This directory contains the key part of the build system based on Makefile for Nuclei SDK.

* **NMSIS**

  This directory contains the NMSIS header files, which is widely used in this Nuclei SDK,
  you can check the *[NMSIS_VERSION](NMSIS_VERSION)* file to know the current *NMSIS* version used in **Nuclei-SDK**.

  We will also sync the changes in [NMSIS project](https://github.com/Nuclei-Software/NMSIS) when it provided a new release.

* **OS**

  This directory provided three RTOS package we suppported which are **FreeRTOS**, **UCOSII** and **RT-Thread**.

* **LICENSE**

  Nuclei SDK license file.

* **NMSIS_VERSION**

  NMSIS Version file. It will show current NMSIS version used in Nuclei SDK.

* **package.json**

  PlatformIO package json file for Nuclei SDK, used in [Nuclei Plaform for PlatformIO](https://platformio.org/platforms/nuclei/)

* **SConscript**

  RT-Thread package scons build script, used in [RT-Thread package development](https://www.rt-thread.org/document/site/development-guide/package/package/).

* **Makefile**

  An external Makefile just for build, run, debug application without cd to any coresponding application directory, such as *application/baremetal/helloworld/*.

* **setup.sh**

  Nuclei SDK environment setup script for **Linux**. You need to create your own `setup_config.sh`.
  ~~~shell
  NUCLEI_TOOL_ROOT=/path/to/your_tool_root
  ~~~

  In the **$NUCLEI_TOOL_ROOT** for **Linux**, you need to have Nuclei RISC-V GNU GCC toolchain and OpenOCD installed as below.
  ~~~
  $NUCLEI_TOOL_ROOT
  ├── gcc
  │   ├── bin
  │   ├── include
  │   ├── lib
  │   ├── libexec
  │   ├── riscv-nuclei-elf
  │   └── share
  └── openocd
      ├── bin
      ├── contrib
      ├── distro-info
      ├── OpenULINK
      ├── scripts
      └── share
  ~~~

* **setup.bat**

  Nuclei SDK environment setup bat script for **Windows**. You need to create your own `setup_config.bat`.
  ~~~bat
  set NUCLEI_TOOL_ROOT=\path\to\your_tool_root
  ~~~

  In the **%NUCLEI_TOOL_ROOT%** for **Windows**, you need to have Nuclei RISC-V GNU GCC toolchain, necessary Windows build tools and OpenOCD installed as below.
  ~~~console
  %NUCLEI_TOOL_ROOT%
  ├── build-tools
  │   ├── bin
  │   ├── gnu-mcu-eclipse
  │   └── licenses
  ├── gcc
  │   ├── bin
  │   ├── include
  │   ├── lib
  │   ├── libexec
  │   ├── riscv-nuclei-elf
  │   └── share
  └── openocd
      ├── bin
      ├── contrib
      ├── distro-info
      ├── OpenULINK
      ├── scripts
      └── share
  ~~~

## How to use
1. Create and modify your own setup config
   * For **Linux**, create `setup_config.sh` in **$NUCLEI_SDK_ROOT**.
   * For **Windows**, create `setup_config.bat` in **%NUCLEI_SDK_ROOT%**.
2. Source the environment script right in **NUCLEI_SDK_ROOT**
   * For **Linux**: `source setup.sh`
   * For **Windows**: `setup.bat`
3. Build and run application.
   * **Note:** By default, the SoC and Board is set to ``demosoc`` and ``nuclei_fpga_eval``,
     if you don't pass any **SOC** and **BOARD** variable in Make command,
     it will use the default SoC and Board.
   * Assume that you will run this application -> *application/baremetal/helloworld/*.
   * cd *application/baremetal/helloworld/*
   * you can run *make help* to show help message.
   * We provided different Nuclei Core configurations(CORE=<your_core>) we supported, see *Build/Makefile.core*.
     - such as `CORE=n305`
   * We support three download modes(DOWNLOAD=<mode>) for different applications.
     - **flashxip**: Program will to be download into flash and run directly in Flash
     - **flash**: Program will be download into flash, when running, program will be copied to ilm/ram and run in ilm/ram
     - **ilm**: Program will be download into ilm/ram and run directly in ilm/ram, program lost when poweroff
   * For example, if you want to build your application for *CORE=n305 DOWNLOAD=ilm*, you can easily run this command:
     ~~~shell
     make CORE=n305 DOWNLOAD=ilm all
     ~~~
   * If you want to upload your application for *CORE=n305 DOWNLOAD=ilm*, you can easily run this command:
     ~~~shell
     make CORE=n305 DOWNLOAD=ilm upload
     ~~~
   * (Option 1)If you want to debug your application for *CORE=n305 DOWNLOAD=ilm*:
     - First open a new terminal in the same application folder and run: `make CORE=n305 DOWNLOAD=ilm run_openocd`
     - Then run this command `make CORE=n305 DOWNLOAD=ilm run_gdb` in the existing terminal, then you can debug it using gdb,
       if you want to load your program, you need to type `load` to achieve it.
     - **Notice**: Since version 0.2.4, you can also pass extra `GDB_PORT=<portno>`, to change to use new gdb port other than default
       `3333`, for example, `make CORE=n305 DOWNLOAD=ilm GDB_PORT=3344 run_openocd` and `make CORE=n305 DOWNLOAD=ilm GDB_PORT=3344 run_gdb`
   * (Option 2)If you want to debug your application for *CORE=n305 DOWNLOAD=ilm*:
     ~~~shell
     make CORE=n305 DOWNLOAD=ilm debug
     ~~~
   * If you want to use UART terminal tool to view the UART message, you can choose `screen` or `minicom` in Linux, `teraterm` in Windows, the default UART baudrate we use is `115200`.

## Knowledge book

* If you want to learn more about **Nuclei SDK documentation**, please click [Nuclei SDK documentation](http://doc.nucleisys.com/nuclei_sdk)

* If you need to build a new application, or change **CORE** or **DOWNLOAD** option, please make sure that you have clean the project by `make clean`

* If you want to specify additional compiler flags, please follow this guidance in your application Makefile.
  - Pass common compiler flags to all c/asm/cpp compiler, you can use **COMMON_FLAGS** in Makefile, such as `COMMON_FLAGS := -O3 -funroll-loops -fpeel-loops`
  - Pass C compiler only flags to c compiler, you can use **CFLAGS** in Makefile, such as `CFLAGS := -O3 -funroll-loops -fpeel-loops`
  - For ASM compiler only flags, you can use **ASMFLAGS**, for CPP compiler only flags, you can use **CXXFLAGS**.

* If you want to pass additional linker flags, you can use **LDFLAGS**, and if you have additional library directories, you can use **LIBDIRS** to specify library directories.

* The preprovided applications and its makefile is the best startup examples about how to use Nuclei SDK.

* Pass extra `V=1` to your make command, it will show verbose compiling information, otherwise it will only show basic information. Sample output with extra `V=1`
  ~~~console
  $ make V=1 all
  Current Configuration: RISCV_ARCH=rv32imafdc RISCV_ABI=ilp32d SOC=demosoc BOARD=nuclei_fpga_eval CORE=n307fd DOWNLOAD=ilm
  "Assembling : " ../../../OS/FreeRTOS/Source/portable/GCC/portasm.S
  riscv-nuclei-elf-gcc -g -march=rv32imafdc -mabi=ilp32d -mcmodel=medany -ffunction-sections -fdata-sections -fno-common   -DDOWNLOAD_MODE=DOWNLOAD_MODE_ILM -I. -I../../../NMSIS/Include -I../../../OS/FreeRTOS/Source/include -I../../../OS/FreeRTOS/Source/  portable/GCC -I../../../SoC/demosoc/Board/nuclei_fpga_eval/Include -I../../../SoC/demosoc/Common/Include -MMD -MT ../../../OS/FreeRTOS/Source/  portable/GCC/portasm.S.o -MF ../../../OS/FreeRTOS/Source/portable/GCC/portasm.S.o.d -c -o ../../../OS/FreeRTOS/Source/portable/GCC/  portasm.S.o ../../../OS/FreeRTOS/Source/portable/GCC/portasm.S
  "Assembling : " ../../../SoC/demosoc/Common/Source/GCC/intexc_demosoc.S
  riscv-nuclei-elf-gcc -g -march=rv32imafdc -mabi=ilp32d -mcmodel=medany -ffunction-sections -fdata-sections -fno-common   -DDOWNLOAD_MODE=DOWNLOAD_MODE_ILM -I. -I../../../NMSIS/Include -I../../../OS/FreeRTOS/Source/include -I../../../OS/FreeRTOS/Source/  portable/GCC -I../../../SoC/demosoc/Board/nuclei_fpga_eval/Include -I../../../SoC/demosoc/Common/Include -MMD -MT ../../../SoC/demosoc/Common/  Source/GCC/intexc_demosoc.S.o -MF ../../../SoC/demosoc/Common/Source/GCC/intexc_demosoc.S.o.d -c -o ../../../SoC/demosoc/Common/Source/GCC/  intexc_demosoc.S.o ../../../SoC/demosoc/Common/Source/GCC/intexc_demosoc.S
  "Assembling : " ../../../SoC/demosoc/Common/Source/GCC/startup_demosoc.S
  ~~~

## [Contributing](https://doc.nucleisys.com/nuclei_sdk/contribute.html)

## [Changelog](https://doc.nucleisys.com/nuclei_sdk/changelog.html)
