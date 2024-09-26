.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

glabel func_800D0570
/* D1170 800D0570 28A1000C */  slti       $at, $a1, 0xC
/* D1174 800D0574 1420001D */  bnez       $at, .L800D05EC
/* D1178 800D0578 00041823 */   negu      $v1, $a0
/* D117C 800D057C 30630003 */  andi       $v1, $v1, 0x3
/* D1180 800D0580 10600003 */  beqz       $v1, .L800D0590
/* D1184 800D0584 00A32823 */   subu      $a1, $a1, $v1
/* D1188 800D0588 A8800000 */  swl        $zero, 0x0($a0)
/* D118C 800D058C 00832021 */  addu       $a0, $a0, $v1
.L800D0590:
/* D1190 800D0590 2401FFE0 */  addiu      $at, $zero, -0x20
/* D1194 800D0594 00A13824 */  and        $a3, $a1, $at
/* D1198 800D0598 10E0000C */  beqz       $a3, .L800D05CC
/* D119C 800D059C 00A72823 */   subu      $a1, $a1, $a3
/* D11A0 800D05A0 00E43821 */  addu       $a3, $a3, $a0
.L800D05A4:
/* D11A4 800D05A4 24840020 */  addiu      $a0, $a0, 0x20
/* D11A8 800D05A8 AC80FFE0 */  sw         $zero, -0x20($a0)
/* D11AC 800D05AC AC80FFE4 */  sw         $zero, -0x1C($a0)
/* D11B0 800D05B0 AC80FFE8 */  sw         $zero, -0x18($a0)
/* D11B4 800D05B4 AC80FFEC */  sw         $zero, -0x14($a0)
/* D11B8 800D05B8 AC80FFF0 */  sw         $zero, -0x10($a0)
/* D11BC 800D05BC AC80FFF4 */  sw         $zero, -0xC($a0)
/* D11C0 800D05C0 AC80FFF8 */  sw         $zero, -0x8($a0)
/* D11C4 800D05C4 1487FFF7 */  bne        $a0, $a3, .L800D05A4
/* D11C8 800D05C8 AC80FFFC */   sw        $zero, -0x4($a0)
.L800D05CC:
/* D11CC 800D05CC 2401FFFC */  addiu      $at, $zero, -0x4
/* D11D0 800D05D0 00A13824 */  and        $a3, $a1, $at
/* D11D4 800D05D4 10E00005 */  beqz       $a3, .L800D05EC
/* D11D8 800D05D8 00A72823 */   subu      $a1, $a1, $a3
/* D11DC 800D05DC 00E43821 */  addu       $a3, $a3, $a0
.L800D05E0:
/* D11E0 800D05E0 24840004 */  addiu      $a0, $a0, 0x4
/* D11E4 800D05E4 1487FFFE */  bne        $a0, $a3, .L800D05E0
/* D11E8 800D05E8 AC80FFFC */   sw        $zero, -0x4($a0)
.L800D05EC:
/* D11EC 800D05EC 18A00005 */  blez       $a1, .L800D0604
/* D11F0 800D05F0 00000000 */   nop
/* D11F4 800D05F4 00A42821 */  addu       $a1, $a1, $a0
.L800D05F8:
/* D11F8 800D05F8 24840001 */  addiu      $a0, $a0, 0x1
/* D11FC 800D05FC 1485FFFE */  bne        $a0, $a1, .L800D05F8
/* D1200 800D0600 A080FFFF */   sb        $zero, -0x1($a0)
.L800D0604:
/* D1204 800D0604 03E00008 */  jr         $ra
/* D1208 800D0608 00000000 */   nop
/* D120C 800D060C 00000000 */  nop
