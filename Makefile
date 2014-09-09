PROJECT=ping

BUILD_PATH := $(shell pwd)/.gobuild

.PHONY=all get-deps build clean

PROJECT_PATH := "$(BUILD_PATH)/src/github.com/catalyst-zero"

GOPATH := $(BUILD_PATH)

SOURCE=$(shell find . -name '*.go')

BIN := $(PROJECT)

all: .gobuild get-deps $(BIN)

get-deps: .gobuild
	GOPATH=$(GOPATH) go get -d -v github.com/catalyst-zero/$(PROJECT)

.gobuild:
	mkdir -p $(PROJECT_PATH)
	cd "$(PROJECT_PATH)" && ln -s ../../../.. $(PROJECT)

$(BIN): $(SOURCE)
	GOPATH=$(GOPATH) go build -a -o $(BIN)

clean:
	rm -rf $(BUILD_PATH) $(BIN)
