#!/usr/bin/env bash
set -euo pipefail
TARGET_DIR="$HOME/.local/bin"

# Cores
CYAN="\033[1;36m"
GREEN="\033[0;32m"
PURPLE="\033[0;35m"
MAGENTA="\033[1;35m"
RESET="\033[0m"


echo -e "$PURPLE"
python - <<'PY'
def main():
    print(r"""
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
    """)

if __name__ == "__main__":
    main()
PY
echo -e "$RESET"

# Confirmação
echo -e "               ${MAGENTA}======================================================"
echo -e "               | ${RESET}Tem certeza que deseja instalar o BashAgent? [s/N]${MAGENTA} |"
echo -e "               ====================================================== ${RESET}"
read -r resp
if [[ ! "$resp" =~ ^[sS]$ ]]; then
  echo "Instalação cancelada."
  exit 0
fi

# Tela de loading simples
echo -ne "${GREEN}Instalando"
for i in {1..3}; do
  sleep 0.5
  echo -n "."
done
echo -e "${RESET}" 

echo -e "\nInstalando pgt em $TARGET_DIR…"
mkdir -p "$TARGET_DIR"

install -m 755 perguntar "$TARGET_DIR"

# Criar alias/symlink "pgt" para o script principal
ln -sf "$TARGET_DIR/perguntar" "$TARGET_DIR/pgt"

# Adicionar ao PATH se necessário
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  SHELL_RC=""
  [[ -f "$HOME/.bashrc" ]] && SHELL_RC="$HOME/.bashrc"
  [[ -f "$HOME/.zshrc" ]] && SHELL_RC="$HOME/.zshrc"
  if [[ -n "$SHELL_RC" ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "Linha adicionada em $SHELL_RC. Abra novo terminal ou execute: source $SHELL_RC"
  else
    echo "Adicione manualmente ~/.local/bin ao PATH."
  fi
fi

# --- Configurar OPENROUTER_API_KEY ----------------------------------------
read -rp "Adicione aqui sua chave do OpenRouter (https://openrouter.ai/keys) [deixe em branco para pular]: " OR_KEY
if [[ -n "$OR_KEY" ]]; then
  SHELL_RC=""
  [[ -f "$HOME/.bashrc" ]] && SHELL_RC="$HOME/.bashrc"
  [[ -f "$HOME/.zshrc"  ]] && SHELL_RC="$HOME/.zshrc"
  [[ -z "$SHELL_RC" ]] && SHELL_RC="$HOME/.profile"

  # Remove definições anteriores para evitar duplicatas
  sed -i '/export OPENROUTER_API_KEY=/d' "$SHELL_RC"

  echo "export OPENROUTER_API_KEY=\"$OR_KEY\"" >> "$SHELL_RC"
  echo "Chave adicionada em $SHELL_RC"
else
  echo "Você pode definir OPENROUTER_API_KEY manualmente depois em ~/.bashrc ou ~/.zshrc."
fi

# Dicas de dependências
MISSING=()
for dep in curl jq perl; do
  if ! command -v "$dep" >/dev/null 2>&1; then
    MISSING+=("$dep")
  fi
done
if (( ${#MISSING[@]} )); then
  echo -e "\n${CYAN}Dependências ausentes:${RESET} ${MISSING[*]}"
  echo "Instale-as pelo gerenciador da sua distro. Ex. Arch: sudo pacman -S --needed ${MISSING[*]}"
fi

echo "Concluído! Comandos instalados: pgt (atalho) e perguntar (script completo)."
