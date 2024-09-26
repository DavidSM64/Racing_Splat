.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel func_800D3640
/* D4240 800D3640 40085000 */  mfc0       $t0, $10 /* handwritten instruction */
/* D4244 800D3644 310900FF */  andi       $t1, $t0, 0xFF
/* D4248 800D3648 2401E000 */  addiu      $at, $zero, -0x2000
/* D424C 800D364C 00815024 */  and        $t2, $a0, $at
/* D4250 800D3650 012A4825 */  or         $t1, $t1, $t2
/* D4254 800D3654 40895000 */  mtc0       $t1, $10 /* handwritten instruction */
/* D4258 800D3658 00000000 */  nop
/* D425C 800D365C 00000000 */  nop
/* D4260 800D3660 00000000 */  nop
/* D4264 800D3664 42000008 */  tlbp /* handwritten instruction */
/* D4268 800D3668 00000000 */  nop
/* D426C 800D366C 00000000 */  nop
/* D4270 800D3670 400B0000 */  mfc0       $t3, $0 /* handwritten instruction */
/* D4274 800D3674 3C018000 */  lui        $at, (0x80000000 >> 16)
/* D4278 800D3678 01615824 */  and        $t3, $t3, $at
/* D427C 800D367C 1560001A */  bnez       $t3, .L800D36E8
/* D4280 800D3680 00000000 */   nop
/* D4284 800D3684 42000001 */  tlbr /* handwritten instruction */
/* D4288 800D3688 00000000 */  nop
/* D428C 800D368C 00000000 */  nop
/* D4290 800D3690 00000000 */  nop
/* D4294 800D3694 400B2800 */  mfc0       $t3, $5 /* handwritten instruction */
/* D4298 800D3698 216B2000 */  addi       $t3, $t3, 0x2000 /* handwritten instruction */
/* D429C 800D369C 000B5842 */  srl        $t3, $t3, 1
/* D42A0 800D36A0 01646024 */  and        $t4, $t3, $a0
/* D42A4 800D36A4 15800004 */  bnez       $t4, .L800D36B8
/* D42A8 800D36A8 216BFFFF */   addi      $t3, $t3, -0x1 /* handwritten instruction */
/* D42AC 800D36AC 40021000 */  mfc0       $v0, $2 /* handwritten instruction */
/* D42B0 800D36B0 10000002 */  b          .L800D36BC
/* D42B4 800D36B4 00000000 */   nop
.L800D36B8:
/* D42B8 800D36B8 40021800 */  mfc0       $v0, $3 /* handwritten instruction */
.L800D36BC:
/* D42BC 800D36BC 304D0002 */  andi       $t5, $v0, 0x2
/* D42C0 800D36C0 11A00009 */  beqz       $t5, .L800D36E8
/* D42C4 800D36C4 00000000 */   nop
/* D42C8 800D36C8 3C013FFF */  lui        $at, (0x3FFFFFC0 >> 16)
/* D42CC 800D36CC 3421FFC0 */  ori        $at, $at, (0x3FFFFFC0 & 0xFFFF)
/* D42D0 800D36D0 00411024 */  and        $v0, $v0, $at
/* D42D4 800D36D4 00021180 */  sll        $v0, $v0, 6
/* D42D8 800D36D8 008B6824 */  and        $t5, $a0, $t3
/* D42DC 800D36DC 004D1020 */  add        $v0, $v0, $t5 /* handwritten instruction */
/* D42E0 800D36E0 10000002 */  b          .L800D36EC
/* D42E4 800D36E4 00000000 */   nop
.L800D36E8:
/* D42E8 800D36E8 2402FFFF */  addiu      $v0, $zero, -0x1
.L800D36EC:
/* D42EC 800D36EC 40885000 */  mtc0       $t0, $10 /* handwritten instruction */
/* D42F0 800D36F0 03E00008 */  jr         $ra
/* D42F4 800D36F4 00000000 */   nop
/* D42F8 800D36F8 00000000 */  nop
/* D42FC 800D36FC 00000000 */  nop
