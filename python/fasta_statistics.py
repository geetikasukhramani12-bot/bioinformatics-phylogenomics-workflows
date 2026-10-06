#!/usr/bin/env python3

"""
FASTA sequence statistics

Calculates:
- Number of sequences
- Sequence lengths
- GC content
"""

from pathlib import Path


def read_fasta(filename):
    sequences = {}
    current_id = None
    sequence = []

    with open(filename, "r") as file:
        for line in file:
            line = line.strip()

            if line.startswith(">"):
                if current_id is not None:
                    sequences[current_id] = "".join(sequence)

                current_id = line[1:]
                sequence = []
            else:
                sequence.append(line)

        if current_id is not None:
            sequences[current_id] = "".join(sequence)

    return sequences


def gc_content(sequence):
    sequence = sequence.upper()

    if not sequence:
        return 0

    gc = sequence.count("G") + sequence.count("C")

    return (gc / len(sequence)) * 100


fasta_file = "input.fasta"

sequences = read_fasta(fasta_file)

print(f"Number of sequences: {len(sequences)}")

for sequence_id, sequence in sequences.items():
    print(f"Sequence: {sequence_id}")
    print(f"Length: {len(sequence)} bp")
    print(f"GC content: {gc_content(sequence):.2f}%")
    print()
