SRC = ./
INC = include
LIBS = -lusb-1.0
CC = gcc
CFLAGS = -g -O2 
DEFS = -DPACKAGE_NAME=\"mochad\" -DPACKAGE_TARNAME=\"mochad\" -DPACKAGE_VERSION=\"0.1.15\" -DPACKAGE_STRING=\"mochad\ 0.1.15\" -DPACKAGE_BUGREPORT=\"mmauka@users.sourceforge.net\" -DPACKAGE_URL=\"\" -DPACKAGE=\"mochad\" -DVERSION=\"0.1.15\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_FCNTL_H=1 -DHAVE_NETINET_IN_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_SYS_SOCKET_H=1 -DHAVE_SYSLOG_H=1 -DHAVE_UNISTD_H=1 -DHAVE_FORK=1 -DHAVE_VFORK=1 -DHAVE_WORKING_VFORK=1 -DHAVE_WORKING_FORK=1 -DHAVE_STDLIB_H=1 -DHAVE_MALLOC=1 -DHAVE_ALARM=1 -DHAVE_MEMSET=1 -DHAVE_SELECT=1 -DHAVE_SOCKET=1 -DHAVE_STRERROR=1 -DHAVE_STRTOL=1 -DHAVE_STRTOUL=1


mochad_SOURCES = mochad.c decode.c encode.c global.c x10state.c x10_write.c \
		 decode.h encode.h global.h x10state.h x10_write.h

mochad_OBJECTS = mochad.o decode.o encode.o \
	global.o x10state.o x10_write.o


# -----------------------------------------------------------------------
# Makefile script for building all programs and docs

all: clean build

# -----------------------------------------------------------------------


# -----------------------------------------------------------------------
# Makefile script for building all programs

code: 	build

# -----------------------------------------------------------------------

build: mochad.o decode.o encode.o global.o x10state.o x10_write.o
	$(CC) $(DEFS) $(LIBS) $(CFLAGS) mochad.o decode.o encode.o \
	global.o x10state.o x10_write.o -o mochad

mochad.o: $(SRC)/mochad.c $(SRC)/global.h $(SRC)/decode.h $(SRC)/encode.h $(SRC)/x10state.h $(SRC)/x10_write.h
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/mochad.c
	
decode.o: $(SRC)/mochad.c $(SRC)/global.h $(SRC)/encode.h $(SRC)/x10state.h $(SRC)/x10_write.h
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/decode.c

encode.o: $(SRC)/mochad.c $(SRC)/global.h $(SRC)/decode.h $(SRC)/x10state.h $(SRC)/x10_write.h
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/encode.c

x10state.o: $(SRC)/mochad.c $(SRC)/global.h $(SRC)/decode.h
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/x10state.c

x10_write.o: $(SRC)/mochad.c $(SRC)/global.h
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/x10_write.c
	
global.o: $(SRC)/mochad.c 
	$(CC) $(DEFS) $(CFLAGS)-c $(SRC)/global.c	
	
# ---------------------------------------------------------------------

#----------------clean old objects for rebuilding --------------------
clean:
	rm *.o -f