.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

glabel func_800D4610
/* D5210 800D4610 4442F800 */  cfc1       $v0, $31
/* D5214 800D4614 44C4F800 */  ctc1       $a0, $31
/* D5218 800D4618 03E00008 */  jr         $ra
/* D521C 800D461C 00000000 */   nop
