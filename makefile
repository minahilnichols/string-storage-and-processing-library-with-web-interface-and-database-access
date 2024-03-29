# C compiler
CC          =	gcc

# Flags that are sent to the compiler
CFLAGS      =	-Wall -ansi -pedantic -g

# Directories where the compiler can find things
INCLUDES    =	-Iinclude

# Object files to be created
OBJS    	=	listio.o

# Source File
SRC			=	listio.c

# Name of the library to be created
LIBNAME		= 	liblistio.a

all : mklib main

mklib: compile
	ar cr $(LIBNAME) $(OBJS)

compile:
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJS) $(INCLUDES)

main: link db getfiles
	$(CC) main.o -o a4 -llistio -lmysqlclient -L. -L/usr/lib/x86_64-linux-gnu/

link:
	$(CC) $(CFLAGS) main.c -o main.o -c $(INCLUDES)

db: db.o
		gcc db.o -o db -lmysqlclient -L/usr/include/mysql

db.o: db.c
		gcc db.c -o db.o -c

getfiles: getfiles.o
		gcc getfiles.o -o getfiles -lmysqlclient -L/usr/include/mysql

getfiles.o: getfiles.c
		gcc getfiles.c -o getfiles.o -c

clean:
	@ rm *.o
	@ rm *.a
	@ rm a4
	@ rm files/*.html
	@ rm db
	@ rm getfiles
