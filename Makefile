
AR ?= ar
CC ?= gcc
CFLAGS = -std=c99 -Wall -Wextra

SRC = fs.c
HEADERS = fs.h
OBJS = $(SRC:.c=.o)


all: clean test libfs.a

libfs.a: $(OBJS)
	$(AR) rcs $@ $^

%.o: %.c
	$(CC) $< -c -o $@ $(CFLAGS)

test: test.o $(OBJS)
	$(CC) $^ -o $@ $(CFLAGS)
	@./$@

clean:
	rm -f test $(OBJS)

install: libfs.a
	cp -f libfs.a $(PREFIX)/lib/libfs.a
	cp -f src/fs.h $(PREFIX)/include/fs.h

uninstall:
	rm -f $(PREFIX)/lib/libfs.a
	rm -f $(PREFIX)/include/fs.h

.PHONY: test clean include uninstall
