CC = elm make
PACKAGE = elm package
INSTALL = install
SRC = src
TEST = test
OPEN = open
NODE = node
BASH = bash

PACKAGE_FLAGS = -y

BUILD_DIR = build
RESOURCES_DIR = resources

all: package/install clean compile

Index.html = index.html
open: all $(Index.html)
	$(OPEN) $(Index.html)

compile: tetris

Tetris = Tetris
Tetris.js = $(BUILD_DIR)/$(Tetris).js
Tetris.elm = $(SRC)/$(Tetris).elm
tetris: $(Tetris.js)
$(Tetris.js): $(Tetris.elm)
	$(CC) --output $(Tetris.js) $(Tetris.elm)

clean:
	rm -rf $(BUILD_DIR)

package/install:
	$(PACKAGE) $(INSTALL) $(PACKAGE_FLAGS)

#### TEST ####################

$(RESOURCES_DIR):
	mkdir -p $(RESOURCES_DIR)

test/bootstrap:
	npm install jsdom

ElmIo.sh = $(RESOURCES_DIR)/elm-io.sh
test/install: $(ElmIo.sh)
$(ElmIo.sh): $(RESOURCES_DIR)
	curl https://raw.githubusercontent.com/maxsnew/IO/master/elm-io.sh > $(ElmIo.sh)

TestRunner.elm = TestRunner.elm
RawTest.js = $(BUILD_DIR)/raw-test.js
Test.js = $(BUILD_DIR)/test.js
test/before: $(Test.js)
$(Test.js): $(TestRunner.elm) $(ElmIo.sh)
	$(CC) $(TestRunner.elm) --output $(RawTest.js)
	bash $(ElmIo.sh) $(RawTest.js) $(Test.js)

test: $(Test.js)
	$(NODE) $(Test.js)


#### TRAVIS ###################

travis/install: test/bootstrap
	npm install --global elm

travis/before: $(Test.js)
