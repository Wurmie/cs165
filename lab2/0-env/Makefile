obj-m += kflag.o
all:
	sudo make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	sudo make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
insert:
	sudo insmod kflag.ko
remove:
	sudo rmmod kflag