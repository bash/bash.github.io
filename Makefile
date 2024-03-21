MINIFY := npx lightningcss --minify --browserslist

.PHONY: run build

run:
	zola serve --drafts

build:
	./make-scripts/build.sh
