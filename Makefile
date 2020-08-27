CC=gcc
TARGET=winedog
C_FILES=./libc/string/memcmp.c \
	./libc/string/memset.c \
	./libc/string/strcat.c \
	./libc/string/strchr.c \
	./libc/string/strcmp.c \
	./libc/string/strcpy.c \
	./libc/string/strlen.c \
	./libc/string/strncmp.c \
	./libc/string/strstr.c \
	./libc/string/strutil.c \
	./libc/string/ctos.c \
	./kernel/tty.c \
	./kernel/io.c \
	./kernel.c
OBJS=$(C_FILES:.c=.o)

all compile: $(TARGET)
all: finale
.PHONY: all compile clean finale

%.o:
	$(CC) -c $(@:.o=.c) -o $@ -ffreestanding -fno-exceptions -m32

$(TARGET): $(OBJS)
	$(shell nasm -f elf start.asm -o start.o)
	$(shell i586-elf-gcc -m32 -o kernel.o -c kernel.c)
	$(CC) -m32 -nostdlib -nodefaultlibs start.o $? -T linker.ld -o $(TARGET)

finale:
	$(shell cp $(TARGET) ./iso/boot/$(TARGET))
	$(shell grub-mkrescue iso --output=$(TARGET).iso)


clean:
	rm -f *.o $(TARGET)
	find . -name \*.o | xargs --no-run-if-empty rm
