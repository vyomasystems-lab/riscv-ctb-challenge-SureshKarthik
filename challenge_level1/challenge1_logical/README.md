# riscv_ctb_challenges
## Challenge 1
### Logical
#### Bug
The following errors are observed during make
1. test.S:15855: Error: illegal operands `and s7,ra,z4'
2. test.S:25584: Error: illegal operands `andi s5,t1,s0'
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/223a319d-3e38-469d-b4ba-fa1f588b524c)

The following are the causes for the errors
1. z4 is an invalid rs2 register for AND instruction at line 15855 in `test.S`
2. s0 is an invalid immediate operand for ANDI instruction at line 25584 in `test.S`
#### Fix
The following are the fixes applied
1. `z4` register replaced as `zero` register at line 15855 in `test.S`
2. `s0` register replaced as `0` immediate value at line 25584 in `test.S`
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/7602356e-5f8c-4533-8a89-8c6bf7ff5383)

Above fixes will result value `0` irrespective of the other operand as in AND operation if one of the operands is `0` the result will be always `0` which will not catch if there is any issue in the other operand. So the operands are updated as follows 
1. `s4` register used as an operand
2. `0xF0` value used as immediate operand that masks the 2nd nibble in the `t1` register
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/f8b4def1-41f4-4332-a719-4285194aeb70)
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/024e2dd9-68b9-48f2-937f-fc2f90af51ab)
