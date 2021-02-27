script:
	@echo "INFO :: Running script demo"
	./demo_scripting.vsh

.PHONY: demo_cli_interface
demo_cli_interface:
	@echo "INFO :: Build cli demo:"
	v $@.v
	@echo "INFO :: Running cli demo: https://modules.vlang.io/flag.html"
	./$@ greet -l de hello
	./$@ greet --language de hello

cleanup:
	rm -f demo_cli_interface

install:
	@echo "INFO :: Installing vlang locally"
	brew install vlang

uninstall:
	@echo "INFO :: Uninstalling vlang locally"
	brew uninstall vlang
