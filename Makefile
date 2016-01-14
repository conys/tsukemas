# makefile for firefox plugin, tsukemas.xpi
files = index.js data/tsukemas_main.js data/idollist.js package.json

all: tsukemas.xpi

run: $(files)
	jpm run -b iceweasel

tsukemas.xpi: $(files)
	jpm xpi

data/idollist.js: idollist.txt
	python makelist.py

clean:
	rm -f *~
	rm -f @*.xpi
	rm -f data/idollist.js

.PHONY: all run clean
