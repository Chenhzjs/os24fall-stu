all: printk.o rand.o string.o

printk.o: printk.c
	${GCC} ${CFLAG} -c printk.c
	
rand.o: rand.c
	${GCC} ${CFLAG} -c rand.c	

string.o: string.c
	${GCC} ${CFLAG} -c string.c	

clean:
	$(shell rm *.o 2>/dev/null)