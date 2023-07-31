# riscv_ctb_challenges
## Challenge 2
### Instructions
#### Bug
64-bit instructions generated in the AAPG generated assembly code. Incorrect configuration file enabled 64-bit instructions for a 32-bit simulation target.
#### Fix
![Screenshot_2023-07-31-13-02-27-04_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/8317fa31-4ba9-4da8-822a-b805a705d100)
In `rv32i.yaml` file at line 66, `rel_rv64m: 10` is replaced to `rel_rv64m: 0` that disabling the RV64M instructions in the generated assembly program.
