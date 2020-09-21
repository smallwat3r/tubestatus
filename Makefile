.PHONY: install uninstall linter

SCRIPT := tubestatus

install:
	cp $(SCRIPT) /usr/local/bin/$(SCRIPT)
	chmod 755 /usr/local/bin/$(SCRIPT)
	mkdir -p /usr/local/share/man/man1/
	cp $(SCRIPT).1 /usr/local/share/man/man1/$(SCRIPT).1
	chmod 644 /usr/local/share/man/man1/$(SCRIPT).1

uninstall:
	rm -f /usr/local/bin/$(SCRIPT)
	rm -f /usr/local/share/man/man1/$(SCRIPT).1

linter:
	shellcheck ./$(SCRIPT)
