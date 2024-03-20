.PHONY: run build

run:
	zola serve --drafts

build:
	python ./update-reading-list.py
	./fetch-katex.sh
	zola build --output-dir _site
