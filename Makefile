all: tests install

install:
	install -g root -o root -T src/tyda.pl /usr/bin/tyda

.PHONY: tests
tests:
	cd tests && sh ./runall.sh
