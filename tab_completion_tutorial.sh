#!/bin/bash

# Skrypt demonstracyjny tab completion
echo "=== INTERAKTYWNY TUTORIAL TAB COMPLETION ==="
echo
echo "Ten skrypt pomoże Ci nauczyć się używać TAB do uzupełniania w bash!"
echo

# Tworzenie struktury folderów do demonstracji
mkdir -p tab_completion_demo/{documents,downloads,desktop,development/{javascript,python,go}}
mkdir -p tab_completion_demo/projects/{web_app,mobile_app,data_science}

# Tworzenie plików demonstracyjnych
touch tab_completion_demo/documents/{readme.txt,notes.md,manual.pdf}
touch tab_completion_demo/downloads/{package.tar.gz,installer.deb,archive.zip}
touch tab_completion_demo/development/javascript/{app.js,package.json,webpack.config.js}
touch tab_completion_demo/development/python/{main.py,requirements.txt,setup.py}
touch tab_completion_demo/projects/web_app/{index.html,styles.css,script.js}

echo "Struktura folderów została utworzona w tab_completion_demo/"
echo
echo "ZADANIA DO WYPRÓBOWANIA:"
echo
echo "1. UZUPEŁNIANIE NAZW PLIKÓW I FOLDERÓW:"
echo "   cd tab_completion_demo/"
echo "   ls doc<TAB>        # uzupełni do documents/"
echo "   ls dev<TAB>        # uzupełni do development/"
echo "   ls documents/r<TAB> # uzupełni do readme.txt"
echo

echo "2. UZUPEŁNIANIE KOMEND:"
echo "   gre<TAB>           # uzupełni do grep"
echo "   sys<TAB><TAB>      # pokaże wszystkie komendy zaczynające się od 'sys'"
echo "   apt<TAB><TAB>      # pokaże apt-get, apt-cache, etc."
echo

echo "3. UZUPEŁNIANIE OPCJI KOMEND:"
echo "   ls -<TAB><TAB>     # pokaże wszystkie opcje ls"
echo "   git <TAB><TAB>     # pokaże wszystkie subkomendy git"
echo "   sudo systemctl <TAB><TAB> # pokaże dostępne akcje"
echo

echo "4. UZUPEŁNIANIE ZMIENNYCH:"
echo "   echo \$HO<TAB>     # uzupełni do \$HOME"
echo "   echo \$PA<TAB>     # uzupełni do \$PATH"
echo "   echo \$US<TAB>     # uzupełni do \$USER"
echo

echo "5. ZAAWANSOWANE UZUPEŁNIANIE:"
echo "   kill <TAB><TAB>    # pokaże PID procesów"
echo "   man <TAB><TAB>     # pokaże dostępne strony manual"
echo "   which <TAB><TAB>   # pokaże dostępne komendy"
echo

echo "6. PRAKTYCZNE ĆWICZENIA:"
echo "   Spróbuj przejść do: tab_completion_demo/development/python/"
echo "   Używając tylko TAB do uzupełniania nazw!"
echo "   Np: cd tab<TAB>dev<TAB>py<TAB>"
echo

echo "7. PODWÓJNY TAB - WSZYSTKIE OPCJE:"
echo "   Gdy jest wiele możliwości, podwójny TAB pokaże je wszystkie"
echo "   Przykład: cd d<TAB><TAB> pokaże wszystkie foldery zaczynające się od 'd'"
echo

echo "WSKAZÓWKI:"
echo "• TAB uzupełnia do najdłuższego wspólnego prefixu"
echo "• Podwójny TAB pokazuje wszystkie możliwości"
echo "• Bash pamięta historię i może sugerować na jej podstawie"
echo "• Case-insensitive completion jest włączone"
echo "• Korekta błędów ortograficznych jest aktywna"
echo
echo "Miłej zabawy z tab completion! 🎉"
