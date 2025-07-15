#!/bin/bash

LEVELS=(
  "🔍 LEVEL 1: man ls — znajdź flagę -1"
  "🧠 LEVEL 2: Nawigacja w man: wyszukaj słowo 'sort'"
  "⚙️ LEVEL 3: Zmienna środowiskowa \$EDITOR"
  "🚀 LEVEL 4: Ruch w linii — Ctrl+A, Ctrl+E, Backspace"
  "🧹 LEVEL 5: Ctrl+C, clear/reset"
  "📜 LEVEL 6: Historia — strzałka w górę, Ctrl+R"
  "📂 LEVEL 7: cd, pwd, cd -, cd ~"
  "📁 LEVEL 8: mkdir, rm, cp, mv"
  "📄 LEVEL 9: tee, >out.txt 2>&1, 2>/dev/null"
  "🔐 LEVEL 10: chmod, chown"
  "🔎 LEVEL 11: find, grep, awk, sed, rg, fd"
  "📈 LEVEL 12: ps aux, kill -9, top, htop, btop"
  "🌐 LEVEL 13: curl, wget"
  "🧰 LEVEL 14: tail, head, wc -l, xargs"
  "👤 LEVEL 15: whoami, id"
  "📡 LEVEL 16: ping, traceroute, ip addr, ifconfig"
  "🎯 LEVEL 17: jq"
  "📝 LEVEL 18: neovim podstawy"
  "🗜️ LEVEL 19: Archiwa i kompresja"
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
  read -p "Wybierz poziom: " choice
  if [[ $choice =~ ^[0-9]+$ && $choice -ge 0 && $choice -le ${#LEVELS[@]} ]]; then
    run_level $choice
  else
    echo "Nieprawidłowy wybór. Naciśnij Enter."
    read
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
  16) level16 ;; 17) level17 ;; 18) level18 ;; 19) sandbox ;; 0) exit ;;
  esac
  read -p "Naciśnij Enter, by wrócić do menu..."
  show_menu
}

function level1() {
  clear
  echo "🔍 LEVEL 1: man ls"
  echo "Zadanie: Otwórz podręcznik polecenia 'ls' i znajdź opis flagi -1"
  echo "Użyj: man ls, /-1 by wyszukać"
}

function level2() {
  clear
  echo "🧠 LEVEL 2: Wyszukiwanie w man"
  echo "Zadanie: Otwórz man ls, wyszukaj słowo 'sort' (użyj /sort) i przejdź dalej (n/N)"
}

function level3() {
  clear
  echo "⚙️ LEVEL 3: \$EDITOR"
  echo "Sprawdź swoją zmienną środowiskową \$EDITOR (echo \$EDITOR) lub ustaw ją na neovim"
  echo "Ustawienie: export EDITOR=nvim"
}

function level4() {
  clear
  echo "🚀 LEVEL 4: Poruszanie się po linii"
  echo "Użyj: Ctrl+A (początek), Ctrl+E (koniec), Backspace, Ctrl+D (usuń)"
  echo "Wprowadź długie polecenie i poćwicz nawigację."
}

function level5() {
  clear
  echo "🧹 LEVEL 5: Czyszczenie i anulowanie"
  echo "Użyj Ctrl+C by przerwać proces, a clear lub reset by wyczyścić ekran."
  echo "Wpisz sleep 100 i anuluj go Ctrl+C."
}

function level6() {
  clear
  echo "📜 LEVEL 6: Historia poleceń"
  echo "Strzałki w górę/dół pozwalają przeglądać historię."
  echo "Ctrl+R aktywuje wyszukiwanie po historii."
}

function level7() {
  clear
  echo "📂 LEVEL 7: Nawigacja po katalogach"
  echo "Użyj: pwd, cd .., cd ~, cd - by poruszać się między katalogami."
}

function level8() {
  clear
  echo "📁 LEVEL 8: Operacje na plikach"
  echo "mkdir dir, mkdir -p a/b/c, rm -rf dir, cp, mv"
  echo "Przenieś plik do folderu: mv f1.txt folder/"
}

function level9() {
  clear
  echo "📄 LEVEL 9: Przekierowania"
  echo "Użyj: echo hello | tee out.txt"
  echo "ls >out.txt 2>&1, ls nonexist 2>/dev/null"
}

function level10() {
  clear
  echo "🔐 LEVEL 10: Prawa dostępu"
  echo "chmod +x script.sh, chown user:group file"
  echo "Utwórz plik, nadaj mu prawa wykonywania."
}

function level11() {
  clear
  echo "🔎 LEVEL 11: Wyszukiwanie"
  echo "find . -name '*.txt', grep 'hello' file.txt, sed 's/old/new/'"
  echo "awk '{print $1}', rg 'foo', fd bar"
}

function level12() {
  clear
  echo "📈 LEVEL 12: Procesy"
  echo "ps aux | grep bash, kill -9 PID, top, htop, btop"
}

function level13() {
  clear
  echo "🌐 LEVEL 13: Pobieranie danych"
  echo "curl https://example.com, wget https://example.com"
}

function level14() {
  clear
  echo "🧰 LEVEL 14: Strumienie i liczenie"
  echo "tail -f file.log, head file, wc -l file, cat list | xargs rm"
}

function level15() {
  clear
  echo "👤 LEVEL 15: Informacje o użytkowniku"
  echo "whoami, id, id -u"
}

function level16() {
  clear
  echo "📡 LEVEL 16: Sieć"
  echo "ping 8.8.8.8, traceroute google.com, ip addr, ifconfig eth0"
}

function level17() {
  clear
  echo "🎯 LEVEL 17: jq"
  echo "echo '{"name": "John"}' | jq .name"
}

function level18() {
  clear
  echo "📝 LEVEL 18: Neovim"
  echo "Uruchom: nvim plik.txt"
  echo "Wpisz i (tryb insert), ESC, :wq (zapisz i wyjdź)"
}

function level19() {
  clear
  echo "🗜️ LEVEL 19: Archiwa i kompresja"
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
