.PHONY: backup install uninstall check brew

backup:
	./backup.sh

install:
	./install.sh

uninstall:
	./uninstall.sh

check:
	./check.sh

brew:
	brew bundle install --file=Brewfile
