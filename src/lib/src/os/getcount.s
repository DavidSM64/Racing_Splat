.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel osGetCount
/* C84D0 800C78D0 40024800 */  mfc0       $v0, $9 /* handwritten instruction */
/* C84D4 800C78D4 03E00008 */  jr         $ra
/* C84D8 800C78D8 00000000 */   nop
/* C84DC 800C78DC 00000000 */  nop
