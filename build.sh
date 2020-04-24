#!/usr/bin/bash

build_classes() {
  echo --------------------
  echo [INFO] Building classes
  (
    set -x
    mkdir -p build/classes
    javac -sourcepath src -d build/classes src/br/eng/espectro/Main.java
  )

  echo --------------------
  echo [INFO] Running specific class
  (
    set -x
    java -cp build/classes br.eng.espectro.Main
  )
  echo --------------------
}

build_jar() {
  echo --------------------
  echo [INFO] Build jar
  (
    set -x
    mkdir -p build/jar
    echo Main-Class: br.eng.espectro.Main>MANIFEST.in
    jar cfm build/jar/Main.jar MANIFEST.in -C build/classes .
  )

  echo --------------------
  echo [INFO] Running jar
  (
    set -x
    java -jar build/jar/Main.jar
  )
  echo --------------------
}

build_classes
build_jar

