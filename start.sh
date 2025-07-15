#!/bin/bash

function handle_sigint() {
  echo
  echo "Dzięki za grę! 👋"
  exit 0
}

# Set up signal handler
trap handle_sigint SIGINT

LEVELS=(
  "📁 LEVEL 1: ls podstawy — wyświetlanie plików i folderów"
  "🔍 LEVEL 2: man ls — znajdź flagę -1"
  "🧠 LEVEL 3: Nawigacja w man: wyszukaj słowo 'sort'"
  "⚙️ LEVEL 4: Zmienna środowiskowa \$EDITOR"
  "🎨 LEVEL 5: Personalizacja PS1 — dostosuj swój prompt"
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
  "🗜️ LEVEL 21: Archiwa i kompresja"
  "🔧 LEVEL 22: Zaawansowane grep i regex"
  "📊 LEVEL 23: cut, paste, sort, uniq - analiza danych"
  "🔄 LEVEL 24: Pętle i warunki w bash"
  "📋 LEVEL 25: Zmienne i tablice w bash"
  "🚪 LEVEL 26: Funkcje w bash"
  "📦 LEVEL 27: Menedżery pakietów - apt, snap"
  "🔗 LEVEL 28: Linki symboliczne i twarde"
  "⏰ LEVEL 29: cron i at - planowanie zadań"
  "🌍 LEVEL 30: Zmienne środowiskowe i PATH"
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
  fi
}

function run_level() {
  case $1 in
  1) level1 ;; 2) level2 ;; 3) level3 ;; 4) level4 ;; 5) level5 ;;
  6) level6 ;; 7) level7 ;; 8) level8 ;; 9) level9 ;; 10) level10 ;;
  11) level11 ;; 12) level12 ;; 13) level13 ;; 14) level14 ;; 15) level15 ;;
  16) level16 ;; 17) level17 ;; 18) level18 ;; 19) level19 ;; 20) level20 ;;
  21) level21 ;; 22) level22 ;; 23) level23 ;; 24) level24 ;; 25) level25 ;;
  26) level26 ;; 27) level27 ;; 28) level28 ;; 29) level29 ;; 30) level30 ;;
  31) sandbox ;; 0) exit ;;
  esac
  read -p "Naciśnij Enter, by wrócić do menu..." || handle_sigint
  show_menu
}

function level1() {
  clear
  echo "📁 LEVEL 1: ls podstawy"
  echo "Zadanie: Poznaj podstawowe użycie polecenia 'ls'"
  echo
  echo "Podstawowe polecenia:"
  echo "  ls           - wyświetl pliki i foldery"
  echo "  ls -l        - format długi (szczegóły)"
  echo "  ls -a        - pokaż pliki ukryte (zaczynające się od .)"
  echo "  ls -la       - łącz opcje: długi format + pliki ukryte"
  echo "  ls -lh        - rozmiary w formacie czytelnym dla człowieka"
  echo "  ls -t        - sortuj według daty modyfikacji"
  echo "  ls -r        - odwróć kolejność sortowania"
  echo
  echo "Wypróbuj te polecenia w różnych folderach!"
  echo "Przykład: ls -la ~ (pokaż szczegóły wszystkich plików w folderze domowym)"
}

function level2() {
  clear
  echo "🔍 LEVEL 2: man ls"
  echo "Zadanie: Otwórz podręcznik polecenia 'ls' i znajdź opis flagi -1"
  echo
  echo "Użyj: man ls"
  echo "Wyszukaj flagę -1 używając: /-1 (w man page)"
  echo "Nawigacja w man:"
  echo "  q - wyjście"
  echo "  /tekst - wyszukaj tekst"
  echo "  n - następne wystąpienie"
  echo "  N - poprzednie wystąpienie"
  echo "  spacja - następna strona"
  echo "  b - poprzednia strona"
  echo
  echo "💡 Wskazówka: Flaga -1 wymusza wyświetlanie jednego pliku na linię"
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

function level8() {
  clear
  echo "� LEVEL 8: Historia poleceń"
  echo "Strzałki w górę/dół pozwalają przeglądać historię."
  echo "Ctrl+R aktywuje wyszukiwanie po historii."
}

function level9() {
  clear
  echo "� LEVEL 9: Nawigacja po katalogach"
  echo "Użyj: pwd, cd .., cd ~, cd - by poruszać się między katalogami."
}

function level10() {
  clear
  echo "� LEVEL 10: Operacje na plikach"
  echo "mkdir dir, mkdir -p a/b/c, rm -rf dir, cp, mv"
  echo "Przenieś plik do folderu: mv f1.txt folder/"
}

function level11() {
  clear
  echo "� LEVEL 11: Przekierowania"
  echo "Użyj: echo hello | tee out.txt"
  echo "ls >out.txt 2>&1, ls nonexist 2>/dev/null"
}

function level12() {
  clear
  echo "🔐 LEVEL 12: Prawa dostępu"
  echo "Zadanie: Naucz się nadawać prawa dostępu i uruchamiać pliki"
  echo
  echo "Nadawanie uprawnień:"
  echo "  chmod +x script.sh    - nadaj prawa wykonywania"
  echo "  chmod 755 script.sh   - pełne prawa dla właściciela, odczyt+wykonanie dla innych"
  echo "  chmod u+x script.sh   - dodaj prawo wykonywania dla właściciela"
  echo "  chown user:group file - zmień właściciela i grupę"
  echo
  echo "Uruchamianie plików wykonywalnych:"
  echo "  ./script.sh           - uruchom skrypt w bieżącym katalogu"
  echo "  bash script.sh        - uruchom skrypt przez bash (nie wymaga chmod +x)"
  echo "  sh script.sh          - uruchom skrypt przez sh"
  echo
  echo "💡 Wskazówka: Przed uruchomieniem ./script.sh musisz nadać prawa: chmod +x script.sh"
  echo "💡 Alternatywnie: bash script.sh działa bez chmod +x"
  echo
  echo "Przykład:"
  echo "  echo 'echo Hello World' > hello.sh"
  echo "  chmod +x hello.sh"
  echo "  ./hello.sh"
}

function level13() {
  clear
  echo "�🔎 LEVEL 13: Wyszukiwanie"
  echo "find . -name '*.txt', grep 'hello' file.txt, sed 's/old/new/'"
  echo "awk '{print $1}', rg 'foo', fd bar"
  echo
  echo "Sortowanie i przetwarzanie:"
  echo "  sort file.txt | uniq - usuń duplikaty"
  echo "  grep 'pattern' file | sort | uniq -c - znajdź, sortuj i policz"
}

function level14() {
  clear
  echo "📈 LEVEL 14: Procesy"
  echo "ps aux | grep bash, kill -9 PID, top, htop, btop"
}

function level15() {
  clear
  echo "🌐 LEVEL 15: Pobieranie danych"
  echo "curl https://example.com, wget https://example.com"
}

function level16() {
  clear
  echo "🧰 LEVEL 16: Strumienie i liczenie"
  echo "tail -f file.log, head file, wc -l file, cat list | xargs rm"
  echo
  echo "Sortowanie i usuwanie duplikatów:"
  echo "  sort file.txt     - sortuj linie w pliku"
  echo "  sort -n file.txt  - sortuj numerycznie"
  echo "  sort -r file.txt  - sortuj w odwrotnej kolejności"
  echo "  uniq file.txt     - usuń duplikaty (plik musi być posortowany!)"
  echo "  sort file.txt | uniq    - sortuj i usuń duplikaty"
  echo "  sort file.txt | uniq -c - policz wystąpienia"
  echo "  sort file.txt | uniq -d - pokaż tylko duplikaty"
  echo
  echo "Przykład: cat /etc/passwd | cut -d: -f7 | sort | uniq -c"
}

function level17() {
  clear
  echo "� LEVEL 17: Informacje o użytkowniku"
  echo "whoami, id, id -u"
}

function level18() {
  clear
  echo "📡 LEVEL 18: Sieć"
  echo "ping 8.8.8.8, traceroute google.com, ip addr, ifconfig eth0"
}

function level19() {
  clear
  echo "🎯 LEVEL 19: jq"
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

function level22() {
  clear
  echo "🔧 LEVEL 22: Zaawansowane grep i regex"
  echo "Zadanie: Naucz się używać grep z wyrażeniami regularnymi"
  echo
  echo "Podstawowe wzorce regex:"
  echo "  ^start    - linia zaczyna się od 'start'"
  echo "  end\$      - linia kończy się na 'end'"
  echo "  .         - dowolny znak"
  echo "  .*        - dowolny ciąg znaków"
  echo "  [abc]     - jeden z podanych znaków"
  echo "  [a-z]     - dowolna mała litera"
  echo "  [0-9]     - dowolna cyfra"
  echo "  \\d        - cyfra (w grep -P)"
  echo "  \\w        - znak słowa (w grep -P)"
  echo
  echo "Przydatne flagi grep:"
  echo "  -i        - ignoruj wielkość liter"
  echo "  -v        - odwróć wyszukiwanie (pokaż linie NIE zawierające wzorca)"
  echo "  -n        - numeruj linie"
  echo "  -r        - przeszukaj rekursywnie"
  echo "  -E        - rozszerzone regex (lub użyj egrep)"
  echo "  -P        - Perl regex (bardziej zaawansowane)"
  echo "  -A 3      - pokaż 3 linie po znalezieniu"
  echo "  -B 3      - pokaż 3 linie przed znalezieniem"
  echo "  -C 3      - pokaż 3 linie przed i po znalezieniu"
  echo
  echo "Przykłady:"
  echo "  grep '^[0-9]' /etc/passwd    - linie zaczynające się od cyfry"
  echo "  grep -E '(jpg|png|gif)' file - pliki graficzne"
  echo "  grep -v '^#' config.txt      - pokaż wszystko oprócz komentarzy"
  echo "  ps aux | grep -v grep        - usuń grep z wyników ps"
  echo
  echo "💡 Wskazówka: Użyj history | grep 'export' aby zobaczyć wszystkie exporty"
}

function level23() {
  clear
  echo "📊 LEVEL 23: cut, paste, sort, uniq - analiza danych"
  echo "Zadanie: Naucz się przetwarzać i analizować dane tekstowe"
  echo
  echo "cut - wycinanie kolumn:"
  echo "  cut -d: -f1 /etc/passwd      - pierwsza kolumna (delimiter :)"
  echo "  cut -c1-10 file.txt          - znaki 1-10"
  echo "  cut -f2,4 file.txt           - kolumny 2 i 4"
  echo
  echo "sort - sortowanie:"
  echo "  sort file.txt                - sortuj alfabetycznie"
  echo "  sort -n file.txt             - sortuj numerycznie"
  echo "  sort -r file.txt             - sortuj w odwrotnej kolejności"
  echo "  sort -k2 file.txt            - sortuj po 2. kolumnie"
  echo "  sort -u file.txt             - sortuj i usuń duplikaty"
  echo
  echo "uniq - usuwanie duplikatów:"
  echo "  uniq file.txt                - usuń duplikaty (plik musi być posortowany!)"
  echo "  uniq -c file.txt             - policz wystąpienia"
  echo "  uniq -d file.txt             - pokaż tylko duplikaty"
  echo "  uniq -u file.txt             - pokaż tylko unikalne"
  echo
  echo "Praktyczne przykłady:"
  echo "  cat /etc/passwd | cut -d: -f7 | sort | uniq -c"
  echo "  history | cut -c8- | sort | uniq -c | sort -nr | head -10"
  echo "  ls -la | grep '^d' | cut -c56- | sort"
  echo
  echo "💡 Wskazówka: Stwórz plik z danymi i wypróbuj powyższe polecenia"
}

function level24() {
  clear
  echo "🔄 LEVEL 24: Pętle i warunki w bash"
  echo "Zadanie: Naucz się podstawowych struktur kontrolnych"
  echo
  echo "Pętla for:"
  echo "  for i in {1..5}; do echo \$i; done"
  echo "  for file in *.txt; do echo \$file; done"
  echo "  for i in \$(seq 1 10); do echo \"Liczba \$i\"; done"
  echo
  echo "Pętla while:"
  echo "  while [ \$i -le 10 ]; do echo \$i; i=\$((i+1)); done"
  echo "  while read line; do echo \"Linia: \$line\"; done < file.txt"
  echo
  echo "Instrukcje warunkowe:"
  echo "  if [ -f file.txt ]; then echo \"Plik istnieje\"; fi"
  echo "  if [ \$USER == \"student\" ]; then echo \"Witaj studencku\"; fi"
  echo "  if [ \$# -eq 0 ]; then echo \"Brak argumentów\"; fi"
  echo
  echo "Operatory porównania:"
  echo "  -eq, -ne, -lt, -le, -gt, -ge (liczby)"
  echo "  ==, != (stringi)"
  echo "  -f (plik istnieje), -d (katalog istnieje)"
  echo "  -r (plik do odczytu), -w (plik do zapisu), -x (plik wykonywalny)"
  echo
  echo "Przykład skryptu:"
  echo "  #!/bin/bash"
  echo "  for file in *.sh; do"
  echo "    if [ -x \"\$file\" ]; then"
  echo "      echo \"\$file jest wykonywalny\""
  echo "    fi"
  echo "  done"
  echo
  echo "💡 Wskazówka: Stwórz skrypt test.sh i wypróbuj powyższe konstrukcje"
}

function level25() {
  clear
  echo "📋 LEVEL 25: Zmienne i tablice w bash"
  echo "Zadanie: Naucz się używać zmiennych i tablic"
  echo
  echo "Zmienne:"
  echo "  name=\"Jan\"                    - przypisanie"
  echo "  echo \"Cześć \$name\"            - użycie"
  echo "  echo \"Cześć \${name}!\"         - bezpieczne użycie"
  echo "  readonly PI=3.14               - zmienna tylko do odczytu"
  echo "  unset name                     - usuń zmienną"
  echo
  echo "Zmienne specjalne:"
  echo "  \$0 - nazwa skryptu"
  echo "  \$1, \$2, \$3 - argumenty skryptu"
  echo "  \$# - liczba argumentów"
  echo "  \$@ - wszystkie argumenty"
  echo "  \$? - kod wyjścia ostatniej komendy"
  echo "  \$\$ - PID obecnego procesu"
  echo
  echo "Tablice:"
  echo "  fruits=(\"apple\" \"banana\" \"orange\")"
  echo "  echo \${fruits[0]}              - pierwszy element"
  echo "  echo \${fruits[@]}              - wszystkie elementy"
  echo "  echo \${#fruits[@]}             - liczba elementów"
  echo "  fruits+=(\"grape\")              - dodaj element"
  echo
  echo "Iteracja po tablicy:"
  echo "  for fruit in \"\${fruits[@]}\"; do"
  echo "    echo \"Owoce: \$fruit\""
  echo "  done"
  echo
  echo "Przykład skryptu z argumentami:"
  echo "  #!/bin/bash"
  echo "  echo \"Nazwa skryptu: \$0\""
  echo "  echo \"Liczba argumentów: \$#\""
  echo "  echo \"Argumenty: \$@\""
  echo "  for arg in \"\$@\"; do"
  echo "    echo \"Argument: \$arg\""
  echo "  done"
  echo
  echo "💡 Wskazówka: Stwórz skrypt args.sh i uruchom go z argumentami"
}

function level26() {
  clear
  echo "🚪 LEVEL 26: Funkcje w bash"
  echo "Zadanie: Naucz się definiować i używać funkcji"
  echo
  echo "Definicja funkcji:"
  echo "  function hello() {"
  echo "    echo \"Hello \$1!\""
  echo "  }"
  echo
  echo "Lub krócej:"
  echo "  hello() {"
  echo "    echo \"Hello \$1!\""
  echo "  }"
  echo
  echo "Wywołanie funkcji:"
  echo "  hello \"World\"                 - wywołanie z argumentem"
  echo "  hello                          - wywołanie bez argumentu"
  echo
  echo "Funkcja z wartością zwracaną:"
  echo "  add() {"
  echo "    local result=\$((\\$1 + \\$2))"
  echo "    echo \$result"
  echo "  }"
  echo "  sum=\$(add 5 3)"
  echo "  echo \"Suma: \$sum\""
  echo
  echo "Zmienne lokalne:"
  echo "  calculate() {"
  echo "    local x=10                   - zmienna lokalna"
  echo "    y=20                         - zmienna globalna"
  echo "    echo \$((x + y))"
  echo "  }"
  echo
  echo "Przykład przydatnej funkcji:"
  echo "  backup() {"
  echo "    if [ -z \"\$1\" ]; then"
  echo "      echo \"Użycie: backup <plik>\""
  echo "      return 1"
  echo "    fi"
  echo "    cp \"\$1\" \"\$1.bak\""
  echo "    echo \"Backup \$1 utworzony\""
  echo "  }"
  echo
  echo "💡 Wskazówka: Dodaj funkcje do ~/.bashrc aby były dostępne zawsze"
}

function level27() {
  clear
  echo "📦 LEVEL 27: Menedżery pakietów - apt, snap"
  echo "Zadanie: Naucz się instalować i zarządzać pakietami"
  echo
  echo "APT (Advanced Package Tool):"
  echo "  sudo apt update                - aktualizuj listę pakietów"
  echo "  sudo apt upgrade               - aktualizuj zainstalowane pakiety"
  echo "  sudo apt install <pakiet>      - zainstaluj pakiet"
  echo "  sudo apt remove <pakiet>       - usuń pakiet"
  echo "  sudo apt purge <pakiet>        - usuń pakiet z konfiguracją"
  echo "  sudo apt autoremove            - usuń niepotrzebne pakiety"
  echo "  sudo apt search <nazwa>        - szukaj pakietu"
  echo "  sudo apt show <pakiet>         - pokaż informacje o pakiecie"
  echo "  apt list --installed           - pokaż zainstalowane pakiety"
  echo
  echo "SNAP (Universal packages):"
  echo "  sudo snap install <pakiet>     - zainstaluj snap"
  echo "  sudo snap remove <pakiet>      - usuń snap"
  echo "  snap list                      - pokaż zainstalowane snapy"
  echo "  snap find <nazwa>              - szukaj snapa"
  echo "  sudo snap refresh              - aktualizuj snapy"
  echo
  echo "Przykłady przydatnych pakietów:"
  echo "  sudo apt install git curl wget tree htop"
  echo "  sudo snap install code --classic"
  echo "  sudo snap install firefox"
  echo
  echo "Sprawdzanie zależności:"
  echo "  apt depends <pakiet>           - pokaż zależności"
  echo "  apt rdepends <pakiet>          - pokaż co zależy od pakietu"
  echo
  echo "💡 Wskazówka: Zawsze rób 'sudo apt update' przed instalacją"
}

function level28() {
  clear
  echo "🔗 LEVEL 28: Linki symboliczne i twarde"
  echo "Zadanie: Naucz się tworzyć i używać linków"
  echo
  echo "Link symboliczny (miękki):"
  echo "  ln -s /ścieżka/do/pliku link   - utwórz link symboliczny"
  echo "  ln -s /home/user/documents docs - link do katalogu"
  echo "  ls -l                          - pokaż linki (strzałka ->)"
  echo "  readlink link                  - pokaż do czego prowadzi link"
  echo
  echo "Link twardy:"
  echo "  ln plik.txt hardlink.txt       - utwórz link twardy"
  echo "  ls -li                         - pokaż numer i-node"
  echo
  echo "Różnice między linkami:"
  echo "  • Link symboliczny - wskazuje na ścieżkę (może być uszkodzony)"
  echo "  • Link twardy - wskazuje na ten sam i-node (współdzieli dane)"
  echo "  • Linki symboliczne mogą wskazywać na katalogi"
  echo "  • Linki twarde nie mogą wskazywać na katalogi"
  echo
  echo "Przydatne zastosowania:"
  echo "  ln -s /usr/bin/python3 /usr/local/bin/python"
  echo "  ln -s ~/.bashrc ~/dotfiles/bashrc"
  echo "  ln -s /var/log/nginx /home/user/logs"
  echo
  echo "Usuwanie linków:"
  echo "  rm link                        - usuń link (nie usuwa oryginalnego pliku)"
  echo "  unlink link                    - alternatywny sposób"
  echo
  echo "💡 Wskazówka: Utwórz link do często używanego katalogu w swoim HOME"
}

function level29() {
  clear
  echo "⏰ LEVEL 29: cron i at - planowanie zadań"
  echo "Zadanie: Naucz się automatyzować zadania"
  echo
  echo "CRON - zadania cykliczne:"
  echo "  crontab -e                     - edytuj swoje zadania cron"
  echo "  crontab -l                     - pokaż swoje zadania cron"
  echo "  crontab -r                     - usuń wszystkie zadania cron"
  echo
  echo "Format crontab: minuta godzina dzień miesiąc dzień_tygodnia polecenie"
  echo "  0 9 * * *     - codziennie o 9:00"
  echo "  */5 * * * *   - co 5 minut"
  echo "  0 0 1 * *     - pierwszego dnia każdego miesiąca o północy"
  echo "  0 18 * * 1-5  - codziennie o 18:00 od poniedziałku do piątku"
  echo
  echo "Przykłady zadań cron:"
  echo "  0 2 * * * /home/user/backup.sh"
  echo "  */10 * * * * /usr/bin/python3 /home/user/monitor.py"
  echo "  0 0 * * 0 apt update && apt upgrade -y"
  echo
  echo "AT - zadania jednorazowe:"
  echo "  at 15:30                       - uruchom o 15:30"
  echo "  at now + 1 hour               - uruchom za godzinę"
  echo "  at 2 PM tomorrow              - uruchom jutro o 14:00"
  echo "  atq                           - pokaż zaplanowane zadania"
  echo "  atrm 1                        - usuń zadanie nr 1"
  echo
  echo "Przykład użycia at:"
  echo "  echo 'echo \"Czas na przerwę!\" | wall' | at now + 30 minutes"
  echo
  echo "💡 Wskazówka: Używaj pełnych ścieżek w cron (np. /usr/bin/python3)"
  echo "💡 Przekierowuj wyjście: ... > /dev/null 2>&1 aby uniknąć emaili"
}

function level30() {
  clear
  echo "🌍 LEVEL 30: Zmienne środowiskowe i PATH"
  echo "Zadanie: Naucz się zarządzać środowiskiem systemu"
  echo
  echo "Wyświetlanie zmiennych środowiskowych:"
  echo "  env                            - pokaż wszystkie zmienne"
  echo "  printenv                       - alternatywny sposób"
  echo "  echo \$PATH                     - pokaż konkretną zmienną"
  echo "  printenv PATH                  - alternatywny sposób"
  echo
  echo "Ustawianie zmiennych:"
  echo "  export VAR=wartość             - ustaw zmienną dla tego procesu"
  echo "  export PATH=\$PATH:/new/path    - dodaj do PATH"
  echo "  unset VAR                      - usuń zmienną"
  echo
  echo "Ważne zmienne środowiskowe:"
  echo "  PATH       - katalogi z wykonywalnymi plikami"
  echo "  HOME       - katalog domowy użytkownika"
  echo "  USER       - nazwa użytkownika"
  echo "  SHELL      - domyślna powłoka"
  echo "  EDITOR     - domyślny edytor"
  echo "  LANG       - język systemu"
  echo "  PWD        - bieżący katalog"
  echo "  OLDPWD     - poprzedni katalog"
  echo
  echo "Pliki konfiguracyjne:"
  echo "  ~/.bashrc                      - wykonywany przy każdym uruchomieniu bash"
  echo "  ~/.bash_profile                - wykonywany przy logowaniu"
  echo "  ~/.profile                     - wykonywany przy logowaniu (uniwersalny)"
  echo "  /etc/environment               - systemowe zmienne (Ubuntu)"
  echo
  echo "Przykłady praktyczne:"
  echo "  export EDITOR=nvim"
  echo "  export PATH=\"\$HOME/bin:\$PATH\""
  echo "  export HISTSIZE=10000"
  echo "  export HISTFILESIZE=10000"
  echo
  echo "Sprawdzanie PATH:"
  echo "  echo \$PATH | tr ':' '\\n'       - pokaż PATH w pionowej liście"
  echo "  which command                  - znajdź gdzie jest polecenie"
  echo "  whereis command                - znajdź wszystkie lokalizacje"
  echo
  echo "💡 Wskazówka: Dodaj często używane ustawienia do ~/.bashrc"
}

function sandbox() {
  clear
  echo "🏁 Tryb SANDBOX — masz pełną kontrolę."
  echo "Zrób co chcesz. Naciśnij Ctrl+D by wrócić do menu."
  echo
  bash
}

show_menu
