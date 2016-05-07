#
# (c) 2015 Ruben Schmidmeister <ruby@fog.im>
#
SHELL := /bin/bash
PATH  := ./node_modules/.bin:$(PATH)

BUNDLE := css/style.css
LESS_FILES := $(shell find less -name "*.less")

.PHONY: all clean lint deploy

all: $(BUNDLE)

clean:
	rm -rf $(BUNDLE)

lint:
	lessc --lint less/style.less

deploy:
	./scripts/deploy.sh css images index.html CNAME LICENSE

css/style.css: $(LESS_FILES)
	mkdir -p $(dir $@)
	lessc -clean-css less/style.less | postcss -u autoprefixer -o $@
