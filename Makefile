CC:=gcc
MKDIR:=mkdir
RM:=rm -f
CP:=cp -f

CFLAGS:=-g -O0 -Wall -std=c99 -DPLATFORM_DESKTOP
LDFLAGS:=-lraylib -lm -lpthread -ldl -lrt -lX11

ifdef release
CFLAGS:=-O2 -Wall -std=c99 -DNDEBUG -DPLATFORM_DESKTOP
endif

bin/reticle: src/main.c | bin 
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

bin:
	$(MKDIR) bin

clean:
	$(RM) bin/*

install:
	$(CP) bin/reticle /usr/local/bin/

uninstall:
	$(RM) /usr/local/bin/reticle

.PHONY: all clean install uninstall
