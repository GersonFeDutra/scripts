### Scripts `bash`

#### Variáveis

- `name="algo"` <- Define uma variável de nome name inicializada com "algo".

- `$name` <- Envia o conteúdo da variável $name para a entrada padrão (o bash - como resultado tentará executar o comando.

- `echo $name` <- Imprimirá o conteúdo de `$name` na saída padrão.

- `$d = date` <- Armazena o comando `date` na variável `d`.
	- `$d` <- Executará o comando date;
	- `echo $d` <- Imprime `date` na saída padrão.

- `d=$(date)` <- Inicializará a variável `d` com a saída do comando `date`.
	- `$d` <- Tentará executar o valor armazenado na variável como comando (possivelmente resultando em erro, nesse caso);
	- `echo $d` <- Imprime o valor armazendo em `d`.

#### Input

##### `case`

###### `read`
Ex.:
```bash
while true; do
	read -p "Do you wish to drink a berr?" yn
	case $yn in
		[Yy]* ) break;
		[Nn]* ) exit;
	esac
```

#### Funções

> `<função>() {` <- Inicializa o modo de definição de função para uma rotina de nome `função`
> `comando`
> `comando`
> `...`
`}` <- Finaliza o modo de definição de função.

Uma função poderá ser usada como um comando durante aquela instância do terminal.

Se `$<N>`, sendo `<N>` um número de 0 à 9, imprimirá o n-ésimo argumento passado para a função.

#### Variáveis especiais

Bash usa variáveis especiais para códigos de erros, argumentos e outras coisas.

##### `$0`

Nome do script.

##### `$1`, `$2`, ..., `$9` (parâmetros)

Argumentos passados para o script. Note que para acessar mais que 9 parâmetros devemos usar a sintaxe `$(N)` sendo N a posição do mesmo.

##### `$@`

Lista de argumentos

##### `$?`

Retorna o código de saída do comando prévio.

##### `$$`

Process Identification Number (PID).

##### `!!`

Último comando execultado (incluindo argumentos);

##### `$_`

Último argumento do último comando executado;

#### Operadores lógicos

Códigos de saída podem ser combinados com operadores lógicos.

##### Exemplos:

- `false || echo` "Ops, falhou" <- Imprimirá "Ops, falhou" na saída padrão;

- `true || echo` "Essa mensagem não vai ser impressa" <- Não executará o comando `echo`.

- `true && echo "Tudo ocorreu bem"` <- Imprimirá "Tudo ocorreu bem" na tela;

- `true ; echo "Vai rodar sempre" <- Executará o comando `echo`

- `false ; echo "Vai rodar sempre" <- O mesmo que o comando acima;


A função do `;` é de concatenar comandos.
Note que, em bash, `true` e `false` são módulos e não booleanos. O comando `false` indica retorno `1` (falha), e `true` retorno 0 (sucesso). Em C, quando um programa retorna erro, ele deve retornar o número de identificação desse erro, caso contrário ele retornará 0. Bash usa desse fato para tratar erros no terminal.

##### Condicionais
Ex.:
```bash
if [ $2 -lt 21 ]; then
	echo "You are too young to use this script"
else
	echo "Enjoy your beer $1! "
fi
```

#### Process substitution

Podemos substituir a entrada de um comando por um outro comando (sub-processo) para criar comandos mais complexos.

##### Exemplos:

- `diff < (ls ./pesquisa/) < (ls ./disciplinas/)`

O comando `diff` recebe como entrada dois arquivos e retorna a diferença entre ele. Porém, nesse exemplo, utilizamos a process substituition - passando o comando `ls` entre parêntesis - para passar como entrada o processo `ls`.
Seriamos como se armazenassemos a saída do `ls` em um arquivo temporário e logo em seguida usássemos esses arquivos no `diff`. Por meio do process substitution todo o processo ocorre simultaneamente.

#### `for`

- Imprime o nome de todos os arquivos no diretório:

```bash
for file in "$@"; do
	echo $file
done
```

#### Run in Background `&`

You can run processes together in parallel with the `&` operator. Concatenate processes with this and this token will run in parallel!

### Outros comandos

#### `grep`

Realiza uma busca de um padrão regular passado como parâmetro, e o caminho de um arquivo indicado e retorna todas as ocorrências daquele arquivo, se encontrado. Caso contrário, retorna um código de erro (1). Exemplo:
- `grep rapadura $file` <= retorna todas as ocorrências de "rapadura" em $file.

O comando `grep` recebe uma string em RegEx, porém com a diferença que todos os metacaracteres são tratados como literais e devem ser escapados para funcionar corretamente. Para não ter de escapar cada metacaractere você deve usar a opção `-E`. Veja opções logo abaixo:

Dica: Você pode combinar a saída de um comando quaisquer para ser filtrada com o comando `grep` usando a pipe: `comando | grep -opções 'regex' entrada`

##### Opções

- `-c` -> Exibe uma contagem das linhas encontradas.
- `-i` -> Ignora o caso (maiúsculas e minúsculas).
- `-n` -> Exibe as linhas encontradas com o respectivo número da linha.
- `-v` -> Exibe as linhas que **não** correspondem à RegEx.
- `-r` -> Busca recursiva (entre arquivos de um diretório.
- `-E` -> Interpreta a regex como uma expressão regular etendida. (equivale ao comando `egrep` -deprecated).
- `--color` -> Mostra a saída com cores (padrão de muitos sistemas - distros, terminais e etc).

### Ferramentas de shell

#### `shellcheck`

Faz o linting do arquivo, trazendo mensagens de depuração e erro mais fáceis de serem compreendidas que as mostradas por padrão.

#### `tldr`

É uma alternativa ao `man`, que mostra descrição dos comandos de forma mais sintetizada e amigável.

#### `find`

Encontra arquivos de forma recursiva à partir do diretório indicado.

##### Exemplos:

- `find . -name src -type d` <- Entcontra todos os diretórios (`-type d`) nomeados `src`, à partir do diretório atual.

- `find . -path '*/test/*.py' -type f` <- Encontra todos os arquivos (`-type f`) python (`.py`) localizados dentro de um caminho que possua `test` como substring, à partir do diretório atual.

- `find . -mtime -l` <- Encontre todos os arquivos modificados no último dia, à partir do diretório atual.

- `find . -size +500k -size -10M -name '*.tar.gz'` <- Encontre todos os arquivos zipados (`.tar.gz`) com tamanhos entre 500k até 10M, à partir do diretório atual.

- `find . -name '*.tmp' -exec rm {} \;` <- Deleta todos os arquivos temporários (`.tmp`), à partir do diretório atual.

- `find ./img/ -name '*.png' -exec convert {} {}.jpg \;` <- Busca todos os arquivos PNG, à partir do diretório `img/`, e os converte para JPG.

### Next: [[file_operations]]
