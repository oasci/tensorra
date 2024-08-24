.PHONY: run
run:
	mojo run main.mojo

.PHONY: build
build:
	@- rm build/tensorra.mojopkg 
	mojo package src/ -o build/tensorra.mojopkg 

.PHONY: tests
tests:
	mojo test -I src tests


###   DOCS   ###

mkdocs_port := $(shell \
	start_port=3000; \
	max_attempts=100; \
	for i in $$(seq 0 $$(($$max_attempts - 1))); do \
		current_port=$$(($$start_port + i)); \
		if ! lsof -i :$$current_port > /dev/null; then \
			echo $$current_port; \
			break; \
		fi; \
		if [ $$i -eq $$(($$max_attempts - 1)) ]; then \
			echo "Error: Unable to find an available port after $$max_attempts attempts."; \
			exit 1; \
		fi; \
	done \
)

.PHONY: serve
serve:
	@ echo "Serving website at http://127.0.0.1:$(mkdocs_port)/"
	@ mkdocs serve -a localhost:$(mkdocs_port)

.PHONY: docs
docs:
	mkdocs build -d public/

.PHONY: open-docs
open-docs:
	xdg-open public/index.html 2>/dev/null
