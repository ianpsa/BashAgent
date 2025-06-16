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

Durante a instalação você verá duas perguntas:
1. Confirmação para prosseguir (`Tem certeza que deseja instalar o BashAgent? [s/N]`).
2.Entrada da chave Gemini (`Adicione aqui sua chave do gemini`). Caso informe a chave que você pode pegar aqui (https://ai.google.dev/gemini-api/docs/api-key?hl=pt-br), o instalador a gravará no seu `~/.bashrc`, `~/.zshrc` ou `~/.profile` no formato:

```bash
export GEMINI_API_KEY="SUA_CHAVE_AQUI"
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
* `-y` / `--yes`  – executa todos os comandos retornados sem confirmar.

Durante a execução, o script perguntará para cada comando:
```
Executar comando 'cmd'? [s/N/t]
```
* `s` – executa somente este comando
* `t` – executa este e todos os seguintes
* Enter/qualquer tecla – ignora
---
## Desinstalação

```bash
rm ~/.local/bin/pgt ~/.local/bin/perguntar
```

---
## Requisitos

* Dependências: Bash, jq e Python (só pra mostrar os visuals do instalador :p)
* Variável `GEMINI_API_KEY` exportada (o instalador ajuda a configurar)

---

> Por ser um modelinho de IA não me responsabilizo por qualquer comando incorreto que ele possa executar em sua máquina, Verifique antes de executar um comando!
