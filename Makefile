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
