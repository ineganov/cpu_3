all:
	mips-as -mips1 main.S -o main.o
	mips-ld main.o --section-start .text=0x00000000 -o main
	mips-objdump -Dz --section=.text main > program_objdump.txt
	./objdump_convert program_objdump.txt program.txt
