###################################################################################
#                                                                                 #
#  This is makefile to build for making libkobuki object libraries or binaries.   #
#                                                                                 #
###################################################################################

# Now macOS can't work!

# This is important directories to compile.
# Don't Rewrite!
current       = `pwd`
lib           = $(current)/lib
source        = $(current)/src
include       = $(current)/include

object_output = $(lib)

example       = $(current)/example

# Allways you use C++ lang.
CXX = g++


CXX_LIB_FLAGS =  -pthread -shared -fPIC -I$(include) -L$(lib)

CXX_DEMO_FLAGS   = -I$(include)


all:


demo:
	@./example/demo


clear:
	rm -rf $(lib)/*
	rm -rf ./example/demo


create_lib:
	$(CXX) $(CXX_LIB_FLAGS) $(source)/DockingController.cpp -o$(lib)/DockingController.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/Translator.cpp -o$(lib)/translator.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/SerialPort.cpp -o$(lib)/SerialPort.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/Thread.cpp -o$(lib)/Thread.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/Transport.cpp $(lib)/SerialPort.so -o$(lib)/Transport.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/KobukiBase.cpp $(lib)/SerialPort.so $(lib)/Transport.so  $(lib)/translator.so -o$(lib)/KobukiBase.so $(lib)/Thread.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/Kobuki_impl.cpp $(lib)/Thread.so $(lib)/KobukiBase.so $(lib)/DockingController.so -o$(lib)/Kobuki_impl.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/libkobuki.cpp $(lib)/Kobuki_impl.so -o$(lib)/libkobuki.so
	$(CXX) $(CXX_LIB_FLAGS) $(source)/kobukicwrapper.cpp $(lib)/libkobuki.so -o$(lib)/kobukicwrapper.so


compile:
	$(CXX) $(CXX_DEMO_FLAGS) -o $(example)/demo $(example)/demo.cpp lib/DockingController.so lib/KobukiBase.so lib/kobukicwrapper.so lib/Kobuki_impl.so lib/libkobuki.so lib/SerialPort.so lib/Thread.so lib/translator.so lib/Transport.so
