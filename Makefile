MODULE_NAME := elan_i2c

LINUXINCLUDE := -I$(SUBDIRS)/include $(LINUXINCLUDE)

obj-m			+= $(MODULE_NAME).o
obj-m			+= i2c-smbus.o
obj-m			+= i2c-i801.o
obj-m                   += psmouse.o

psmouse-objs := psmouse-base.o synaptics.o focaltech.o

psmouse-y	+= elan_i2c_i2c.o
psmouse-y	+= elan_i2c_smbus.o
psmouse-y       += alps.o
psmouse-y       += byd.o
psmouse-y       += elantech.o
psmouse-y       += hgpk.o
psmouse-y   	+= logips2pp.o
psmouse-y    	+= lifebook.o
psmouse-y       += sentelic.o
psmouse-y       += trackpoint.o
psmouse-y    	+= touchkit_ps2.o
psmouse-y     	+= cypress_ps2.o
psmouse-y     	+= vmmouse.o

elan_i2c-objs := elan_i2c_core.o
elan_i2c-y	+= elan_i2c_i2c.o
elan_i2c-y	+= elan_i2c_smbus.o


KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

install: $(MODULE_NAME).ko $(MODULE_NAME).mod.c psmouse.ko psmouse.mod.c
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install

clean:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
