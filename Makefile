all: tests install

install:
	install -g root -o root -T src/tyda.pl /usr/local/bin/tyda
	mkdir -p /usr/local/share/man/man1
	install -g root -o root man/tyda.1 /usr/local/share/man/man1

# Target 'test' need to exist to be compatible with travis-ci but 
# I personally like 'tests' more.
.PHONY: tests test
test: tests
tests:
	cd tests && sh ./runall.sh
