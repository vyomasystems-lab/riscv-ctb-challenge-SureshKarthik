# riscv_ctb_challenges
This repository contains the following
1. Docker container references
2. RISC-V ISA verification tools
3. Assembly test programs
4. Make and check scripts
## Execution steps
```
git pull
source setup.sh
```
### Challenge 1
#### Logical
```
cd challenge_level1/challenge1_logical/
make clean
make
cd ../../
```
#### Loop
```
cd challenge_level1/challenge2_loop/
make clean
make
cd ../../
```
#### Illegal
```
cd challenge_level1/challenge3_illegal/
make clean
make
cd ../../
```
### Challenge 2
#### Instructions
```
cd challenge_level2/challenge1_instructions/
make clean
make
cd ../../
```
#### Exceptions
```
cd challenge_level2/challenge2_exceptions/
make clean
make
cd ../../
```
### Challenge 3
#### Shakti E-class Design
```
cd challenge_level3
```
Following script will clone Shakti E-class core source code from repository, apply bugs as patches, compiles the core and copies binary to the `riscv` folder
```
source model_setup.sh
cd directed_test
make
cd ../../
```
