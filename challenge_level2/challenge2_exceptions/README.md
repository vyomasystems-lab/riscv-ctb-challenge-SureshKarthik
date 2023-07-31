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

The seed is set to 2 to generate the same illegal instructions every run
![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/60454524-3021-47ae-8447-c64e24eb62ff)


The following illegal instructions are defined in test_template.S
```
.macro ecause02_00000
.word 0xD3DA616B
.endm
      
.macro ecause02_00001
.word 0xA28F57BF
.endm
      
.macro ecause02_00002
.word 0xB0531D53
.endm
      
.macro ecause02_00003
.word 0xB0531D53
.endm
      
.macro ecause02_00004
.word 0x649468B
.endm
      
.macro ecause02_00005
.word 0x4BF7590F
.endm
      
.macro ecause02_00006
.word 0xBB00092F
.endm
      
.macro ecause02_00007
.word 0x28B9A853
.endm
      
.macro ecause02_00008
.word 0x572C93F
.endm
      
.macro ecause02_00009
.word 0xD03DD87B
.endm
```

The same is observed in the disassembly file

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/a992f697-4a74-4438-a49c-0f1af8e2e784)

The custom trap handler is enabled in the AAPG configuration file. So the MTVEC register is pointed to the `custom_trap_handler`

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/bd98877c-66d1-407d-a649-276b79f91790)

The MEPC register is incremented by 4 for 32-bit instruction in the `custom_trap_handler`

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/9635e4de-5529-40fe-8659-421dab4a1186)

Illegal Instruction Exceptions

![image](https://github.com/vyomasystems-lab/riscv-ctb-challenge-SureshKarthik/assets/7915301/ea07e333-8631-4cdd-9735-edb3b6275140)
