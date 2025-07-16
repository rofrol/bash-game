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

# Funkcja do demonstracji tab completion
tab_demo() {
    echo "=== DEMONSTRACJA TAB COMPLETION ==="
    echo
    echo "1. Uzupełnianie nazw plików i folderów:"
    echo "   Wpisz: ls sam<TAB> - uzupełni do sample_data.txt"
    echo "   Wpisz: cd t<TAB> - pokaże temp2/"
    echo
    echo "2. Uzupełnianie komend:"
    echo "   Wpisz: gre<TAB> - uzupełni do grep"
    echo "   Wpisz: sys<TAB><TAB> - pokaże wszystkie komendy zaczynające się od 'sys'"
    echo
    echo "3. Uzupełnianie opcji komend:"
    echo "   Wpisz: ls -<TAB><TAB> - pokaże dostępne opcje"
    echo "   Wpisz: git <TAB><TAB> - pokaże dostępne subkomendy"
    echo
    echo "4. Uzupełnianie zmiennych:"
    echo "   Wpisz: echo \$HO<TAB> - uzupełni do \$HOME"
    echo "   Wpisz: echo \$PA<TAB> - uzupełni do \$PATH"
    echo
    echo "5. Podwójny TAB pokazuje wszystkie opcje:"
    echo "   Wpisz: <TAB><TAB> - pokaże wszystkie dostępne komendy"
    echo
    echo "Spróbuj teraz! Wpisz 'exit' aby wrócić do gry."
}

# Dopełnianie bash
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Włączanie zaawansowanych opcji completion
shopt -s cdspell        # Korekta błędów w cd
shopt -s dirspell       # Korekta błędów w nazwach folderów
shopt -s nocaseglob     # Ignorowanie wielkości liter w globbing
shopt -s nullglob       # Puste globbing zwraca pustą listę
shopt -s expand_aliases # Rozwijanie aliasów w completion

# Niestandardowe completion dla funkcji pomocniczych
complete -F _filedir backup
complete -W "$(ls -d */ 2>/dev/null | sed 's|/||g')" mkcd

# Powitanie
echo "Witaj w bash-game! Wpisz './start.sh' aby rozpocząć naukę."
echo "Dostępne komendy pomocnicze:"
echo "  tab_demo - demonstracja tab completion"
echo "  mkcd     - stwórz folder i przejdź do niego"
echo "  backup   - stwórz backup pliku"
