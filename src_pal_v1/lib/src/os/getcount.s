.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel osGetCount
/* C8560 800C7960 40024800 */  mfc0       $v0, $9 /* handwritten instruction */
/* C8564 800C7964 03E00008 */  jr         $ra
/* C8568 800C7968 00000000 */   nop
/* C856C 800C796C 00000000 */  nop
