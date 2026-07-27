#!/bin/bash

# Bu skriptin qovluğunu tapırıq ki, messages.sh-i cari qovluqdan asılı olmadan source edə bilək
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/messages.sh"

# 1. Fayl adının arqument kimi verilməsini tələb edirik
if [ $# -eq 0 ]; then
    display_error "No file specified. Usage: $0 <file_name>"
    exit 1
fi

file_name="$1"

# 2. Faylın mövcud olub-olmadığını yoxlayırıq
if [ ! -f "$file_name" ]; then
    display_error "File '$file_name' does not exist."
    exit 1
fi

# 3. Faylın həqiqi ELF faylı olub-olmadığını yoxlayırıq
if ! file "$file_name" | grep -q "ELF"; then
    display_error "'$file_name' is not a valid ELF file."
    exit 1
fi

# 4. Header məlumatını readelf ilə çıxarırıq
header_info=$(readelf -h "$file_name" 2>/dev/null)

if [ -z "$header_info" ]; then
    display_error "Could not read ELF header for '$file_name'."
    exit 1
fi

magic_number=$(echo "$header_info" | grep "Magic:" | sed 's/.*Magic:[[:space:]]*//')
class=$(echo "$header_info" | grep "Class:" | awk -F': *' '{print $2}')
byte_order=$(echo "$header_info" | grep "Data:" | awk -F': *' '{print $2}')
entry_point_address=$(echo "$header_info" | grep "Entry point address:" | awk -F': *' '{print $2}')

# 5. messages.sh vasitəsilə nəticəni göstəririk
display_elf_header_info
