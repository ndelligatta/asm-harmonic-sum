# Harmonic Sum Calculator (Hybrid Assembly, C, and C++)

Welcome to the Harmonic Sum Calculator project! This repository showcases a hybrid programming approach that combines x86 assembly, C, and C++ to create an efficient harmonic sum calculator. The project was developed as part of CPSC 240 Assembly course and demonstrates the integration of different languages to achieve a functional and educational program.

The Harmonic Sum Calculator calculates the total sum of the [Harmonic Series]([https://duckduckgo.com](https://en.wikipedia.org/wiki/Harmonic_series_(mathematics))).

## About

In this project, we use a hybrid approach to leverage the strengths of assembly, C, and C++ programming languages:

- **Assembly (`harmonic.asm`):** The assembly code performs efficient calculations for the harmonic sum. It provides the core computation logic for the calculator.

- **C (`statistics.c`):** The C driver program coordinates the overall functionality of the calculator. It handles user input/output, interacts with assembly and C++ components, and ensures the smooth operation of the calculator.

- **C++ (`isfloat.cpp` and `reciprocal_sum.cpp`):** The C++ code assists in facilitating input validation (checking for floating-point numbers) and computing the reciprocal sum.

## Usage

To run the Harmonic Sum Calculator:

1. Ensure you have the necessary toolchains installed (NASM, GCC, and G++).
2. Open your terminal or command prompt.
3. Navigate to the project directory.
4. Run the `r.sh` script to assemble, compile, and link the program:

   ```bash
   ./r.sh
Execute the generated my.out executable to launch the calculator:

./my.out

## Author
Nolan Delligatta
CPSC 240-03
Contact: ndelligatta@csu.fullerton.edu

## Contents
harmonic.asm: Assembly code for harmonic sum calculation.
statistics.c: C driver program that coordinates the calculator's functionality.
isfloat.cpp: C++ code for validating floating-point input.
reciprocal_sum.cpp: C++ code for calculating reciprocal sum.
r.sh: Bash script for assembling, compiling, and linking the program.

## Notes
This project was created as a part of CPSC 240 Assembly course.
The hybrid programming approach demonstrates the synergy of assembly, C, and C++ for efficient and functional programming.
