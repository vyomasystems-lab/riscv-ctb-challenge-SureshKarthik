# riscv_ctb_challenges
## Challenge 1
### Illegal
#### Bug
Spike simulation goes into a loop and never ends. This is because the MEPC register is not incremented properly in the exception handler
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/3a610a2a-da54-4579-ab68-6635b2c5e455)

#### Fix
In the exception handler, the current value of MEPC register is copied to `t0` register. It is incremented by 8 to skip the `j fail` command at line 15 after the illegal exception command at line 14. In the assembly file, we will have each command in a 32 bit memory. So to skip the `j fail` command the MEPC register is incremented by 8 in the exception handler.
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/735fed15-c3a5-47c0-b39e-a2902b5ecfa6)
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/74dfc795-f47c-4979-a74f-0c8b0629ed2c)
