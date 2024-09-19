.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

glabel bzero
/* D10E0 800D04E0 28A1000C */  slti       $at, $a1, 0xC
/* D10E4 800D04E4 1420001D */  bnez       $at, .L800D055C
/* D10E8 800D04E8 00041823 */   negu      $v1, $a0
/* D10EC 800D04EC 30630003 */  andi       $v1, $v1, 0x3
/* D10F0 800D04F0 10600003 */  beqz       $v1, .L800D0500
/* D10F4 800D04F4 00A32823 */   subu      $a1, $a1, $v1
/* D10F8 800D04F8 A8800000 */  swl        $zero, 0x0($a0)
/* D10FC 800D04FC 00832021 */  addu       $a0, $a0, $v1
.L800D0500:
/* D1100 800D0500 2401FFE0 */  addiu      $at, $zero, -0x20
/* D1104 800D0504 00A13824 */  and        $a3, $a1, $at
/* D1108 800D0508 10E0000C */  beqz       $a3, .L800D053C
/* D110C 800D050C 00A72823 */   subu      $a1, $a1, $a3
/* D1110 800D0510 00E43821 */  addu       $a3, $a3, $a0
.L800D0514:
/* D1114 800D0514 24840020 */  addiu      $a0, $a0, 0x20
/* D1118 800D0518 AC80FFE0 */  sw         $zero, -0x20($a0)
/* D111C 800D051C AC80FFE4 */  sw         $zero, -0x1C($a0)
/* D1120 800D0520 AC80FFE8 */  sw         $zero, -0x18($a0)
/* D1124 800D0524 AC80FFEC */  sw         $zero, -0x14($a0)
/* D1128 800D0528 AC80FFF0 */  sw         $zero, -0x10($a0)
/* D112C 800D052C AC80FFF4 */  sw         $zero, -0xC($a0)
/* D1130 800D0530 AC80FFF8 */  sw         $zero, -0x8($a0)
/* D1134 800D0534 1487FFF7 */  bne        $a0, $a3, .L800D0514
/* D1138 800D0538 AC80FFFC */   sw        $zero, -0x4($a0)
.L800D053C:
/* D113C 800D053C 2401FFFC */  addiu      $at, $zero, -0x4
/* D1140 800D0540 00A13824 */  and        $a3, $a1, $at
/* D1144 800D0544 10E00005 */  beqz       $a3, .L800D055C
/* D1148 800D0548 00A72823 */   subu      $a1, $a1, $a3
/* D114C 800D054C 00E43821 */  addu       $a3, $a3, $a0
.L800D0550:
/* D1150 800D0550 24840004 */  addiu      $a0, $a0, 0x4
/* D1154 800D0554 1487FFFE */  bne        $a0, $a3, .L800D0550
/* D1158 800D0558 AC80FFFC */   sw        $zero, -0x4($a0)
.L800D055C:
/* D115C 800D055C 18A00005 */  blez       $a1, .L800D0574
/* D1160 800D0560 00000000 */   nop
/* D1164 800D0564 00A42821 */  addu       $a1, $a1, $a0
.L800D0568:
/* D1168 800D0568 24840001 */  addiu      $a0, $a0, 0x1
/* D116C 800D056C 1485FFFE */  bne        $a0, $a1, .L800D0568
/* D1170 800D0570 A080FFFF */   sb        $zero, -0x1($a0)
.L800D0574:
/* D1174 800D0574 03E00008 */  jr         $ra
/* D1178 800D0578 00000000 */   nop
/* D117C 800D057C 00000000 */  nop
