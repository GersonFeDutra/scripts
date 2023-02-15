### Referência global

#### `*`

Wild-card (coringa). Substitui nenhum, um ou mais caracteres na seleção de strings.

##### Exemplos

- `*.<extensão>`

	Seleciona todos arquivos com a <extensão> indicada.

- `/path/*<str>*`

	Seleciona todos os arquivos no caminho indicado que possuem `<str>` no nome.

- `/path/<str>*`

	Seleciona todos os arquivos que começam com `<str>`.

- `/path/*<str>`

	Seleciona todos os arquivos que terminam com `<str>`.

#### `?`

Subtitui um caractere da seleção de strings.

##### Exemplos

- `/path/?<str>*`

	Seleciona todos os arquivos no caminho indicado, cujo nome começa com uma letra qualquer seguida de `<str>` e terminha com um, nenhum ou vários caracteres quaisquer.

- `/path/???<str>`

	Seleciona todos os arquivos no caminho indicado, cujo nome termina com `<str>` após três letras caracters quaisquer.

#### `[<char0>-<charN>]` & `[<char0>,<char1>,<charN>]`

Subistitui um caractere na faixa indicada.

##### Exemplos

- `/path/<char>[<char0>-<charN>]*`

Seleciona todos os arquivos no caminho indicado cujo começam com um charactere específico seguido de um caractere na faixa indicada, seguida de qualquer coisa.

- `/path/A[B-F]?.<extensão>`

Seleciona todos os arquivos no caminho indicado cujo nome começa com o caractere `A` seguido de um caractere `B` ou `C` ou `D` ou `E` ou `F`, seguida de um caractere qualquer, e cujo termina com a extensão indicada.

- `/path/<char>[a-c,e]*`

Seleciona o arquivo no caminho indicado cujo inicia com um caractere indicado, seguido por um caractere entre `a` e `c` ou `e`, seguida de qualquer coisa.

- `/path/?[am,ul]*`

Seleciona todos os arquivos do caminho indicado cujo nome inicia com um caractere quaisquer seguido de um caractere entre `a` e `m` ou entre `u` e `l`.

#### `{<char00><char0N>,<charN0><charN1>`}

Subistitui padrões de caracteres.

##### Exemplos

- `/path/?{am,ul}`

Seleciona todos os arquivos no caminho indicado cujo nome inicia com um caractere quaisquer seguido dos caracteres `am` ou `ul`.

- `/path/*.{<extensão0>,<extensão1>,<extensãoN>}`

Seleciona todos os arquivos no caminho indicado com uma das extensões listadas por meio do seletor de padrões.

### Next: [[env_variables]]
