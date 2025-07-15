#!/bin/bash

# Przykładowy skrypt backup
backup_dir="$HOME/backups"
timestamp=$(date +%Y%m%d_%H%M%S)

# Funkcja tworzenia backupu
backup_file() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        echo "Błąd: Plik '$file' nie istnieje"
        return 1
    fi
    
    # Utwórz katalog backup jeśli nie istnieje
    mkdir -p "$backup_dir"
    
    # Skopiuj plik z timestamp
    local backup_name="${backup_dir}/$(basename "$file")_${timestamp}.bak"
    cp "$file" "$backup_name"
    
    echo "Backup utworzony: $backup_name"
}

# Użycie funkcji
if [ $# -eq 0 ]; then
    echo "Użycie: $0 <plik1> [plik2] ..."
    exit 1
fi

for file in "$@"; do
    backup_file "$file"
done
