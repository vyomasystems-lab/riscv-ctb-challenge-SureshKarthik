# See LICENSE for license details.

#*****************************************************************************
# test.S
#-----------------------------------------------------------------------------
#
# Test RV32I instructions.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

  .align 2
  .option norvc
  li t2, 0  # counts number of fail

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

test_2:
  li TESTNUM, 2
  li ra, 1
  li sp, 0
  add t5, ra, sp
  li t4, 1
  bne t5, t4, test_2_fail
  j test_3
test_2_fail:
  addi t2, t2, 1

  #-------------------------------------------------------------
  # Logical tests
  #-------------------------------------------------------------

test_3:
  li TESTNUM, 3
  li ra, 1
  li sp, 3
  and t5, ra, sp
  li t4, 1
  bne t5, t4, test_3_fail
  j test_4
test_3_fail:
  addi t2, t2, 1

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

test_4:
  li TESTNUM, 4
  li ra, 3
  li sp, 1
  sub t5, ra, sp
  li t4, 2
  bne t5, t4, test_4_fail
  j test_5
test_4_fail:
  addi t2, t2, 1

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

test_5:
  li TESTNUM, 5
  li ra, 3
  li sp, 1
  slt t5, ra, sp
  li t4, 0
  bne t5, t4, test_5_fail
  j test_6
test_5_fail:
  addi t2, t2, 1

  #-------------------------------------------------------------
  # Illegal instruction tests
  #-------------------------------------------------------------

test_6:
  li TESTNUM, 6
  .word 0

test_end:

  TEST_PASSFAIL

  .align 8
  .global mtvec_handler
mtvec_handler:
  li t1, CAUSE_ILLEGAL_INSTRUCTION
  csrr t0, mcause
  bne t0, t1, test_6_fail
  j test_6_pass
test_6_fail:
  addi t2, t2, 1
test_6_pass:
  csrr t0, mepc
  addi t0, t0, 4 # increment return address by 4
  csrw mepc, t0
  mret

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
