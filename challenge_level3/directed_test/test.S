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
  li t6, 0  # counts number of fail

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
  addi t6, t6, 1

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
  addi t6, t6, 1

test_4:
  li TESTNUM, 4
  li ra, 3
  li sp, 1
  sub t5, ra, sp
  li t4, 2
  bne t5, t4, test_4_fail
  j test_end
test_4_fail:
  addi t6, t6, 1

test_end:

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
