###################################################################################
#                                                                                 #
#  This is makefile to build for making libkobuki object libraries or binaries.   #
#                                                                                 #
###################################################################################

# This is important directories to compile.
# Don't Rewrite!
current       = `pwd`
object        = $(current)/lib
source        = $(current)/src
include       = $(current)/include

object_output = $(object)

example       = $(current)/example/demo.cpp

# Allways you use C++ lang.
CXX = g++


CXX_OBJECT_FLAGS =  -c -I$(include)

CXX_DEMO_FLAGS   =  -I$(include) -L$(object) -pthread


.PHONY:
	create_object
	clear

all:

test:
	echo `ls lib`

clear:
	rm -rf $(object)/*

create_object:
	$(CXX) $(CXX_OBJECT_FLAGS) src/DockingController.cpp -o$(object)/DockingController.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/KobukiBase.cpp        -o$(object)/KobukiBase.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/kobukicwrapper.cpp    -o$(object)/kobukicwrapper.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/Kobuki_impl.cpp       -o$(object)/Kobuki_impl.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/libkobuki.cpp         -o$(object)/libkobuki.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/SerialPort.cpp        -o$(object)/SerialPort.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/Thread.cpp            -o$(object)/Thread.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/Translator.cpp        -o$(object)/translator.o
	$(CXX) $(CXX_OBJECT_FLAGS) src/Transport.cpp         -o$(object)/Transport.o

run:
	$(CXX) $(CXX_DEMO_FLAGS) lib/DockingController.o lib/KobukiBase.o lib/kobukicwrapper.o lib/Kobuki_impl.o lib/libkobuki.o lib/SerialPort.o lib/Thread.o lib/translator.o lib/Transport.o $(example)
