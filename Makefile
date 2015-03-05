#
# Makefile:
#DEBUG	= -g -O0
#DEBUG	= -O3
CC	= gcc
INCLUDE	= -I/usr/local/include
CFLAGS	=  -lm -Wall $(INCLUDE) -Winline -pipe #$(DEBUG) -g -00

LDFLAGS	= -L/usr/local/lib
LDLIBS    =  ./smbus.c 

SRC	=	temperaturmessung.c

OBJ	=	$(SRC:.c=.o)

BINS	=	$(SRC:.c=)

all:	$(BINS)

.c.o:
	@echo [CC] $<
	@$(CC) -c $(CFLAGS) $< -o $@

clean:
	@echo "[Clean]"
	@rm -f $(OBJ) *~ core tags $(BINS)

tags:	$(SRC)
	@echo [ctags]
	@ctags $(SRC)

depend:
	makedepend -Y $(SRC)

# DO NOT DELETE
