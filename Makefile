DOCKER_CMD ?= docker

BIN_DIR  := $(CURDIR)/build
BUILD_IMAGE := numa

.PHONY: all build local

all: build

build:
	@$(DOCKER_CMD) build -t $(BUILD_IMAGE) -f Dockerfile.build $(CURDIR)
	@mkdir -p $(BIN_DIR)
	@$(DOCKER_CMD) run --rm -it --net=host -v $(BIN_DIR):/go/build $(BUILD_IMAGE)
