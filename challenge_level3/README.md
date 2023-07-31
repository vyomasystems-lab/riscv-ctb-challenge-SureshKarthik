# riscv_ctb_challenges
## Challenge 3
### Shakti E-class core design
#### Installation
Following script will clone Shakti E-class core source code from repository, apply bugs as patches, compiles the core and copies binary to the riscv folder
```
source model_setup.sh
```
#### Execution
```
cd directed_test
make
```
#### Testbench
The test program is directed with few arithmetic, comparison and exception test cases at `directed_test/test.S` file. The test program is modified to continue execution and complete all the 5 test cases with an error counter incremented in case of an error.
| ID  | Instruction | Expected result | Observed result | Status |
| --- | --- | --- | --- | --- |
| 2  | ADD | t5=1  | t5=1  | Pass|
| 3  | AND | t5=1  | t5=2  | Fail|
| 4  | SUB | t5=2  | t5=4  | Fail|
| 5  | SLT | t5=0  | t5=0  | Pass|
| 6  | 0 | MCAUSE=2  | MCAUSE=0  | Fail|
The `t2` register is incremented for each failure. It counts to 3 bugs in various parts of the RISC-V design ALU and decoder.
#### Bugs
The bugs are carefully chosen to not tamper the normal operation of the Shakti E-class core so that the trace dump difference is meaningful and related to the number of bugs inserted.
##### Bug 1
In ALU,  src/core/alu.bsv file, the FNAND case is not handled. This is a typical error in switch case where all the possible cases are not handled. In this case the result multiplexer will use default case for AND operation which will resutl in XOR operation.
![Screenshot_2023-07-31-13-39-02-85_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/9393319c-3e3b-4ae0-a700-1e4a3b011dbe)

##### Bug 2
In ALU, src/core/alu.bsv file, the 2's complement step is missed in the subtraction operation. This will result in addition resutl for all subtraction operation.
![Screenshot_2023-07-31-13-39-22-77_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/a9afd73b-eb39-4d01-ad26-f5615d991f37)

##### Bug 3
In decoder, src/core/decode.bsv file, MCAUSE register is not set to 2 for any illegal instruction decoded. This will result in difference in the MCAUSE register in case of an illegal instruction exception.
![Screenshot_2023-07-31-13-39-36-08_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/e154cbd1-a884-4a6b-9351-cb84c19efdba)

#### Trace
1. 44c44: `t5` output register is expected as 1 in spike.dump but observed as 2 in rtl.dump. This is because of the XOR operation when AND is invoked.
2. 47c47: `t2` error counter register is incremented to 1 in rtl.dump
3. 51c51: `t5` output register is expected as 2 in spike.dump but observed as 4 in rtl.dump. This is because of the addition operation when subtraction is invoked.
4. 54c54: `t2` error counter register is incremented to 2 in rtl.dump
5. 63c63 and 75c75: `MCAUSE` register is expected as 2 in spike.dump but observed as 0 in rtl.dump. This is because the MCAUSE register is not updated in case of an illegal instruction exception.
6. 77c77: `t2` error counter register is incremented to 3 in rtl.dump. 
![Screenshot_2023-07-31-13-41-20-08_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/3ffdf86c-2a31-4b3b-924f-b5ada607b562)

With `t2` counting 3, we caught all the 3 bugs inserted in the RISC-V ISA design.
