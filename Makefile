CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lgdi32
SRC = src
OBJ = obj
BIN = bin
RES = resource

SRCS = $(wildcard $(SRC)/*.c)
RC_SRCS = $(wildcard $(RES)/*.rc)
OBJS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SRCS)) $(patsubst $(RES)/%.rc, $(OBJ)/%.o, $(RC_SRCS))

APP = $(BIN)/app

all: $(APP)

$(APP): $(OBJS) $(BIN)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

$(OBJ)/%.o: $(SRC)/%.c $(OBJ)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ)/%.o: $(RES)/%.rc $(OBJ)
	windres $< -o $@
	
$(OBJ):
	mkdir -p $@

$(BIN):
	mkdir -p $@

clean:
	$(RM) -r $(OBJ)
	$(RM) -r $(BIN)