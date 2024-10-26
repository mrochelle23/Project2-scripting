#!/bin/bash

# Define an array
list_of_sizes=(8 16 32)

# Loop through each program name passed as an argument
for program in "$@"; do
    # Create the output file name by appending .out to the program name
    output_file="${program}.out"

    # Create the output file
    : > "$output_file"

    # Loop through each size in the list_of_sizes array
    for size in "${list_of_sizes[@]}"; do
        # Run the program with the current size and save the output
        python3 "${program}.py" "$size" >> "$output_file"
    done
done
