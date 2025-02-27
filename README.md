## simple wikijs docker setup for local use.


create these variables in .env
```bash
ADMIN_EMAIL=""
ADMIN_PASS=""
DB_TYPE="sqlite"
DB_USER=""
DB_PASS=""
DB_FILEPATH="/data/${DB_FILE_NAME}.sqlite"
```
# Important! setup your git-crypt key

the gitattributes file is set to encrypt everything in ./data and .env.

```bash
git-crypt init
git-crypt export-key /path/to/keyfile.key
```
back up key file as necessary.

then you can decrypt via unlock after any fresh git clones
```bash
git-crypt unlock
```

## Usage
From the Makefile included...

```
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make build   - Build the Docker image"
	@echo "  make run     - Run the Docker container"
	@echo "  make stop    - Stop the Docker container"
	@echo "  make rm      - Remove the Docker container"
	@echo "  make shell   - Open a shell in the running container"
```
