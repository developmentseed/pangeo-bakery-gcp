SHELL := /bin/bash

.PHONY: init
init:
	gcloud auth login

.PHONY: install
install:
	scripts/install.sh

.PHONY: destroy
destroy:
	scripts/destroy.sh

.PHONY: test
test:
	scripts/test.sh $$(pwd)/test/recipes/oisst_recipe.py $$(pwd)/kubernetes/storage_key.json