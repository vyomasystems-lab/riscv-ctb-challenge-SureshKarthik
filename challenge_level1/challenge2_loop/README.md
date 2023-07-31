# riscv_ctb_challenges
## Challenge 1
### Loop
#### Bug
Spike simulation goes into a loop and never ends. This is because the loop doesn't have an exit criteria.
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/bb1a2869-d83f-4ced-aab8-c05d09d991ef)

#### Fix
The aim of the test case is to perform 3 addition operations and compare the results. The `t6` register is initialised to `0` and used to keep count of number of test cases executed. The `t5` register is initialised to 3 that is the required number of test cases. On entering into the loop, the `t5` and `t6` registers are compared to check if we should exit the loop or continue the loop. On completing the add operation for each iteration, `t6` register is incremented by 1. This fix limits the number of iterations to 3 and exit the loop successfully.
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/d26a4f13-64b2-4115-bfe9-44ac41e03148)
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/570415cf-6dd0-4c2d-a14e-b0335698156f)
