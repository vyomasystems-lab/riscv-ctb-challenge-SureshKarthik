# riscv_ctb_challenges
## Challenge 1
### Illegal
#### Bug
Spike simulation goes into a loop and never ends. This is because the MEPC register is not incremented properly in the exception handler
#### Fix
![Screenshot_2023-07-31-12-53-31-42_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/3d43e95e-48a9-487b-988a-8f8aa8688758)
In the exception handler, the current value of MEPC register is copied to `t0` register. It is incremented by 8 to skip the `j fail` command at line 15 after the illegal exception command at line 14. In the assembly file, we will have each command in a 32 bit memory. So to skip the `j fail` command the MEPC register is incremented by 8 in the exception handler.
