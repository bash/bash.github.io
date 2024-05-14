MINIFY := npx lightningcss --minify --browserslist
NPM_SENTINEL := node_modules/.sentinel
ZOLA_SENTINEL := .zola-sentinel
READING_LIST := content/reading-list.json
CONTENT_FILES := $(shell find content -type f)
SASS_FILES := $(shell find sass -type f)
TEMPLATES := $(shell find templates -type f)
STATICS := $(shell find static -type f)
KATEX_FILES := katex.mjs contrib/auto-render.mjs katex.min.css fonts/KaTeX_Main-Regular.woff2 fonts/KaTeX_Math-Italic.woff2
KATEX_OUTPUT_FILES := $(addprefix static/katex/,$(KATEX_FILES))
SATELLITE_PAGES := $(wildcard satellite-pages/*)
SATELLITE_PAGES_HTML := $(patsubst satellite-pages/%,public/%/index.html,$(SATELLITE_PAGES))

.SECONDARY: # Do not delete intermediate files
.PHONY: all watch serve publish

all: $(ZOLA_SENTINEL) $(SATELLITE_PAGES_HTML)

$(ZOLA_SENTINEL): $(CONTENT_FILES) $(SASS_FILES) $(TEMPLATES) $(STATICS) $(READING_LIST) $(NPM_SENTINEL) $(KATEX_OUTPUT_FILES) config.toml browserslist
ifeq ($(ZOLA_PUBLISH), true)
	zola build
else
	zola build --drafts --base-url http://localhost:1111
endif
	./make-scripts/minify-css.bash public
	@touch $(ZOLA_SENTINEL)

watch:
	MAKE=$(MAKE) ./make-scripts/watch.bash

serve:
	python3 -m http.server -d public 1111

publish:
	ZOLA_PUBLISH=true $(MAKE) -B
	@rm -rf _site/
	cp -r public _site

$(NPM_SENTINEL): package.json package-lock.json
	npm install
	@touch $(NPM_SENTINEL)

$(READING_LIST):
	./make-scripts/reading-list.bash > $@

static/katex/%: $(NPM_SENTINEL)
	@mkdir -p $(dir $@)
	cp node_modules/katex/dist/$* $@

satellite-pages/%/readme.md: satellite-pages/%/url
	wget -O $@ $$(cat $<)

public/%/index.html: satellite-pages/%/readme.md
	@mkdir -p $(dir $@)
	seite $< --template templates/satellite-page.html --output $@
