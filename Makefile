.PHONY: all init docs lint format help

all: format lint docs

docs:
	terraform-docs markdown . \
		--sort-by required \
		--output-file README.md \
		--output-mode insert

format:
	terraform fmt --recursive

init:
	tflint --init

lint:
	terraform fmt --check
	tflint --format compact --module

help:
	@echo "Usage:"
	@echo "	make		Format, lint and generate document"
	@echo "	make init	Install tflint plugins"
	@echo "	make format	Format all *.tf files"
	@echo "	make lint	Lint check"
	@echo "	make docs	Generating document (README.md)"
