#CC=g++
#CFLAGS=-c -g -Wall -rdynamic -D_DEBUG
#LDFLAGS=-g -rdynamic
CC=/opt/parallax/bin/propeller-elf-g++
CFLAGS=-c -Wall -Os -fno-exceptions 
LDFLAGS=-static -fno-exceptions

SOURCES=  \
TinyJS.cpp \
TinyJS_Functions.cpp \
TinyJS_MathFunctions.cpp

OBJECTS=$(SOURCES:.cpp=.o)

all: run_tests Script

run_tests: run_tests.o $(OBJECTS)
	$(CC) $(LDFLAGS) run_tests.o $(OBJECTS) -o $@

Script: Script.o $(OBJECTS)
	$(CC) $(LDFLAGS) Script.o $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f run_tests Script run_tests.o Script.o $(OBJECTS)
