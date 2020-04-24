# Experimentos com Java (build)

## Usando um script shell

Para compilar a classe temos que especificar o `sourcepath` e o caminho de destino:

```bash
mkdir -p build/classes
javac -sourcepath src -d build/classes src/br/eng/espectro/Main.java
```

Para criar o `jar` temos que criar um manifesto especificando qual é a classe
principal, depois usamos a ferramenta `jar` que vem na `JDK`:

```bash
mkdir -p build/jar
echo Main-Class: br.eng.espectro.Main>MANIFEST.in
jar cfm build/jar/Main.jar MANIFEST.in -C build/classes .
```

## Usando `make`

Se você quiser ser mais esperto e só construir os artefatos que tiverem
suas dependências alteradas desde o último build, então é melhor criar
um `Makefile` e executar `make`.
