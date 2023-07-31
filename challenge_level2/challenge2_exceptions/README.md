# riscv_ctb_challenges
## Challenge 2
### Exception
#### Bug
The goal is to create configuration file for AAPG tool to generate assembly program with 10 Illegal Instructions exception. But the configuration file is not provided.
#### Fix
The configuration file is refered from [AAPG check_exceptions.yaml CI/CD template](https://gitlab.com/shaktiproject/tools/aapg/-/raw/master/tests/ci_cd_templates/check_exceptions.yaml). This file is modified to generate RV32I instructions set. All RV64 instructions are disabled. In the Exception Generation section, `ecause02: 10` is set to generate 10 Illegal Instructions exceptions. Other exceptions are disabled by setting it to `0`.
![Screenshot_2023-07-31-13-10-31-95_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/3ced18d8-3577-4319-9e6e-64bb86d6fd3d)
![Screenshot_2023-07-31-13-22-16-04_320a9a695de7cdce83ed5281148d6f19](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/eaa9aaf8-7cc6-4013-89a5-2ece9dcaf61e)
#### Known issues
The AAPG generates random instructions based on the configuration file. So for each execution, the generated assembly program will not be the same. In few execution, approximately 5 out of 6 iterations, are stuck in a loop just like the challenge 1 bugs and never ends. The same issue has been reported by multiple users and this should be an issue in the AAPG tool as the Spike model and configuration files are static and known to work.
