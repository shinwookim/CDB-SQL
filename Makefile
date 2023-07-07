MKDIR_P = mkdir -p
OUT_DIR = bin/
SRC_DIR = src/

OBJS	= DBSQL.o
SOURCE	= DBSQL.c
OUT	= db

CC	 = gcc
FLAGS	 = -g -c -Wall

.PHONY: directories
.PHONY: clean

all: directories $(OBJS)
	$(CC) -g ${OUT_DIR}$(OBJS) -o ${OUT_DIR}$(OUT)

directories: ${OUT_DIR}

${OUT_DIR}:
	${MKDIR_P} ${OUT_DIR}

DBSQL.o: ${SRC_DIR}DBSQL.c
	$(CC) $(FLAGS) ${SRC_DIR}DBSQL.c -o ${OUT_DIR}DBSQL.o

test: all
	bundle exec rspec

run: all
	${OUT_DIR}$(OUT)

clean:
	rm -f ${OUT_DIR}$(OBJS) ${OUT_DIR}$(OUT)