.PHONY: install build run clean
install: build
	idris --install example.ipkg
build:
	idris --build example.ipkg
run: build
	@echo ""
	@./example
clean:
	idris --clean example.ipkg
	rm src/*.ibc

