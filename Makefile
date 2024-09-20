BASENAME  = dkr
REGION  := us
VERSION  := v1

LIBULTRA_VERSION_DEFINE := -DBUILD_VERSION=4 -DBUILD_VERSION_STRING=\"2.0G\" -DRAREDIFFS

# Whether to hide commands or not
VERBOSE ?= 0
ifeq ($(VERBOSE),0)
  V := @
endif


# Colors

NO_COL  := \033[0m
RED     := \033[0;31m
RED2    := \033[1;31m
GREEN   := \033[0;32m
YELLOW  := \033[0;33m
BLUE    := \033[0;34m
PINK    := \033[0;35m
CYAN    := \033[0;36m

# Directories


ifeq ($(REGION)$(VERSION),usv1)
BIN_DIRS  = assets
BUILD_DIR = build
SRC_DIR   = src
ASM_DIRS  = asm asm/data asm/data/asm asm/libultra asm/data/libultra asm/nonmatchings asm/data/lib/src asm/lib/asm asm/data/lib/asm asm/data/lib/src/gu asm/data/lib/src/os
HASM_DIRS = src/asm src/lib/src/os src/lib/src/gu src/lib/src/libc 
else
BIN_DIRS  = assets_$(REGION)_$(VERSION)
BUILD_DIR = build_$(REGION)_$(VERSION)
SRC_DIR   = src_$(REGION)_$(VERSION)
ASM_DIRS   = asm_$(REGION)_$(VERSION) asm_$(REGION)_$(VERSION)/data asm_$(REGION)_$(VERSION)/libultra asm_$(REGION)_$(VERSION)/data/libultra asm_$(REGION)_$(VERSION)/nonmatchings
ASM_DIRS  += asm_$(REGION)_$(VERSION)/data/lib/src asm_$(REGION)_$(VERSION)/lib/asm asm_$(REGION)_$(VERSION)/data/lib/asm asm_$(REGION)_$(VERSION)/data/lib/src/gu
endif

LIBULTRA_SRC_DIRS = $(SRC_DIR)/lib

DEFINE_SRC_DIRS   = $(SRC_DIR) $(LIBULTRA_SRC_DIRS) $(LIBULTRA_SRC_DIRS)/src/os $(LIBULTRA_SRC_DIRS)/src/io 
DEFINE_SRC_DIRS  += $(LIBULTRA_SRC_DIRS)/src/sc $(LIBULTRA_SRC_DIRS)/src/io $(LIBULTRA_SRC_DIRS)/src/libc $(LIBULTRA_SRC_DIRS)/src/gu $(LIBULTRA_SRC_DIRS)/src/debug
DEFINE_SRC_DIRS  += $(LIBULTRA_SRC_DIRS)/src/audio $(LIBULTRA_SRC_DIRS)/src/audio/mips1
SRC_DIRS = $(DEFINE_SRC_DIRS)

TOOLS_DIR = tools

UNAME_S := $(shell uname -s)
ifeq ($(OS),Windows_NT)
	$(error Native Windows is currently unsupported for building this repository, use WSL instead c:)
else ifeq ($(UNAME_S),Linux)
	DETECTED_OS := linux
else ifeq ($(UNAME_S),Darwin)
	DETECTED_OS := macos
endif

RECOMP_DIR := $(TOOLS_DIR)/ido-recomp/$(DETECTED_OS)

# Files

S_FILES         = $(foreach dir,$(ASM_DIRS) $(HASM_DIRS),$(wildcard $(dir)/*.s))
C_FILES         = $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
BIN_FILES       = $(foreach dir,$(BIN_DIRS),$(wildcard $(dir)/*.bin))

O_FILES := $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file).o) \
           $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file).o) \
           $(foreach file,$(BIN_FILES),$(BUILD_DIR)/$(file).o)

GLOBAL_ASM_C_FILES != grep -rl 'GLOBAL_ASM(' $(SRC_DIRS)
GLOBAL_ASM_O_FILES = $(foreach file,$(GLOBAL_ASM_C_FILES),$(BUILD_DIR)/$(SRC_DIR)$(file:.c=.o))


find-command = $(shell which $(1) 2>/dev/null)

# Tools

ifeq ($(shell type mips-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  CROSS := mips-linux-gnu-
else ifeq ($(shell type mips64-linux-gnu-ld >/dev/null 2>/dev/null; echo $$?), 0)
  CROSS := mips64-linux-gnu-
else
  CROSS := mips64-elf-
endif

AS       = $(CROSS)as
CPP      = cpp
LD       = $(CROSS)ld
OBJCOPY  = $(CROSS)objcopy
PYTHON   = python3
GCC      = gcc

XGCC     = mips64-elf-gcc

GREP     = grep -rl

#Options
CC       = $(RECOMP_DIR)/cc
SPLAT    ?= $(PYTHON) -m splat split
CRC      = $(V)$(TOOLS_DIR)/n64crc $(BUILD_DIR)/$(BASENAME).$(REGION).$(VERSION).z64

OPT_FLAGS      = -O2

MIPSISET       = -mips1

DEFINES := _FINALROM NDEBUG TARGET_N64 __sgi F3DDKR_GBI
DEFINES += VERSION_$(REGION)_$(VERSION)

VERIFY = verify

ifeq ($(NON_MATCHING),1)
	DEFINES += NON_MATCHING
	DEFINES += AVOID_UB
	VERIFY = no_verify
else
	DEFINES += ANTI_TAMPER
endif

C_DEFINES := $(foreach d,$(DEFINES),-D$(d)) $(LIBULTRA_VERSION_DEFINE) -D_MIPS_SZLONG=32 -D_LANGUAGE_C
ASM_DEFINES = --defsym _MIPS_SIM=1 --defsym mips=1

INCLUDE_CFLAGS  = -I . -I include -I include/libc  -I include/PR -I include/sys -I $(BIN_DIRS) -I $(SRC_DIR) -I $(LIBULTRA_SRC_DIRS)
INCLUDE_CFLAGS += -I $(LIBULTRA_SRC_DIRS)/src/gu -I $(LIBULTRA_SRC_DIRS)/src/libc -I $(LIBULTRA_SRC_DIRS)/src/io  -I $(LIBULTRA_SRC_DIRS)/src/sc 
INCLUDE_CFLAGS += -I $(LIBULTRA_SRC_DIRS)/src/audio -I $(LIBULTRA_SRC_DIRS)/src/os

ASFLAGS        = -march=vr4300 -32 -G0 $(ASM_DEFINES) $(INCLUDE_CFLAGS)
OBJCOPYFLAGS   = -O binary

# Files requiring pre/post-processing
GLOBAL_ASM_C_FILES := $(shell $(GREP) GLOBAL_ASM $(SRC_DIR) </dev/null 2>/dev/null)
GLOBAL_ASM_O_FILES := $(foreach file,$(GLOBAL_ASM_C_FILES),$(BUILD_DIR)/$(file).o)

#IDO Warnings to Ignore. These are coding style warnings we don't follow
CC_WARNINGS := -fullwarn -Xfullwarn -woff 838,649,624

CFLAGS := -G 0 -non_shared -verbose -Xcpluscomm -nostdinc -Wab,-r4300_mul
CFLAGS += $(C_DEFINES)
CFLAGS += $(INCLUDE_CFLAGS)

CHECK_WARNINGS := -Wall -Wextra -Wno-format-security -Wno-unknown-pragmas -Wunused-function -Wno-unused-parameter -Werror-implicit-function-declaration
CHECK_WARNINGS += -Werror-implicit-function-declaration -Wno-unused-variable -Wno-missing-braces -Wno-int-conversion -Wno-main
CHECK_WARNINGS += -Wno-builtin-declaration-mismatch -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast -Wno-switch
CC_CHECK := $(GCC) -fsyntax-only -fno-builtin -funsigned-char -std=gnu90 -m32 -D_LANGUAGE_C $(CHECK_WARNINGS) $(INCLUDE_CFLAGS) $(C_DEFINES)

TARGET     = $(BUILD_DIR)/$(BASENAME).$(REGION).$(VERSION)
LD_SCRIPT  = $(BASENAME).$(REGION).$(VERSION).ld

LD_FLAGS   = -T $(LD_SCRIPT) -T undefined_funcs_auto.$(REGION).$(VERSION).txt  -T undefined_syms_auto.$(REGION).$(VERSION).txt -T undefined_syms.$(REGION).$(VERSION).txt
LD_FLAGS  += -Map $(TARGET).map

ifeq ($(REGION)$(VERSION),usv1)
LD_FLAGS_EXTRA  =
LD_FLAGS_EXTRA += $(foreach sym,$(UNDEFINED_SYMS),-u $(sym))
else
LD_FLAGS_EXTRA  =
LD_FLAGS_EXTRA += $(foreach sym,$(UNDEFINED_SYMS),-u $(sym))
endif

ASM_PROCESSOR_DIR := $(TOOLS_DIR)/asm-processor
ASM_PROCESSOR      = $(PYTHON) $(ASM_PROCESSOR_DIR)/build.py

### Optimisation Overrides
####################### LIBULTRA #########################

$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/%.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/audio/%.c.o: OPT_FLAGS := -O3
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/audio/mips1/%.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/os/%.c.o: OPT_FLAGS := -O1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/%.c.o: OPT_FLAGS := -O1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/vimgr.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/pimgr.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/motor.c.o: OPT_FLAGS := -O2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/xprintf.c.o : OPT_FLAGS := -O3
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/audio/env.c.o: OPT_FLAGS := -g
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/llcvt.c.o: OPT_FLAGS := -O1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/llcvt.c.o: MIPSISET := -mips3 -32
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/ll.c.o: OPT_FLAGS := -O1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/ll.c.o: MIPSISET := -mips3 -32
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/ldiv.c.o: OPT_FLAGS := -O3
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/ldiv.c.o: MIPSISET := -mips2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/xldtob.c.o: OPT_FLAGS := -O3
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/xldtob.c.o: MIPSISET := -mips2

$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/%.c.o: MIPSISET := -mips2
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/audio/mips1/%.c.o: MIPSISET := -mips1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/pimgr.c.o: MIPSISET := -mips1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/sc/sched.c.o: MIPSISET := -mips1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/io/motor.c.o: MIPSISET := -mips1
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/audio/env.c.o: MIPSISET := -mips1

#Ignore warnings for libultra files
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/%.c.o: CC_WARNINGS := -w
$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/%.c.o: CC_CHECK := :

####################### MATH UTIL #########################

$(BUILD_DIR)/asm/math_util.s.o: MIPSISET := -mips2
$(BUILD_DIR)/asm/collision.s.o: MIPSISET := -mips2

### Targets

default: all

all: $(VERIFY)

ldflags:
	$(V)printf "[$(PINK) LDFLAGS $(NO_COL)]: $(LD_FLAGS)\n[$(PINK) EXTRA $(NO_COL)]: $(LD_FLAGS_EXTRA)\n"

dirs:
	$(foreach dir,$(SRC_DIRS) $(ASM_DIRS) $(HASM_DIRS) $(BIN_DIRS),$(shell mkdir -p $(BUILD_DIR)/$(dir)))

verify: $(TARGET).z64
	@sha1sum -c $(BASENAME).$(REGION).$(VERSION).sha1

no_verify: $(TARGET).z64
	@echo "Skipping SHA1SUM check!"

extract: tools
	$(SPLAT) splat_files/$(BASENAME).$(REGION).$(VERSION).yaml

extractall: tools
	$(SPLAT) splat_files/$(BASENAME).us.v1.yaml
	$(SPLAT) splat_files/$(BASENAME).pal.v1.yaml
	$(SPLAT) splat_files/$(BASENAME).jpn.v1.yaml
	$(SPLAT) splat_files/$(BASENAME).us.v2.yaml
	$(SPLAT) splat_files/$(BASENAME).pal.v2.yaml

dependencies: tools
	$(V)make -C $(TOOLS_DIR)
	$(V)$(PYTHON) -m pip install -r requirements.txt #Installing the splat dependencies

clean:
	rm -rf $(BUILD_DIR)
	
cleanall:
	rm -rf build
	rm -rf build_us_v2
	rm -rf build_pal_v1
	rm -rf build_jpn_v1
	rm -rf build_pal_v2
	rm -rf build_jpn_v2

distclean: clean
	rm -rf $(ASM_DIRS)
	rm -rf $(BIN_DIRS)
	rm -f *auto.$(REGION).$(VERSION).txt
	rm -f $(LD_SCRIPT)

distcleanall: cleanall
	rm -rf asm
	rm -rf asm_us_v2
	rm -rf asm_pal_v1
	rm -rf asm_jpn_v1
	rm -rf asm_pal_v2
	rm -rf asm_jpn_v2
	rm -rf assets
	rm -rf assets_us_v2
	rm -rf assets_pal_v1
	rm -rf assets_pal_v2
	rm -rf assets_jpn_v1
	rm -f *auto.*.txt
	rm -f dkr.us.v1.ld
	rm -f dkr.us.v2.ld
	rm -f dkr.pal.v1.ld
	rm -f dkr.pal.v2.ld
	rm -f dkr.jpn.v1.ld
	rm -f *auto.us.v1.txt
	rm -f *auto.pal.v1.txt
	rm -f *auto.jpn.v1.txt
	rm -f *auto.us.v2.txt
	rm -f *auto.pal.v2.txt

#When you just need to wipe old symbol names and re-extract
cleanextract: distclean extract

#When you just need to wipe old symbol names and re-extract
cleanextractall: distcleanall extractall

#Put the build folder into expected for use with asm-differ. Only run this with a matching build.
expected: verify
	mkdir -p expected
	rm -rf expected/$(BUILD_DIR)
	cp -r $(BUILD_DIR)/ expected/

### Recipes

$(GLOBAL_ASM_O_FILES): CC := $(ASM_PROCESSOR) $(CC) -- $(AS) $(ASFLAGS) --

$(TARGET).elf: dirs $(LD_SCRIPT) $(BUILD_DIR)/$(LIBULTRA) $(O_FILES)
	$(V)$(LD) $(LD_FLAGS) $(LD_FLAGS_EXTRA) -o $@
	@printf "[$(PINK) Linker $(NO_COL)]  $<\n"

ifndef PERMUTER
$(GLOBAL_ASM_O_FILES): $(BUILD_DIR)/%.c.o: %.c
	$(V)$(CC_CHECK) $<
	@printf "[$(YELLOW) check $(NO_COL)] $<\n"
	$(V)$(CC) -c $(CFLAGS) $(CC_WARNINGS) $(OPT_FLAGS) $(MIPSISET) -o $@ $<
	@printf "[$(GREEN) ido5.3 + asm $(NO_COL)]  $<\n"
endif

# non asm-processor recipe
$(BUILD_DIR)/%.c.o: %.c
#	@$(CC_CHECK) $<
	$(V)$(CC) -c $(CFLAGS) $(CC_WARNINGS) $(OPT_FLAGS) $(MIPSISET) -o $@ $<
	@printf "[$(GREEN) ido5.3 $(NO_COL)]  $<\n"

$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/llcvt.c.o: $(LIBULTRA_SRC_DIRS)/src/libc/llcvt.c
	@printf "[$(PINK) mips3 $(NO_COL)]  $<\n"
	$(V)$(CC)  -c $(CFLAGS) $(CC_WARNINGS) $(OPT_FLAGS) $(MIPSISET) -o $@ $<
	$(V)$(PYTHON) tools/patchmips3.py $@ || rm $@

$(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/src/libc/ll.c.o: $(LIBULTRA_SRC_DIRS)/src/libc/ll.c
	@printf "[$(PINK) mips3 $(NO_COL)]  $<\n"
	$(V)$(CC)  -c $(CFLAGS) $(CC_WARNINGS) $(OPT_FLAGS) $(MIPSISET) -o $@ $<
	$(V)$(PYTHON) tools/patchmips3.py $@ || rm $@


$(BUILD_DIR)/$(LIBULTRA): $(LIBULTRA)
	@mkdir -p $$(dirname $@)

# libultra asm files need to be pre-processed with the C compiler first
# $(BUILD_DIR)/$(LIBULTRA_SRC_DIRS)/%.s.o: $(LIBULTRA_SRC_DIRS)/%.s
# 	$(V)$(ASM_PROCESSOR) $(CC) -- $(AS) $(ASFLAGS) -- -c $(CFLAGS) $(CC_WARNINGS) $(OPT_FLAGS) $(MIPSISET) -o $@ $<
# 	@printf "[$(GREEN)  ASSEMBLER CC  $(NO_COL)]  $<\n"

$(BUILD_DIR)/%.s.o: %.s
	$(V)$(AS) $(ASFLAGS) -o $@ $<
	@printf "[$(GREEN)  ASSEMBLER   $(NO_COL)]  $<\n"

$(BUILD_DIR)/%.bin.o: %.bin
	$(V)$(LD) -r -b binary -o $@ $<
	@printf "[$(PINK) Linker $(NO_COL)]  $<\n"

$(TARGET).bin: $(TARGET).elf
	$(V)$(OBJCOPY) $(OBJCOPYFLAGS) $< $@
	@printf "[$(CYAN) Objcopy $(NO_COL)]  $<\n"

$(TARGET).z64: $(TARGET).bin
	@printf "[$(BLUE) CopyRom $(NO_COL)]  $<\n"
	$(V)$(TOOLS_DIR)/CopyRom.py $< $@
	@printf "[$(GREEN) CRC $(NO_COL)]  $<\n"
	@$(CRC)

### Settings
.SECONDARY:
.PHONY: all clean default
SHELL = /bin/bash -e -o pipefail
