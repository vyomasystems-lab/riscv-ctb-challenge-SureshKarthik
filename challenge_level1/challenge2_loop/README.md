# riscv_ctb_challenges
## Challenge 1
### Loop
#### Bug
Spike simulation goes into a loop and never ends. This is because the loop doesn't have an exit criteria.
#### Fix
![Screenshot_2023-07-31-12-44-35-23_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/1b5230b3-fd4e-4fdb-8903-8bf4e89c6820)
The aim of the test case is to perform 3 addition operations and compare the results. The `t6` register is initialised to `0` and used to keep count of number of test cases executed. The `t5` register is initialised to 3 that is the required number of test cases. On entering into the loop, the `t5` and `t6` registers are compared to check if we should exit the loop or continue the loop. On completing the add operation for each iteration, `t6` register is incremented by 1. This fix limits the number of iterations to 3 and exit the loop successfully.
