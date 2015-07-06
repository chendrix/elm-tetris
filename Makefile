CC = elm make
SRC = src
TEST = test
OPEN = open

all: compile

compile: tetris

Index.html = index.html
open: compile $(Index.html)
	$(OPEN) $(Index.html)

Tetris = Tetris
Tetris.js = build/$(Tetris).js
Tetris.elm = $(SRC)/$(Tetris).elm

tetris: $(Tetris.js)
$(Tetris.js): $(Tetris.elm)
	$(CC) --output $(Tetris.js) $(Tetris.elm)

clean:
	rm -rf build