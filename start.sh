#!/bin/bash

# Sig  "🎨 LEVEL 5: Personalizacja PS1 — dostosuj swój prompt"
  "🚀 LEVEL 6: Ruch w linii — Ctrl+A, Ctrl+E, Backspace"
  "🧹 LEVEL 7: Ctrl+C, clear/reset"
  "📜 LEVEL 8: Historia — strzałka w górę, Ctrl+R"
  "📂 LEVEL 9: cd, pwd, cd -, cd ~"
  "📁 LEVEL 10: mkdir, rm, cp, mv"
  "📄 LEVEL 11: tee, >out.txt 2>&1, 2>/dev/null"
  "🔐 LEVEL 12: chmod, chown"
  "🔎 LEVEL 13: find, grep, awk, sed, rg, fd"
  "📈 LEVEL 14: ps aux, kill -9, top, htop, btop"
  "🌐 LEVEL 15: curl, wget"
  "🧰 LEVEL 16: tail, head, wc -l, xargs"
  "👤 LEVEL 17: whoami, id"
  "📡 LEVEL 18: ping, traceroute, ip addr, ifconfig"
  "🎯 LEVEL 19: jq"
  "📝 LEVEL 20: neovim podstawy"
  "🗜️ LEVEL 21: Archiwa i kompresja"Ctrl+C
function handle_sigint() {
  echo
  echo "Dzięki za grę! 👋"
  exit 0
}

# Set up signal handler
trap handle_sigint SIGINT

LEVELS=(
  "� LEVEL 1: ls podstawy — wyświetlanie plików i folderów"
  "�🔍 LEVEL 2: man ls — znajdź flagę -1"
  "🧠 LEVEL 3: Nawigacja w man: wyszukaj słowo 'sort'"
  "⚙️ LEVEL 4: Zmienna środowiskowa \$EDITOR"
  "🎨 LEVEL 5: Personalizacja PS1 — dostosuj swój prompt"
  "🚀 LEVEL 6: Ruch w linii — Ctrl+A, Ctrl+E, Backspace"
  "🧹 LEVEL 6: Ctrl+C, clear/reset"
  "📜 LEVEL 7: Historia — strzałka w górę, Ctrl+R"
  "📂 LEVEL 8: cd, pwd, cd -, cd ~"
  "📁 LEVEL 9: mkdir, rm, cp, mv"
  "📄 LEVEL 10: tee, >out.txt 2>&1, 2>/dev/null"
  "🔐 LEVEL 11: chmod, chown"
  "🔎 LEVEL 12: find, grep, awk, sed, rg, fd"
  "📈 LEVEL 13: ps aux, kill -9, top, htop, btop"
  "🌐 LEVEL 14: curl, wget"
  "🧰 LEVEL 15: tail, head, wc -l, xargs"
  "👤 LEVEL 16: whoami, id"
  "📡 LEVEL 17: ping, traceroute, ip addr, ifconfig"
  "🎯 LEVEL 18: jq"
  "📝 LEVEL 19: neovim podstawy"
  "🗜️ LEVEL 20: Archiwa i kompresja"
  "🏁 SANDBOX: Tryb wolny z losowymi wyzwaniami"
)

function show_menu() {
  clear
  echo "========================="
  echo " CLI/Bash Adventure Game"
  echo "========================="
  echo
  for i in "${!LEVELS[@]}"; do
    printf "%2d. %s\n" $((i + 1)) "${LEVELS[$i]}"
  done
  echo "  0. Wyjście"
  echo
  read -p "Wybierz poziom: " choice || handle_sigint
  if [[ $choice =~ ^[0-9]+$ && $choice -ge 0 && $choice -le ${#LEVELS[@]} ]]; then
    run_level $choice
  else
    echo "Nieprawidłowy wybór. Naciśnij Enter."
    read || handle_sigint
    show_menu

    # Dodaj alias do ~/.bashrc
    if ! grep -q 'alias gra=' ~/.bashrc; then
      echo "alias gra='/home/student/game.sh'" >>~/.bashrc
    fi
  fi
}

function run_level() {
  case $1 in
  1) level1 ;; 2) level2 ;; 3) level3 ;; 4) level4 ;; 5) level5 ;;
  6) level6 ;; 7) level7 ;; 8) level8 ;; 9) level9 ;; 10) level10 ;;
  11) level11 ;; 12) level12 ;; 13) level13 ;; 14) level14 ;; 15) level15 ;;
  16) level16 ;; 17) level17 ;; 18) level18 ;; 19) level19 ;; 20) level20 ;;
  21) level21 ;; 22) sandbox ;; 0) exit ;;
  esac
  read -p "Naciśnij Enter, by wrócić do menu..." || handle_sigint
  show_menu
}

function level1() {
  clear
  echo "� LEVEL 1: ls podstawy"
  echo "Zadanie: Poznaj podstawowe użycie polecenia 'ls'"
  echo
  echo "Podstawowe polecenia:"
  echo "  ls           - wyświetl pliki i foldery"
  echo "  ls -l        - format długi (szczegóły)"
  echo "  ls -a        - pokaż pliki ukryte (zaczynające się od .)"
  echo "  ls -la       - łącz opcje: długi format + pliki ukryte"
  echo "  ls -h        - rozmiary w formacie czytelnym dla człowieka"
  echo "  ls -t        - sortuj według daty modyfikacji"
  echo "  ls -r        - odwróć kolejność sortowania"
  echo
  echo "Wypróbuj te polecenia w różnych folderach!"
  echo "Przykład: ls -la ~ (pokaż szczegóły wszystkich plików w folderze domowym)"
}

function level2() {
  clear
  echo "�🔍 LEVEL 2: man ls"
  echo "Zadanie: Otwórz podręcznik polecenia 'ls' i znajdź opis flagi -1"
  echo "Użyj: man ls, /-1 by wyszukać"
}

function level2() {
  clear
  echo "🔍 LEVEL 2: man ls"
  echo "Zadanie: Otwórz podręcznik polecenia 'ls' i znajdź opis flagi -1"
  echo "Użyj: man ls, /-1 by wyszukać"
}

function level3() {
  clear
  echo "🧠 LEVEL 3: Wyszukiwanie w man"
  echo "Zadanie: Otwórz man ls, wyszukaj słowo 'sort' (użyj /sort) i przejdź dalej (n/N)"
}

function level3() {
  clear
  echo "🧠 LEVEL 3: Wyszukiwanie w man"
  echo "Zadanie: Otwórz man ls, wyszukaj słowo 'sort' (użyj /sort) i przejdź dalej (n/N)"
}

function level4() {
  clear
  echo "⚙️ LEVEL 4: \$EDITOR"
  echo "Sprawdź swoją zmienną środowiskową \$EDITOR (echo \$EDITOR) lub ustaw ją na neovim"
  echo "Ustawienie: export EDITOR=nvim"
}

function level4() {
  clear
  echo "⚙️ LEVEL 4: \$EDITOR"
  echo "Sprawdź swoją zmienną środowiskową \$EDITOR (echo \$EDITOR) lub ustaw ją na neovim"
  echo "Ustawienie: export EDITOR=nvim"
}

function level5() {
  clear
  echo "🎨 LEVEL 5: Personalizacja PS1"
  echo "Zadanie: Dostosuj swój prompt bash do własnych potrzeb"
  echo
  echo "Podstawowe elementy PS1:"
  echo "  \\u - nazwa użytkownika"
  echo "  \\h - nazwa hosta"
  echo "  \\w - bieżący katalog"
  echo "  \\W - tylko nazwa bieżącego katalogu"
  echo "  \\d - data"
  echo "  \\t - czas (24h)"
  echo "  \\T - czas (12h)"
  echo "  \\$ - znak # dla root, $ dla zwykłego użytkownika"
  echo
  echo "Kolory (użyj \\[\\e[XXm\\] na początku, \\[\\e[0m\\] na końcu):"
  echo "  30-37: czarny, czerwony, zielony, żółty, niebieski, magenta, cyan, biały"
  echo "  1m: pogrubienie, 4m: podkreślenie"
  echo
  echo "Przykłady:"
  echo "  export PS1='\\u@\\h:\\w\\$ '  # domyślny"
  echo "  export PS1='\\[\\e[32m\\]\\u@\\h\\[\\e[0m\\]:\\[\\e[34m\\]\\w\\[\\e[0m\\]\\$ '"
  echo "  export PS1='[\\t] \\u in \\W > '"
  echo
  echo "💡 Wskazówka: Możesz dodać to do ~/.bashrc by zachować na stałe"
}

function level6() {
  clear
  echo "🚀 LEVEL 6: Poruszanie się po linii"
  echo "Użyj: Ctrl+A (początek), Ctrl+E (koniec), Backspace, Ctrl+D (usuń)"
  echo "Wprowadź długie polecenie i poćwicz nawigację."
  echo
  echo "Dodatkowe skróty:"
  echo "  Ctrl+U - usuń całą linię"
  echo "  Ctrl+K - usuń od kursora do końca linii"
  echo "  Ctrl+W - usuń słowo przed kursorem"
  echo "  Alt+F / Alt+B - przesuń kursor o słowo"
}

function level7() {
  clear
  echo "🧹 LEVEL 7: Czyszczenie i anulowanie"
  echo "Użyj Ctrl+C by przerwać proces, a clear lub reset by wyczyścić ekran."
  echo "Wpisz sleep 100 i anuluj go Ctrl+C."
  echo
  echo "💡 Wskazówka: Ctrl+C w menu gry również kończy grę."
}

function level7() {
  clear
  echo "📜 LEVEL 7: Historia poleceń"
  echo "Strzałki w górę/dół pozwalają przeglądać historię."
  echo "Ctrl+R aktywuje wyszukiwanie po historii."
}

function level7() {
  clear
  echo "� LEVEL 7: Historia poleceń"
  echo "Strzałki w górę/dół pozwalają przeglądać historię."
  echo "Ctrl+R aktywuje wyszukiwanie po historii."
}

function level8() {
  clear
  echo "�📂 LEVEL 8: Nawigacja po katalogach"
  echo "Użyj: pwd, cd .., cd ~, cd - by poruszać się między katalogami."
}

function level8() {
  clear
  echo "� LEVEL 8: Nawigacja po katalogach"
  echo "Użyj: pwd, cd .., cd ~, cd - by poruszać się między katalogami."
}

function level9() {
  clear
  echo "�📁 LEVEL 9: Operacje na plikach"
  echo "mkdir dir, mkdir -p a/b/c, rm -rf dir, cp, mv"
  echo "Przenieś plik do folderu: mv f1.txt folder/"
}

function level9() {
  clear
  echo "� LEVEL 9: Operacje na plikach"
  echo "mkdir dir, mkdir -p a/b/c, rm -rf dir, cp, mv"
  echo "Przenieś plik do folderu: mv f1.txt folder/"
}

function level10() {
  clear
  echo "�📄 LEVEL 10: Przekierowania"
  echo "Użyj: echo hello | tee out.txt"
  echo "ls >out.txt 2>&1, ls nonexist 2>/dev/null"
}

function level10() {
  clear
  echo "� LEVEL 10: Przekierowania"
  echo "Użyj: echo hello | tee out.txt"
  echo "ls >out.txt 2>&1, ls nonexist 2>/dev/null"
}

function level11() {
  clear
  echo "�🔐 LEVEL 11: Prawa dostępu"
  echo "chmod +x script.sh, chown user:group file"
  echo "Utwórz plik, nadaj mu prawa wykonywania."
}

function level11() {
  clear
  echo "� LEVEL 11: Prawa dostępu"
  echo "chmod +x script.sh, chown user:group file"
  echo "Utwórz plik, nadaj mu prawa wykonywania."
}

function level12() {
  clear
  echo "�🔎 LEVEL 12: Wyszukiwanie"
  echo "find . -name '*.txt', grep 'hello' file.txt, sed 's/old/new/'"
  echo "awk '{print $1}', rg 'foo', fd bar"
}

function level12() {
  clear
  echo "� LEVEL 12: Wyszukiwanie"
  echo "find . -name '*.txt', grep 'hello' file.txt, sed 's/old/new/'"
  echo "awk '{print $1}', rg 'foo', fd bar"
}

function level13() {
  clear
  echo "�📈 LEVEL 13: Procesy"
  echo "ps aux | grep bash, kill -9 PID, top, htop, btop"
}

function level13() {
  clear
  echo "📈 LEVEL 13: Procesy"
  echo "ps aux | grep bash, kill -9 PID, top, htop, btop"
}

function level14() {
  clear
  echo "🌐 LEVEL 14: Pobieranie danych"
  echo "curl https://example.com, wget https://example.com"
}

function level14() {
  clear
  echo "🌐 LEVEL 14: Pobieranie danych"
  echo "curl https://example.com, wget https://example.com"
}

function level15() {
  clear
  echo "🧰 LEVEL 15: Strumienie i liczenie"
  echo "tail -f file.log, head file, wc -l file, cat list | xargs rm"
}

function level15() {
  clear
  echo "🧰 LEVEL 15: Strumienie i liczenie"
  echo "tail -f file.log, head file, wc -l file, cat list | xargs rm"
}

function level16() {
  clear
  echo "👤 LEVEL 16: Informacje o użytkowniku"
  echo "whoami, id, id -u"
}

function level16() {
  clear
  echo "� LEVEL 16: Informacje o użytkowniku"
  echo "whoami, id, id -u"
}

function level17() {
  clear
  echo "�📡 LEVEL 17: Sieć"
  echo "ping 8.8.8.8, traceroute google.com, ip addr, ifconfig eth0"
}

function level17() {
  clear
  echo "📡 LEVEL 17: Sieć"
  echo "ping 8.8.8.8, traceroute google.com, ip addr, ifconfig eth0"
}

function level18() {
  clear
  echo "🎯 LEVEL 18: jq"
  echo "echo '{"name": "John"}' | jq .name"
}

function level18() {
  clear
  echo "🎯 LEVEL 18: jq"
  echo "echo '{"name": "John"}' | jq .name"
}

function level20() {
  clear
  echo "📝 LEVEL 20: Neovim"
  echo "Uruchom: nvim plik.txt"
  echo "Wpisz i (tryb insert), ESC, :wq (zapisz i wyjdź)"
}

function level21() {
  clear
  echo "🗜️ LEVEL 21: Archiwa i kompresja"
  echo "Naucz się korzystać z tar, zip i unzip."
  echo "Przykłady:"
  echo "  Rozpakuj: tar xf archive.tar"
  echo "  Stwórz: tar cf archive.tar plik1 plik2"
  echo "  Spakuj: zip archive.zip plik1 plik2"
  echo "  Rozpakuj zip: unzip archive.zip"
}

function sandbox() {
  clear
  echo "🏁 Tryb SANDBOX — masz pełną kontrolę."
  echo "Zrób co chcesz. Naciśnij Ctrl+D by wrócić do menu."
  echo
  bash
}

show_menu
