OBJS	= DBSQL.o
SOURCE	= DBSQL.c
HEADER	= 
OUT	= DB
CC	 = gcc
FLAGS	 = -g -c -Wall
LFLAGS	 = 

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS)

DBSQL.o: DBSQL.c
	$(CC) $(FLAGS) DBSQL.c 


clean:
	rm -f $(OBJS) $(OUT)