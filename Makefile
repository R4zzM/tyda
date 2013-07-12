all: tests install

install:
	install -g root -o root -T src/tyda.pl /usr/bin/tyda

# Target 'test' need to exist to be compatible with travis-ci but 
# I personally like 'tests' more.
.PHONY: tests test
test: tests
tests:
	cd tests && sh ./runall.sh
