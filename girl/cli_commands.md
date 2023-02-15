# CLI

## `bash`

Bash é um interpretador de shell, e também uma linguagem de programação que permite, por meio do uso de **comandos**, que ações sejam executadas no núcleo de seu sistema operacional, executando programas, criando arquivos, etc...

Um comando é uma sequência de **argumentos** entrados/ passados em uma linha da sua CLI (command line interface).
O primeiro argumento do comando é o _nome_ daquele comando, e os seguintes são, normalmente, chamados de **parâmetros** posicionais.
Alguns desses parâmetros *opcionais*, chamados de **opções** são usados para modificar o comportamento do comando, por exemplo:
- `-l` `--long`
- `-v` `--verbose`
- `-r` `--recursive`
- etc...
Opções também podem ser combinadas, na sua forma abreviada, para indicar uma combinação de opções. Como, por exemplo:  `-lvr`, significando ao mesmo tempo "longo", "verboso" e "recursivo".
Também podemos nos referenciar aos argumentos que seguem as opções como sendo os *parâmetros* daquela opção em si. Opções geralmente estão explicitamente codificadas (hard-coded) no programa, enquanto que parâmetros não estão.
> [Referência](https://stackoverflow.com/questions/36495669/difference-between-terms-option-argument-and-parameter/36495940)

Nota: Você pode ter parâmetros que se assemelham a opçẽos (iniciam-se com `-`), basta usar `--` antes desse argumento para informar para o terminal que não deve ser interpretado como opção. ex.: `ls -l -- -a` (lista arquivos no diretório "-a").

### Content
* [[basics]]
* [[env_variables]]
* [[global_ref]]

### Criando scripts

Bash é uma linguagem de scripts, isso significa que você pode tornar uma sequência de linhas de comando em um arquivo para serem executados sequencialmente como um programa comum - feito em C, por exemplo.
Para isso, você deve criar um arquivo de extensão `.sh` (.shell) e escrever o seguinte comentário na primeira linha desse arquivo: `#!/bin/bash`. Esse comentário é chamado de **shebang** e serve para mostrar ao SO onde está o programa para compilar/ interpretar aquele script.
Para executá-lo, primeiro você terá de ter as devidas permissões de execução, use: `sudo chmod +x <arquivo>.sh` para tal. Assim você pode usá-lo como um comando `./<arquivo>.sh`.
Shebangs também podem ser usados para outros tipos de scripts, como por exemplo, em Python3: `#!/usr/bin/env python3`.

![[scripts]]


## `fish`
// not using

## `zsh`

Assim como bash, zsh é um interpretador de shell, que também possui sua própria sintaxe e alguns facilitadores de uso no terminal.

### `oh-my-zsh`

É uma extensão do `zsh` que permite a adição de diversos plugins que incrementam sua usabilidade.

## `python`

No UNIX (GNU/Linux, Linux, Mac, etc), você também pode usar scripts python como comandos, semelhante ao que é feito com scripts bash e outras shell-langs.
Esse doc não vai cobrir a sintaxe do python, mas nessa seção, irei abordar algumas features fundamentais para trabalhar no python como uma linguagem de CLI.

### Shebangs

Para tornar um script python em executável, você também deve usar um comentário de shebang no topo do seu arquivo `.py`: `#!/usr/bin/env python3`.
Não esqueça de torná-lo executável com o comando `chmod +x`.

### Argumentos

No Python3, você acessa os parâmetros passados na CLI por meio da biblioteca `sys` com a variável `argv`. Veja o exemplo:

```python
#!/usr/bin/env python3
import sys

if __name__ == "__main__":
	# Irá imprimir a lista de argumentos do comando usado na CLI em ordem reversa.
	for arg in reversed(sys.argv[1:]):
		print(arg)

```

Semelhante às variáveis de parâmetros sequencias, `argv` guarda no índice 0 o nome do script, e nas posições seguintes os argumentos passados para o mesmo.
