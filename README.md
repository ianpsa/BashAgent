# Hey BashAgent - Um EchoSec bash helper!

``` bash
                .n                   .                 .                  n.
        .   .dP                  dP                   9b                 9b.    .
        4    qXb         .       dX                     Xb       .        dXp     t
        dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb
        9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP
        9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP
        '9XXXXXXXXXXXXXXXXXXXXX'~   ~'OOO8b   d8OOO'~   ~'XXXXXXXXXXXXXXXXXXXXXP'
            '9XXXXXXXXXXXP' '9XX'          '98v8P'          'XXP' '9XXXXXXXXXXXP'
                ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~
                                )b.  .dbo.dP''v''9b.odb.  .dX(
                            ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.
                            dXXXXXXXXXXXP'   .   '9XXXXXXXXXXXb
                            dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb
                            9XXb'   'XXXXXb.dX|Xb.dXXXXX'   'dXXP
                            ''      9XXXXXX(   )XXXXXXP      ''
                                    XXXX X.'v'.X XXXX
                                    XP^X''b   d''X^XX
                                    X. 9  ''   '  P )X
                                    'b  '       '  d'
                                    '             '


        @@@   @@@@@@   @@@  @@@        @@@@@@   @@@  @@@@@@@@@@    @@@@@@    @@@@@@   
        @@@  @@@@@@@@  @@@@ @@@       @@@@@@@   @@@  @@@@@@@@@@@  @@@@@@@@  @@@@@@@@  
        @@!  @@!  @@@  @@!@!@@@       !@@       @@!  @@! @@! @@!  @@!  @@@  @@!  @@@  
        !@!  !@!  @!@  !@!!@!@!       !@!       !@!  !@! !@! !@!  !@!  @!@  !@!  @!@  
        !!@  @!@!@!@!  @!@ !!@!       !!@@!!    !!@  @!! !!@ @!@  @!@!@!@!  @!@  !@!  
        !!!  !!!@!!!!  !@!  !!!        !!@!!!   !!!  !@!   ! !@!  !!!@!!!!  !@!  !!!  
        !!:  !!:  !!!  !!:  !!!            !:!  !!:  !!:     !!:  !!:  !!!  !!:  !!!  
        :!:  :!:  !:!  :!:  !:!  :!:      !:!   :!:  :!:     :!:  :!:  !:!  :!:  !:!  
        ::  ::   :::   ::   ::  :::  :::: ::    ::  :::     ::   ::   :::  ::::: ::  
        :     :   : :  ::    :   :::  :: : :    :     :      :     :   : :   : :  :   
```

Ei, você! você mesmo, aprendiz de hackerman, Mr. Robot junior, já teve alguma dificuldade de lembrar comandos no linux? Se sim, esse negócio é pra você, com um simples comando:

```bash 
pgt "perguntinha" 
#ou 
perguntar "perguntinha" 
```
você pode tirar suas dúvidas rapidamente com um modelo de IA pelo seu terminal! E o melhor de tudo, free bro.

---
## Instalação rápida

```bash
git clone <URL-ou-pasta-local>/pgt-installer
cd pgt-installer
./install.sh
```

O instalador copia **perguntar** e cria o alias **pgt** em `~/.local/bin`.

Durante a instalação você verá duas etapas:
1. Confirmação para prosseguir (`Tem certeza que deseja instalar o BashAgent? [s/N]`).
2. Inserir sua chave do OpenRouter. Você pode obtê-la em `https://openrouter.ai/keys`. O instalador grava no seu `~/.bashrc`, `~/.zshrc` ou `~/.profile` no formato:

```bash
export OPENROUTER_API_KEY="SUA_CHAVE_AQUI"
```

Se deixar em branco, você poderá exportar manualmente depois.

---
## Uso básico

Use qualquer um dos comandos abaixo – eles são equivalentes:

```bash
pgt "Como crio um virtualenv?"
# ou
perguntar "Como crio um virtualenv?"
```

Opções:
- **-y / --yes**: executa todos os comandos retornados sem confirmar.

Durante a execução, o script perguntará para cada comando:
```
Executar o comando N? [s/N/t]
```
- **s**: executa somente este comando
- **t**: executa este e todos os seguintes
- Enter/qualquer tecla: ignora

---
## Como a IA retorna comandos

- O modelo retorna comandos dentro de blocos XML:
```text
<COMMAND os="Arch Linux" org="BashAgent">
COMANDO AQUI (pode ter múltiplas linhas)
</COMMAND>
```
- O BashAgent executa o conteúdo completo do bloco como UMA unidade no zsh/bash.
- A resposta também vem com uma primeira linha fixa indicando ambiente, ex.: `Ambiente: OS=Arch Linux (Linux x.y.z), Organização=BashAgent`.
- Para encadear passos que dependem da saída anterior, o modelo finaliza com um sentinel especial (ex.: `4223a%`). O BashAgent captura a saída dos comandos e reenvia para a IA automaticamente, continuando o ciclo até o modelo escrever `FIM`.

---
## Variáveis de ambiente úteis

- **OPENROUTER_API_KEY**: chave da API do OpenRouter (obrigatória).
- **PERGUNTAR_CONTEXT_BYTES**: bytes do histórico enviados para o modelo (padrão: 64000).
- **PERGUNTAR_HISTORY_OUTPUT_LINES**: se definido, limita quantas linhas de saída são gravadas no histórico por comando; se não definido, salva a saída completa.

---
## Requisitos

- Dependências: `bash`, `curl`, `jq`, `perl`.
- Conexão à internet (usa OpenRouter com o modelo `z-ai/glm-4.5-air:free`).

---
## Desinstalação

```bash
rm ~/.local/bin/pgt ~/.local/bin/perguntar
```

---
> Por ser um modelinho de IA não me responsabilizo por qualquer comando incorreto que ele possa executar em sua máquina. Verifique antes de executar um comando!.
