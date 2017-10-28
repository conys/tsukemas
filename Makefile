# makefile for firefox plugin, tsukemas.xpi
files = data/tsukemas_main.js data/idollist.js manifest.json
artifacts-dir = ./web-ext-artifacts

all: tsukemas.zip

run: $(files)
	web-ext run

tsukemas.zip: $(files)
	web-ext build --artifacts-dir=$(artifacts-dir)
	mv $(artifacts-dir)/*.zip tsukemas.zip
	rm -rf $(artifacts-dir)

data/idollist.js: idollist.txt
	python makelist.py

clean:
	rm -f *~
	rm -rf $(artifacts-dir)
	rm -f tsukemas.zip
	rm -f data/idollist.js

.PHONY: all run clean
