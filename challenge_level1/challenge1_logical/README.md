# riscv_ctb_challenges
## Challenge 1
### Logical
#### Bug
1. z4 is an invalid rs2 register for AND instruction at line 15855 in `test.S`
2. s0 is an invalid immediate operand for ANDI instruction at line 25584 in `test.S`
#### Fix
![Screenshot_2023-07-31-12-35-56-22_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/56837e72-0ea8-48f5-8bd3-841e35d7e427)
1. `z4` register replaced as `zero` register at line 15855 in `test.S`
2. `s0` register replaced as `0` immediate value at line 25584 in `test.S`

Above fixes will result value `0` irrespective of the other operand as in AND operation if one of the operands is `0` the result will be always `0` which will not catch if there is any issue in the other operand. So the operands are updated as follows 
![Screenshot_2023-07-31-12-38-47-19_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/f0f3975d-4c12-449a-b301-4de91bac5c55)
1. `s4` register used as an operand
2. `0xF0` value used as immediate operand that masks the 2nd nibble in the `t1` register
