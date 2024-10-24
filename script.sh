#!/bin/bash

list_of_sizes=(8, 16, 32)

for program in "$@"; do
    
    output_file="${program}.out"
    
    > "$output_file"
    
    for size in "${list_of_sizes[@]}"; do
    
        python3 "${program}.py" "$size" >> "$output_file"
    
    done
done
