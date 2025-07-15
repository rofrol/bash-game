# .bashrc dla studenta

# Jeśli nie jesteś w trybie interaktywnym, nie wykonuj reszty
case $- in
    *i*) ;;
      *) return;;
esac

# Historia
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

# Sprawdzanie rozmiaru okna
shopt -s checkwinsize

# Kolorowe prompty
if [ "$TERM" != "dumb" ]; then
    export PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ '
fi

# Przydatne aliasy
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias h='history'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias tree='tree -C'

# Funkcje pomocnicze
mkcd() {
    mkdir -p "$1" && cd "$1"
}

backup() {
    if [ -z "$1" ]; then
        echo "Użycie: backup <plik>"
        return 1
    fi
    cp "$1" "$1.bak"
    echo "Backup $1 utworzony"
}

# Dopełnianie bash
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Powitanie
echo "Witaj w bash-game! Wpisz './start.sh' aby rozpocząć naukę."
