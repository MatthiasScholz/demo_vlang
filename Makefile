script:
	@echo "INFO :: Running script demo"
	./script.vsh

.PHONY: cli
cli:
	@echo "INFO :: Build cli demo"
	v cli.v
	@echo "INFO :: Running cli demo: https://modules.vlang.io/flag.html"
	./cli greet -l de hello
	./cli greet --language de hello

install:
	@echo "INFO :: Installing vlang locally"
	brew install vlang

uninstall:
	@echo "INFO :: Uninstalling vlang locally"
	brew uninstall vlang
