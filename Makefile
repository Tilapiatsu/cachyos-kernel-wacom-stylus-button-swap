KERNELRELEASE ?= $(shell uname -r)

obj-m += wacom.o

wacom-objs := \
	src/wacom_wac.o \
	src/wacom_sys.o

KDIR := /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

all:
	make -C $(KDIR) M=$(PWD) LLVM=1 modules

clean:
	make -C $(KDIR) M=$(PWD) clean
