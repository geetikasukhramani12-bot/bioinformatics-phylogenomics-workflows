#!/usr/bin/env python3

"""
Clean FASTA sequence identifiers.
"""

input_file = "input.fasta"
output_file = "cleaned.fasta"

with open(input_file, "r") as infile, open(output_file, "w") as outfile:

    for line in infile:

        if line.startswith(">"):

            sequence_id = line[1:].strip()

            # Replace spaces with underscores
            sequence_id = sequence_id.replace(" ", "_")

            outfile.write(f">{sequence_id}\n")

        else:

            outfile.write(line.strip() + "\n")

print("FASTA identifiers cleaned successfully.")
