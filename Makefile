# Get the current directory name and use it as the container name
CONTAINER_NAME := $(notdir $(CURDIR))
IMAGE_NAME := $(CONTAINER_NAME):latest

# Default target
.PHONY: all
all: help

# Build the Docker image
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
.PHONY: run
run:
	bash run.sh ${CONTAINER_NAME}

# Stop the Docker container
.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Docker container
.PHONY: rm
rm:
	docker rm $(CONTAINER_NAME)

# Remove the Docker container
.PHONY: kill
kill:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Open a shell in the running Docker container
.PHONY: shell
shell:
	docker exec -ti $(CONTAINER_NAME) sh

# View Docker Logs
.PHONY: logs
logs:
	docker logs $(CONTAINER_NAME)

# Show help message
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build   - Build the Docker image"
	@echo "  make run     - Run the Docker container"
	@echo "  make stop    - Stop the Docker container"
	@echo "  make rm      - Remove the Docker container"
	@echo "  make shell   - Open a shell in the running container"

