CC:=gcc
MKDIR:=mkdir
RM:=rm -f
BIN:=bin
SRC:=src

CFLAGS:=-g -O0 -Wall -std=c99 -DPLATFORM_DESKTOP
LDFLAGS:=-lraylib -lm -lpthread -ldl -lrt -lX11

ifdef release
CFLAGS:=-O2 -Wall -std=c99 -DNDEBUG -DPLATFORM_DESKTOP
endif

SRCS:=$(wildcard $(SRC)/*.c)
OBJS:=$(patsubst $(SRC)/%.c, $(BIN)/%.o, $(SRCS))
EXEC:=$(BIN)/reticle

all: $(EXEC)

$(EXEC): $(OBJS) | $(BIN) 
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

$(BIN)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN):
	$(MKDIR) $(BIN)

clean:
	$(RM) $(BIN)/*

.PHONY: all clean 
