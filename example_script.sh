#!/bin/bash

# Przykładowy skrypt pokazujący użycie argumentów
echo "Nazwa skryptu: $0"
echo "Liczba argumentów: $#"
echo "Wszystkie argumenty: $@"

if [ $# -eq 0 ]; then
    echo "Brak argumentów!"
    echo "Użycie: $0 arg1 arg2 ..."
    exit 1
fi

echo "Przetwarzanie argumentów:"
for arg in "$@"; do
    echo "  - $arg"
done

# Przykład funkcji
greet() {
    local name=${1:-"Nieznajomy"}
    echo "Witaj, $name!"
}

greet "$1"
