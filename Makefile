#
# @file Makefile
# @author XAVIER DUPUIS / OLIVIER SAINT-CYR
# @e      xavier0978@hotmail.fr /  saintcyr.olivier1@gmail.com
# @brief 
# @version 0.1
# @date 2020-12-16
# 
# @copyright Copyright (c) 2020
#

CC=g++
CCFLAGS = -std=c++17
CFLAGS=-W -Wall -ansi -pedantic
LDFLAGS=-lm

SRC_DIR=src
BIN_DIR=bin
DEP_DIR=dep
BUILD_DIR=build
TEST_DIR=test
EXEC=program.out

SOURCES=$(sort $(shell find $(SRC_DIR) -name '*.cpp'))
OBJECTS=$(SOURCES:$(SRC_DIR)/%.cpp=$(BIN_DIR)/%.o)
DEPENDANCIES := $(OBJECTS:.o=.d)

TEST_SOURCES=$(sort $(shell find $(TEST_DIR)/$(SRC_DIR) -name '*.cpp'))
TEST_OBJECTS=$(TEST_SOURCES:$(TEST_DIR)/$(SRC_DIR)/%.cpp=$(TEST_DIR)/$(BIN_DIR)/%.o)


all: $(BUILD_DIR)/$(EXEC) $(SOURCES) 

$(BUILD_DIR)/$(EXEC): $(OBJECTS)
	mkdir -p $(BUILD_DIR)
	$(CC) -o $@ $^ $(LDFLAGS) $(CCFLAGS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(BIN_DIR)
	mkdir -p $(DEP_DIR)
	$(CC) -o $@ -c $< $(CFLAGS) $(CCFLAGS)
	$(CC) -MM $(CFLAGS) $(SRC_DIR)/$*.cpp > $(DEP_DIR)/$*.d

-include $(DEP_DIR)/*.d

run: all
	./$(BUILD_DIR)/$(EXEC)

test: $(TEST_DIR)/$(BUILD_DIR)/test.$(EXEC) $(TEST_SOURCES) $(filter-out bin/main.o,$(OBJECTS))
	./$(TEST_DIR)/$(BUILD_DIR)/test.$(EXEC)

$(TEST_DIR)/$(BUILD_DIR)/test.$(EXEC): $(TEST_OBJECTS) $(filter-out src/main.cpp,$(SOURCES))
	mkdir -p $(TEST_DIR)/$(BUILD_DIR)
	$(CC) -o $@ $^ $(LDFLAGS) $(CCFLAGS)

$(TEST_DIR)/$(BIN_DIR)/%.o: $(TEST_DIR)/$(SRC_DIR)/%.cpp
	mkdir -p $(TEST_DIR)/$(BIN_DIR)
	$(CC) -o $@ -c $< $(CFLAGS) $(CCFLAGS)
	$(CC) -MM $(CFLAGS) $(TEST_DIR)/$(SRC_DIR)/$*.cpp > $(TEST_DIR)/$(DEP_DIR)/$*.d

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(DEP_DIR)
	rm -rf $(TEST_DIR)/$(BIN_DIR) $(TEST_DIR)/$(BUILD_DIR) $(TEST_DIR)/$(DEP_DIR)

help:
	@echo Usage : make [tag]
	@echo "   "[no_tag]"  ": make all
	@echo "   "all"       ": make all
	@echo "   "run"       ": execute $(BUILD_DIR)/$(EXEC)
	@echo "   "test"      ": execute $(BUILD_DIR)/test.$(EXEC)
	@echo "   "clean"     ": remove /$(BIN_DIR) and /$(BUILD_DIR)directories
	@echo "   "help"      ": show help page
	@echo "   "printvars" ": print makefile variables
	
printvars:
	@echo VARIABLES
	@echo "   "CC" 	           ": $(CC)
	@echo "   "CCFLAGS"         ": $(CCFLAGS)
	@echo "   "CFLAGS"          ": $(CFLAGS)
	@echo "   "LDFLAGS"         ": $(LDFLAGS)
	@echo "   "SRC_DIR"         ": $(SRC_DIR)
	@echo "   "BIN_DIR"         ": $(BIN_DIR)
	@echo "   "BUILD_DIR"       ": $(BUILD_DIR)
	@echo "   "DEP_DIR"         ": $(DEP_DIR)
	@echo "   "DEPENDANCIES"    ": $(DEPENDANCIES)
	@echo "   "EXEC"            ": $(EXEC)
	@echo "   "OBJECTS"         ": $(OBJECTS)
	@echo "   "TEST_OBJECTS"    ": $(TEST_OBJECTS)
