# riscv_ctb_challenges
## Challenge 2
### Exception
#### Bug
The goal is to create configuration file for AAPG tool to generate assembly program with 10 Illegal Instructions exception. But the configuration file is not provided.
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/34cad288-a84d-416e-b014-3e8617f1d2e1)

#### Fix
The configuration file is refered from [AAPG check_exceptions.yaml CI/CD template](https://gitlab.com/shaktiproject/tools/aapg/-/raw/master/tests/ci_cd_templates/check_exceptions.yaml). This file is modified to generate RV32I instructions set. All RV64 instructions are disabled. In the Exception Generation section, `ecause02: 10` is set to generate 10 Illegal Instructions exceptions. Other exceptions are disabled by setting it to `0`.

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/d782f1d2-452f-4056-8876-9dafe9059df9)

The illegal instruction is chosen randomly by the AAPG tool.

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/509c35f6-09b4-47b3-aab5-ba09572fce64)

The following illegal instructions are defined in test_template.S
```
.macro ecause02_00000
.word 0x8CFC9B93
.endm
      
.macro ecause02_00001
.word 0x44B4F43F
.endm
      
.macro ecause02_00002
.word 0xEB68C7B
.endm
      
.macro ecause02_00003
.word 0x4553ED3F
.endm
      
.macro ecause02_00004
.word 0x4553ED3F
.endm
      
.macro ecause02_00005
.word 0xEB68C7B
.endm
      
.macro ecause02_00006
.word 0xA887595F
.endm
      
.macro ecause02_00007
.word 0x5787787F
.endm
      
.macro ecause02_00008
.word 0x7E02631F
.endm
      
.macro ecause02_00009
.word 0x5787787F
.endm
```

The same is observed in the disassembly file

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/f8494bea-25e3-4bf8-b438-914b3a4ed52b)

The custom trap handler is enabled in the AAPG configuration file. So the MTVEC register is pointed to the `custom_trap_handler`

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/bd98877c-66d1-407d-a649-276b79f91790)

The MEPC register is incremented by 4 for 32-bit instruction

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/62d89a6e-2fe7-4829-b22d-0048dbb9bd13)

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/97bacc4f-cbd2-406e-932f-7faa0c52426b)

#### Known issues
The AAPG generates random instructions based on the configuration file. So for each execution, the generated assembly program will not be the same. In few execution, approximately 5 out of 6 iterations, are stuck in a loop just like the challenge 1 bugs and never ends. The same issue has been reported by multiple users and this should be an issue in the AAPG tool as the Spike model and configuration files are static and known to work.
