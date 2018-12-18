##############################################
# Makefile
##############################################
#PATH_TO_SDK := /home/ywang75/study/3rd_party
PATH_TO_SDK := /usr

BIN := test
  
CC := g++
CFLAGS := -O0 -g -std=c++11 -DENABLE_DEBUG

SOURCE := $(wildcard *.cpp)
OBJS := $(patsubst %.cpp, %.o, $(SOURCE))

CC_INC :=  -I/home/ywang75/study/3rd_party/include -I. -I../ -I$(PATH_TO_SDK)/include/ -I$(PATH_TO_SDK)/include/gstreamer-1.0 -I$(PATH_TO_SDK)/include/glib-2.0 -I$(PATH_TO_SDK)/lib/glib-2.0/include
LD_INC := -L/home/ywang75/study/3rd_party/lib/ -L$(PATH_TO_SDK)/lib/
LD_LIB := -lsqlite3 -lpthread -lboost_system -lboost_thread -lboost_context -lboost_log -lboost_log_setup
  
all : $(BIN)
$(BIN) : $(OBJS)
	@$(CC) $(CFLAGS) $(OBJS) -o $(BIN) $(CC_INC) $(LD_INC) $(LD_LIB)

%.o : %.cpp
	@$(CC) $(CFLAGS) -c $< -o $@ $(CC_INC) 
.PHONY : clean
  
clean :
	@rm -f $(BIN) $(OBJS) *.o

