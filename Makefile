all: build

cleanBuild: clean build

build: src/main.c scripts/health_broadcast.sh
	mkdir build
	cp -r scripts build
	${RISCV_HOME}/_install/bin/riscv64-unknown-elf-gcc-13.2.0 src/main.c -o ./build/hbc

buildLocal: clean src/main.c scripts/health_broadcast.sh
	mkdir build
	cp -r scripts build
	gcc src/main.c -o ./build/hbc

clean:
	rm -r build
