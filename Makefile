SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
OUT	:= db
EXE := $(BIN_DIR)/$(OUT)
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC	 = gcc
CFLAGS   := -g -c -Wall

.PHONY: all clean

all: $(EXE)

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CC)  $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC)  $(CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

run: $(EXE)
	$(EXE)

test: $(EXE)
	bundle exec rspec

clean:
	@$(RM) -rv $(BIN_DIR) $(OBJ_DIR)
-include $(OBJ:.o=.d)

