EXCLUDES := .DS_Store .git .gitmodules .travis.yml
SOURCE_DIR := $(PWD)
SOURCES := $(filter-out $(EXCLUDES), $(wildcard $(wildcard .??*)))

all:
	$(foreach SOURCE, $(SOURCES), ln -sfvn $(abspath $(SOURCE)) $(HOME)/$(SOURCE);)