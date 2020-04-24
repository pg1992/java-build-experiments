all: build/jar/Main.jar

build/jar/Main.jar: build/classes/br/eng/espectro/Main.class
	mkdir -p build/jar
	echo Main-Class: br.eng.espectro.Main>MANIFEST.in
	jar cfm build/jar/Main.jar MANIFEST.in -C build/classes .

build/classes/br/eng/espectro/Main.class: src/br/eng/espectro/Main.java
	mkdir -p build/classes
	javac -sourcepath src -d build/classes $<

clean:
	rm -rf build MANIFEST.in

.PHONY: clean all
