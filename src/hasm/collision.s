.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .rodata

glabel D_800E5F60
.float -0.1
glabel D_800E5F64
.float -0.1
glabel D_800E5F68
.float 0.707
glabel D_800E5F6C
.float 0.45
glabel D_800E5F70
.float -0.1

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel func_80031130
/* 31D30 80031130 27BDFF90 */  addiu      $sp, $sp, -0x70
/* 31D34 80031134 3C080001 */  lui        $t0, (0x186A0 >> 16)
/* 31D38 80031138 3C09FFFE */  lui        $t1, (0xFFFE7960 >> 16)
/* 31D3C 8003113C AFB6002C */  sw         $s6, 0x2C($sp)
/* 31D40 80031140 AFB50028 */  sw         $s5, 0x28($sp)
/* 31D44 80031144 AFB40024 */  sw         $s4, 0x24($sp)
/* 31D48 80031148 AFB30020 */  sw         $s3, 0x20($sp)
/* 31D4C 8003114C AFB2001C */  sw         $s2, 0x1C($sp)
/* 31D50 80031150 350886A0 */  ori        $t0, $t0, (0x186A0 & 0xFFFF)
/* 31D54 80031154 35297960 */  ori        $t1, $t1, (0xFFFE7960 & 0xFFFF)
/* 31D58 80031158 AFBF0030 */  sw         $ra, 0x30($sp)
/* 31D5C 8003115C AFB10018 */  sw         $s1, 0x18($sp)
/* 31D60 80031160 AFB00014 */  sw         $s0, 0x14($sp)
/* 31D64 80031164 0100A825 */  or         $s5, $t0, $zero
/* 31D68 80031168 0120A025 */  or         $s4, $t1, $zero
/* 31D6C 8003116C 01009825 */  or         $s3, $t0, $zero
/* 31D70 80031170 01209025 */  or         $s2, $t1, $zero
/* 31D74 80031174 10800035 */  beqz       $a0, .L8003124C
/* 31D78 80031178 00E0B025 */   or        $s6, $a3, $zero
/* 31D7C 8003117C 000440C0 */  sll        $t0, $a0, 3
/* 31D80 80031180 00044880 */  sll        $t1, $a0, 2
/* 31D84 80031184 01092020 */  add        $a0, $t0, $t1 /* handwritten instruction */
/* 31D88 80031188 00852020 */  add        $a0, $a0, $a1 /* handwritten instruction */
.L8003118C:
/* 31D8C 8003118C C4A00000 */  lwc1       $f0, 0x0($a1)
/* 31D90 80031190 C4A20008 */  lwc1       $f2, 0x8($a1)
/* 31D94 80031194 C4C40000 */  lwc1       $f4, 0x0($a2)
/* 31D98 80031198 4600000D */  trunc.w.s  $f0, $f0
/* 31D9C 8003119C C4C60008 */  lwc1       $f6, 0x8($a2)
/* 31DA0 800311A0 4600108D */  trunc.w.s  $f2, $f2
/* 31DA4 800311A4 44080000 */  mfc1       $t0, $f0
/* 31DA8 800311A8 4600210D */  trunc.w.s  $f4, $f4
/* 31DAC 800311AC 44091000 */  mfc1       $t1, $f2
/* 31DB0 800311B0 0288082A */  slt        $at, $s4, $t0
/* 31DB4 800311B4 4600318D */  trunc.w.s  $f6, $f6
/* 31DB8 800311B8 440A2000 */  mfc1       $t2, $f4
/* 31DBC 800311BC 440B3000 */  mfc1       $t3, $f6
/* 31DC0 800311C0 50200003 */  beql       $at, $zero, .L800311D0
/* 31DC4 800311C4 0115082A */   slt       $at, $t0, $s5
/* 31DC8 800311C8 0100A025 */  or         $s4, $t0, $zero
/* 31DCC 800311CC 0115082A */  slt        $at, $t0, $s5
.L800311D0:
/* 31DD0 800311D0 50200003 */  beql       $at, $zero, .L800311E0
/* 31DD4 800311D4 0249082A */   slt       $at, $s2, $t1
/* 31DD8 800311D8 0100A825 */  or         $s5, $t0, $zero
/* 31DDC 800311DC 0249082A */  slt        $at, $s2, $t1
.L800311E0:
/* 31DE0 800311E0 50200003 */  beql       $at, $zero, .L800311F0
/* 31DE4 800311E4 0133082A */   slt       $at, $t1, $s3
/* 31DE8 800311E8 01209025 */  or         $s2, $t1, $zero
/* 31DEC 800311EC 0133082A */  slt        $at, $t1, $s3
.L800311F0:
/* 31DF0 800311F0 50200003 */  beql       $at, $zero, .L80031200
/* 31DF4 800311F4 028A082A */   slt       $at, $s4, $t2
/* 31DF8 800311F8 01209825 */  or         $s3, $t1, $zero
/* 31DFC 800311FC 028A082A */  slt        $at, $s4, $t2
.L80031200:
/* 31E00 80031200 50200003 */  beql       $at, $zero, .L80031210
/* 31E04 80031204 0155082A */   slt       $at, $t2, $s5
/* 31E08 80031208 0140A025 */  or         $s4, $t2, $zero
/* 31E0C 8003120C 0155082A */  slt        $at, $t2, $s5
.L80031210:
/* 31E10 80031210 50200003 */  beql       $at, $zero, .L80031220
/* 31E14 80031214 024B082A */   slt       $at, $s2, $t3
/* 31E18 80031218 0140A825 */  or         $s5, $t2, $zero
/* 31E1C 8003121C 024B082A */  slt        $at, $s2, $t3
.L80031220:
/* 31E20 80031220 50200003 */  beql       $at, $zero, .L80031230
/* 31E24 80031224 0173082A */   slt       $at, $t3, $s3
/* 31E28 80031228 01609025 */  or         $s2, $t3, $zero
/* 31E2C 8003122C 0173082A */  slt        $at, $t3, $s3
.L80031230:
/* 31E30 80031230 50200003 */  beql       $at, $zero, .L80031240
/* 31E34 80031234 24A5000C */   addiu     $a1, $a1, 0xC
/* 31E38 80031238 01609825 */  or         $s3, $t3, $zero
/* 31E3C 8003123C 24A5000C */  addiu      $a1, $a1, 0xC
.L80031240:
/* 31E40 80031240 00A4082A */  slt        $at, $a1, $a0
/* 31E44 80031244 1420FFD1 */  bnez       $at, .L8003118C
/* 31E48 80031248 24C6000C */   addiu     $a2, $a2, 0xC
.L8003124C:
/* 31E4C 8003124C 26B5FFEC */  addiu      $s5, $s5, -0x14
/* 31E50 80031250 26940014 */  addiu      $s4, $s4, 0x14
/* 31E54 80031254 0295082A */  slt        $at, $s4, $s5
/* 31E58 80031258 2673FFEC */  addiu      $s3, $s3, -0x14
/* 31E5C 8003125C 10200004 */  beqz       $at, .L80031270
/* 31E60 80031260 26520014 */   addiu     $s2, $s2, 0x14
/* 31E64 80031264 02A04025 */  or         $t0, $s5, $zero
/* 31E68 80031268 0280A825 */  or         $s5, $s4, $zero
/* 31E6C 8003126C 0100A025 */  or         $s4, $t0, $zero
.L80031270:
/* 31E70 80031270 0253082A */  slt        $at, $s2, $s3
/* 31E74 80031274 10200004 */  beqz       $at, .L80031288
/* 31E78 80031278 00000000 */   nop
/* 31E7C 8003127C 02604025 */  or         $t0, $s3, $zero
/* 31E80 80031280 02409825 */  or         $s3, $s2, $zero
/* 31E84 80031284 01009025 */  or         $s2, $t0, $zero
.L80031288:
/* 31E88 80031288 3C08800E */  lui        $t0, %hi(gCurrentLevelModel)
/* 31E8C 8003128C 8D08C918 */  lw         $t0, %lo(gCurrentLevelModel)($t0)
/* 31E90 80031290 23B10034 */  addi       $s1, $sp, 0x34 /* handwritten instruction */
/* 31E94 80031294 23B00048 */  addi       $s0, $sp, 0x48 /* handwritten instruction */
/* 31E98 80031298 850F001A */  lh         $t7, 0x1A($t0)
/* 31E9C 8003129C 0000C025 */  or         $t8, $zero, $zero
/* 31EA0 800312A0 8D040008 */  lw         $a0, 0x8($t0)
/* 31EA4 800312A4 11E00023 */  beqz       $t7, .L80031334
/* 31EA8 800312A8 8D0E0004 */   lw        $t6, 0x4($t0)
.L800312AC:
/* 31EAC 800312AC 84820006 */  lh         $v0, 0x6($a0)
/* 31EB0 800312B0 84830000 */  lh         $v1, 0x0($a0)
/* 31EB4 800312B4 24420005 */  addiu      $v0, $v0, 0x5
/* 31EB8 800312B8 0055082A */  slt        $at, $v0, $s5
/* 31EBC 800312BC 14200019 */  bnez       $at, .L80031324
/* 31EC0 800312C0 2463FFFB */   addiu     $v1, $v1, -0x5
/* 31EC4 800312C4 0283082A */  slt        $at, $s4, $v1
/* 31EC8 800312C8 54200017 */  bnel       $at, $zero, .L80031328
/* 31ECC 800312CC 25EFFFFF */   addiu     $t7, $t7, -0x1
/* 31ED0 800312D0 8488000A */  lh         $t0, 0xA($a0)
/* 31ED4 800312D4 84890004 */  lh         $t1, 0x4($a0)
/* 31ED8 800312D8 25080005 */  addiu      $t0, $t0, 0x5
/* 31EDC 800312DC 0113082A */  slt        $at, $t0, $s3
/* 31EE0 800312E0 14200010 */  bnez       $at, .L80031324
/* 31EE4 800312E4 2529FFFB */   addiu     $t1, $t1, -0x5
/* 31EE8 800312E8 0249082A */  slt        $at, $s2, $t1
/* 31EEC 800312EC 5420000E */  bnel       $at, $zero, .L80031328
/* 31EF0 800312F0 25EFFFFF */   addiu     $t7, $t7, -0x1
/* 31EF4 800312F4 02A02825 */  or         $a1, $s5, $zero
/* 31EF8 800312F8 02603025 */  or         $a2, $s3, $zero
/* 31EFC 800312FC 02803825 */  or         $a3, $s4, $zero
/* 31F00 80031300 0C00C537 */  jal        func_800314DC
/* 31F04 80031304 AFB20010 */   sw        $s2, 0x10($sp)
/* 31F08 80031308 A6220000 */  sh         $v0, 0x0($s1)
/* 31F0C 8003130C 27180001 */  addiu      $t8, $t8, 0x1
/* 31F10 80031310 2401000A */  addiu      $at, $zero, 0xA
/* 31F14 80031314 AE0E0000 */  sw         $t6, 0x0($s0)
/* 31F18 80031318 26310002 */  addiu      $s1, $s1, 0x2
/* 31F1C 8003131C 13010005 */  beq        $t8, $at, .L80031334
/* 31F20 80031320 26100004 */   addiu     $s0, $s0, 0x4
.L80031324:
/* 31F24 80031324 25EFFFFF */  addiu      $t7, $t7, -0x1
.L80031328:
/* 31F28 80031328 2484000C */  addiu      $a0, $a0, 0xC
/* 31F2C 8003132C 15E0FFDF */  bnez       $t7, .L800312AC
/* 31F30 80031330 25CE0044 */   addiu     $t6, $t6, 0x44
.L80031334:
/* 31F34 80031334 1300005C */  beqz       $t8, .L800314A8
/* 31F38 80031338 00009825 */   or        $s3, $zero, $zero
/* 31F3C 8003133C 3C04800E */  lui        $a0, %hi(gCurrentLevelModel)
/* 31F40 80031340 8C84C918 */  lw         $a0, %lo(gCurrentLevelModel)($a0)
/* 31F44 80031344 3C128012 */  lui        $s2, %hi(D_8011D370)
/* 31F48 80031348 3C198012 */  lui        $t9, %hi(D_8011D374)
/* 31F4C 8003134C 23B10034 */  addi       $s1, $sp, 0x34 /* handwritten instruction */
/* 31F50 80031350 0018C040 */  sll        $t8, $t8, 1
/* 31F54 80031354 8E52D370 */  lw         $s2, %lo(D_8011D370)($s2)
/* 31F58 80031358 8F39D374 */  lw         $t9, %lo(D_8011D374)($t9)
/* 31F5C 8003135C 23B00048 */  addi       $s0, $sp, 0x48 /* handwritten instruction */
/* 31F60 80031360 0238C020 */  add        $t8, $s1, $t8 /* handwritten instruction */
/* 31F64 80031364 8C840000 */  lw         $a0, 0x0($a0)
.L80031368:
/* 31F68 80031368 8E0F0000 */  lw         $t7, 0x0($s0)
/* 31F6C 8003136C 3C017FFF */  lui        $at, (0x7FFFFFFF >> 16)
/* 31F70 80031370 3421FFFF */  ori        $at, $at, (0x7FFFFFFF & 0xFFFF)
/* 31F74 80031374 862E0000 */  lh         $t6, 0x0($s1)
/* 31F78 80031378 01E11024 */  and        $v0, $t7, $at
/* 31F7C 8003137C AE420000 */  sw         $v0, 0x0($s2)
/* 31F80 80031380 85E80020 */  lh         $t0, 0x20($t7)
/* 31F84 80031384 8DED000C */  lw         $t5, 0xC($t7)
/* 31F88 80031388 26730001 */  addiu      $s3, $s3, 0x1
/* 31F8C 8003138C 000810C0 */  sll        $v0, $t0, 3
/* 31F90 80031390 00081880 */  sll        $v1, $t0, 2
/* 31F94 80031394 00435820 */  add        $t3, $v0, $v1 /* handwritten instruction */
/* 31F98 80031398 26520004 */  addiu      $s2, $s2, 0x4
/* 31F9C 8003139C 27390001 */  addiu      $t9, $t9, 0x1
/* 31FA0 800313A0 016D5820 */  add        $t3, $t3, $t5 /* handwritten instruction */
/* 31FA4 800313A4 25AC000C */  addiu      $t4, $t5, 0xC
.L800313A8:
/* 31FA8 800313A8 8DA80008 */  lw         $t0, 0x8($t5)
/* 31FAC 800313AC 31020200 */  andi       $v0, $t0, 0x200
/* 31FB0 800313B0 14400035 */  bnez       $v0, .L80031488
/* 31FB4 800313B4 2401FFFF */   addiu     $at, $zero, -0x1
/* 31FB8 800313B8 56C10005 */  bnel       $s6, $at, .L800313D0
/* 31FBC 800313BC 91A30000 */   lbu       $v1, 0x0($t5)
/* 31FC0 800313C0 31020100 */  andi       $v0, $t0, 0x100
/* 31FC4 800313C4 54400031 */  bnel       $v0, $zero, .L8003148C
/* 31FC8 800313C8 25AD000C */   addiu     $t5, $t5, 0xC
/* 31FCC 800313CC 91A30000 */  lbu        $v1, 0x0($t5)
.L800313D0:
/* 31FD0 800313D0 240100FF */  addiu      $at, $zero, 0xFF
/* 31FD4 800313D4 00005025 */  or         $t2, $zero, $zero
/* 31FD8 800313D8 50610010 */  beql       $v1, $at, .L8003141C
/* 31FDC 800313DC 85A80004 */   lh        $t0, 0x4($t5)
/* 31FE0 800313E0 000318C0 */  sll        $v1, $v1, 3
/* 31FE4 800313E4 00641820 */  add        $v1, $v1, $a0 /* handwritten instruction */
/* 31FE8 800313E8 806A0007 */  lb         $t2, 0x7($v1)
/* 31FEC 800313EC 2401000B */  addiu      $at, $zero, 0xB
/* 31FF0 800313F0 11410025 */  beq        $t2, $at, .L80031488
/* 31FF4 800313F4 24010002 */   addiu     $at, $zero, 0x2
/* 31FF8 800313F8 16C10003 */  bne        $s6, $at, .L80031408
/* 31FFC 800313FC 24010011 */   addiu     $at, $zero, 0x11
/* 32000 80031400 51410022 */  beql       $t2, $at, .L8003148C
/* 32004 80031404 25AD000C */   addiu     $t5, $t5, 0xC
.L80031408:
/* 32008 80031408 12C00003 */  beqz       $s6, .L80031418
/* 3200C 8003140C 24010012 */   addiu     $at, $zero, 0x12
/* 32010 80031410 5141001E */  beql       $t2, $at, .L8003148C
/* 32014 80031414 25AD000C */   addiu     $t5, $t5, 0xC
.L80031418:
/* 32018 80031418 85A80004 */  lh         $t0, 0x4($t5)
.L8003141C:
/* 3201C 8003141C 85890004 */  lh         $t1, 0x4($t4)
/* 32020 80031420 8DE60010 */  lw         $a2, 0x10($t7)
/* 32024 80031424 8DE70014 */  lw         $a3, 0x14($t7)
/* 32028 80031428 00094840 */  sll        $t1, $t1, 1
/* 3202C 8003142C 00081040 */  sll        $v0, $t0, 1
/* 32030 80031430 000818C0 */  sll        $v1, $t0, 3
/* 32034 80031434 00C92820 */  add        $a1, $a2, $t1 /* handwritten instruction */
/* 32038 80031438 00C23020 */  add        $a2, $a2, $v0 /* handwritten instruction */
/* 3203C 8003143C 00E33820 */  add        $a3, $a3, $v1 /* handwritten instruction */
.L80031440:
/* 32040 80031440 84C80000 */  lh         $t0, 0x0($a2)
/* 32044 80031444 010E4024 */  and        $t0, $t0, $t6
/* 32048 80031448 310200FF */  andi       $v0, $t0, 0xFF
/* 3204C 8003144C 1040000A */  beqz       $v0, .L80031478
/* 32050 80031450 3103FF00 */   andi      $v1, $t0, 0xFF00
/* 32054 80031454 50600009 */  beql       $v1, $zero, .L8003147C
/* 32058 80031458 24C60002 */   addiu     $a2, $a2, 0x2
/* 3205C 8003145C AE470000 */  sw         $a3, 0x0($s2)
/* 32060 80031460 26730001 */  addiu      $s3, $s3, 0x1
/* 32064 80031464 240101F4 */  addiu      $at, $zero, 0x1F4
/* 32068 80031468 A32A0000 */  sb         $t2, 0x0($t9)
/* 3206C 8003146C 26520004 */  addiu      $s2, $s2, 0x4
/* 32070 80031470 1261000D */  beq        $s3, $at, .L800314A8
/* 32074 80031474 27390001 */   addiu     $t9, $t9, 0x1
.L80031478:
/* 32078 80031478 24C60002 */  addiu      $a2, $a2, 0x2
.L8003147C:
/* 3207C 8003147C 00C5082A */  slt        $at, $a2, $a1
/* 32080 80031480 1420FFEF */  bnez       $at, .L80031440
/* 32084 80031484 24E70008 */   addiu     $a3, $a3, 0x8
.L80031488:
/* 32088 80031488 25AD000C */  addiu      $t5, $t5, 0xC
.L8003148C:
/* 3208C 8003148C 01AB082A */  slt        $at, $t5, $t3
/* 32090 80031490 1420FFC5 */  bnez       $at, .L800313A8
/* 32094 80031494 258C000C */   addiu     $t4, $t4, 0xC
/* 32098 80031498 26310002 */  addiu      $s1, $s1, 0x2
/* 3209C 8003149C 0238082A */  slt        $at, $s1, $t8
/* 320A0 800314A0 1420FFB1 */  bnez       $at, .L80031368
/* 320A4 800314A4 26100004 */   addiu     $s0, $s0, 0x4
.L800314A8:
/* 320A8 800314A8 8FBF0030 */  lw         $ra, 0x30($sp)
/* 320AC 800314AC 3C018012 */  lui        $at, %hi(D_8011D378)
/* 320B0 800314B0 AC33D378 */  sw         $s3, %lo(D_8011D378)($at)
/* 320B4 800314B4 8FB6002C */  lw         $s6, 0x2C($sp)
/* 320B8 800314B8 8FB50028 */  lw         $s5, 0x28($sp)
/* 320BC 800314BC 8FB40024 */  lw         $s4, 0x24($sp)
/* 320C0 800314C0 8FB30020 */  lw         $s3, 0x20($sp)
/* 320C4 800314C4 8FB2001C */  lw         $s2, 0x1C($sp)
/* 320C8 800314C8 8FB10018 */  lw         $s1, 0x18($sp)
/* 320CC 800314CC 8FB00014 */  lw         $s0, 0x14($sp)
/* 320D0 800314D0 00001025 */  or         $v0, $zero, $zero
/* 320D4 800314D4 03E00008 */  jr         $ra
/* 320D8 800314D8 27BD0070 */   addiu     $sp, $sp, 0x70

/* Handwritten function */
glabel func_800314DC
/* 320DC 800314DC 10800046 */  beqz       $a0, .L800315F8
/* 320E0 800314E0 00001025 */   or        $v0, $zero, $zero
/* 320E4 800314E4 84880000 */  lh         $t0, 0x0($a0)
/* 320E8 800314E8 8FAD0010 */  lw         $t5, 0x10($sp)
/* 320EC 800314EC 84890004 */  lh         $t1, 0x4($a0)
/* 320F0 800314F0 00E8082A */  slt        $at, $a3, $t0
/* 320F4 800314F4 848A0006 */  lh         $t2, 0x6($a0)
/* 320F8 800314F8 10200002 */  beqz       $at, .L80031504
/* 320FC 800314FC 848B000A */   lh        $t3, 0xA($a0)
/* 32100 80031500 01003825 */  or         $a3, $t0, $zero
.L80031504:
/* 32104 80031504 00A8082A */  slt        $at, $a1, $t0
/* 32108 80031508 50200003 */  beql       $at, $zero, .L80031518
/* 3210C 8003150C 01A9082A */   slt       $at, $t5, $t1
/* 32110 80031510 01002825 */  or         $a1, $t0, $zero
/* 32114 80031514 01A9082A */  slt        $at, $t5, $t1
.L80031518:
/* 32118 80031518 50200003 */  beql       $at, $zero, .L80031528
/* 3211C 8003151C 00C9082A */   slt       $at, $a2, $t1
/* 32120 80031520 01206825 */  or         $t5, $t1, $zero
/* 32124 80031524 00C9082A */  slt        $at, $a2, $t1
.L80031528:
/* 32128 80031528 50200003 */  beql       $at, $zero, .L80031538
/* 3212C 8003152C 0147082A */   slt       $at, $t2, $a3
/* 32130 80031530 01203025 */  or         $a2, $t1, $zero
/* 32134 80031534 0147082A */  slt        $at, $t2, $a3
.L80031538:
/* 32138 80031538 50200003 */  beql       $at, $zero, .L80031548
/* 3213C 8003153C 0145082A */   slt       $at, $t2, $a1
/* 32140 80031540 01403825 */  or         $a3, $t2, $zero
/* 32144 80031544 0145082A */  slt        $at, $t2, $a1
.L80031548:
/* 32148 80031548 50200003 */  beql       $at, $zero, .L80031558
/* 3214C 8003154C 016D082A */   slt       $at, $t3, $t5
/* 32150 80031550 01402825 */  or         $a1, $t2, $zero
/* 32154 80031554 016D082A */  slt        $at, $t3, $t5
.L80031558:
/* 32158 80031558 50200003 */  beql       $at, $zero, .L80031568
/* 3215C 8003155C 0166082A */   slt       $at, $t3, $a2
/* 32160 80031560 01606825 */  or         $t5, $t3, $zero
/* 32164 80031564 0166082A */  slt        $at, $t3, $a2
.L80031568:
/* 32168 80031568 50200003 */  beql       $at, $zero, .L80031578
/* 3216C 8003156C 01485022 */   sub       $t2, $t2, $t0 /* handwritten instruction */
/* 32170 80031570 01603025 */  or         $a2, $t3, $zero
/* 32174 80031574 01485022 */  sub        $t2, $t2, $t0 /* handwritten instruction */
.L80031578:
/* 32178 80031578 000A50C3 */  sra        $t2, $t2, 3
/* 3217C 8003157C 254A0001 */  addiu      $t2, $t2, 0x1
/* 32180 80031580 24030001 */  addiu      $v1, $zero, 0x1
/* 32184 80031584 01486020 */  add        $t4, $t2, $t0 /* handwritten instruction */
.L80031588:
/* 32188 80031588 0185082A */  slt        $at, $t4, $a1
/* 3218C 8003158C 14200004 */  bnez       $at, .L800315A0
/* 32190 80031590 00E8082A */   slt       $at, $a3, $t0
/* 32194 80031594 54200003 */  bnel       $at, $zero, .L800315A4
/* 32198 80031598 00031840 */   sll       $v1, $v1, 1
/* 3219C 8003159C 00431025 */  or         $v0, $v0, $v1
.L800315A0:
/* 321A0 800315A0 00031840 */  sll        $v1, $v1, 1
.L800315A4:
/* 321A4 800315A4 28610100 */  slti       $at, $v1, 0x100
/* 321A8 800315A8 018A6020 */  add        $t4, $t4, $t2 /* handwritten instruction */
/* 321AC 800315AC 1420FFF6 */  bnez       $at, .L80031588
/* 321B0 800315B0 010A4020 */   add       $t0, $t0, $t2 /* handwritten instruction */
/* 321B4 800315B4 01695022 */  sub        $t2, $t3, $t1 /* handwritten instruction */
/* 321B8 800315B8 000A50C3 */  sra        $t2, $t2, 3
/* 321BC 800315BC 254A0001 */  addiu      $t2, $t2, 0x1
/* 321C0 800315C0 01496020 */  add        $t4, $t2, $t1 /* handwritten instruction */
/* 321C4 800315C4 01204025 */  or         $t0, $t1, $zero
.L800315C8:
/* 321C8 800315C8 0186082A */  slt        $at, $t4, $a2
/* 321CC 800315CC 14200004 */  bnez       $at, .L800315E0
/* 321D0 800315D0 01A8082A */   slt       $at, $t5, $t0
/* 321D4 800315D4 54200003 */  bnel       $at, $zero, .L800315E4
/* 321D8 800315D8 00031840 */   sll       $v1, $v1, 1
/* 321DC 800315DC 00431025 */  or         $v0, $v0, $v1
.L800315E0:
/* 321E0 800315E0 00031840 */  sll        $v1, $v1, 1
.L800315E4:
/* 321E4 800315E4 3C010001 */  lui        $at, (0x10000 >> 16)
/* 321E8 800315E8 0061082A */  slt        $at, $v1, $at
/* 321EC 800315EC 018A6020 */  add        $t4, $t4, $t2 /* handwritten instruction */
/* 321F0 800315F0 1420FFF5 */  bnez       $at, .L800315C8
/* 321F4 800315F4 010A4020 */   add       $t0, $t0, $t2 /* handwritten instruction */
.L800315F8:
/* 321F8 800315F8 03E00008 */  jr         $ra
/* 321FC 800315FC 00000000 */   nop

glabel func_80031600
/* 32200 80031600 24080001 */  addiu      $t0, $zero, 0x1
/* 32204 80031604 A3A80001 */  sb         $t0, 0x1($sp)
/* 32208 80031608 3C088012 */  lui        $t0, %hi(D_8011D378)
/* 3220C 8003160C 8D08D378 */  lw         $t0, %lo(D_8011D378)($t0)
/* 32210 80031610 3C018012 */  lui        $at, %hi(D_8011B0F0)
/* 32214 80031614 A3A00000 */  sb         $zero, 0x0($sp)
/* 32218 80031618 1100014C */  beqz       $t0, .L80031B4C
/* 3221C 8003161C AC20B0F0 */   sw        $zero, %lo(D_8011B0F0)($at)
.L80031620:
/* 32220 80031620 00007025 */  or         $t6, $zero, $zero
.L80031624:
/* 32224 80031624 3C0D8012 */  lui        $t5, %hi(D_8011D374)
/* 32228 80031628 3C098012 */  lui        $t1, %hi(D_8011D370)
/* 3222C 8003162C 3C088012 */  lui        $t0, %hi(D_8011D378)
/* 32230 80031630 00007825 */  or         $t7, $zero, $zero
/* 32234 80031634 8DADD374 */  lw         $t5, %lo(D_8011D374)($t5)
/* 32238 80031638 8D29D370 */  lw         $t1, %lo(D_8011D370)($t1)
/* 3223C 8003163C 8D08D378 */  lw         $t0, %lo(D_8011D378)($t0)
.L80031640:
/* 32240 80031640 8D2A0000 */  lw         $t2, 0x0($t1)
/* 32244 80031644 59400006 */  blezl      $t2, .L80031660
/* 32248 80031648 95420000 */   lhu       $v0, 0x0($t2)
/* 3224C 8003164C 3C0B8000 */  lui        $t3, 0x8000
/* 32250 80031650 016A5825 */  or         $t3, $t3, $t2
/* 32254 80031654 0800C651 */  j          .L80031944
/* 32258 80031658 8D6B0018 */   lw        $t3, 0x18($t3)
/* 3225C 8003165C 95420000 */  lhu        $v0, 0x0($t2)
.L80031660:
/* 32260 80031660 C4A80000 */  lwc1       $f8, 0x0($a1)
/* 32264 80031664 C4AA0004 */  lwc1       $f10, 0x4($a1)
/* 32268 80031668 00021100 */  sll        $v0, $v0, 4
/* 3226C 8003166C 004B1021 */  addu       $v0, $v0, $t3
/* 32270 80031670 C4400000 */  lwc1       $f0, 0($v0)
/* 32274 80031674 C4420004 */  lwc1       $f2, 4($v0)
/* 32278 80031678 C4440008 */  lwc1       $f4, 8($v0)
/* 3227C 8003167C 46004202 */  mul.s      $f8, $f8, $f0
/* 32280 80031680 C4B00008 */  lwc1       $f16, 0x8($a1)
/* 32284 80031684 C446000C */  lwc1       $f6, 0xC($v0)
/* 32288 80031688 46025282 */  mul.s      $f10, $f10, $f2
/* 3228C 8003168C 3C01800E */  lui        $at, %hi(D_800E5F60)
/* 32290 80031690 46048402 */  mul.s      $f16, $f16, $f4
/* 32294 80031694 460A4200 */  add.s      $f8, $f8, $f10
/* 32298 80031698 46104200 */  add.s      $f8, $f8, $f16
/* 3229C 8003169C 46064480 */  add.s      $f18, $f8, $f6
/* 322A0 800316A0 C4C80000 */  lwc1       $f8, 0x0($a2)
/* 322A4 800316A4 46089481 */  sub.s      $f18, $f18, $f8
/* 322A8 800316A8 C4285F60 */  lwc1       $f8, %lo(D_800E5F60)($at)
/* 322AC 800316AC 46089034 */  c.olt.s    $f18, $f8
/* 322B0 800316B0 450200A5 */  bc1fl      .L80031948
/* 322B4 800316B4 2508FFFF */   addiu     $t0, $t0, -0x1
/* 322B8 800316B8 C4880000 */  lwc1       $f8, 0x0($a0)
/* 322BC 800316BC C48A0004 */  lwc1       $f10, 0x4($a0)
/* 322C0 800316C0 C4900008 */  lwc1       $f16, 0x8($a0)
/* 322C4 800316C4 46004202 */  mul.s      $f8, $f8, $f0
/* 322C8 800316C8 3C01800E */  lui        $at, %hi(D_800E5F64)
/* 322CC 800316CC 46025282 */  mul.s      $f10, $f10, $f2
/* 322D0 800316D0 460A4200 */  add.s      $f8, $f8, $f10
/* 322D4 800316D4 46048402 */  mul.s      $f16, $f16, $f4
/* 322D8 800316D8 46104200 */  add.s      $f8, $f8, $f16
/* 322DC 800316DC 46064400 */  add.s      $f16, $f8, $f6
/* 322E0 800316E0 C4C80000 */  lwc1       $f8, 0x0($a2)
/* 322E4 800316E4 46088401 */  sub.s      $f16, $f16, $f8
/* 322E8 800316E8 C4285F64 */  lwc1       $f8, %lo(D_800E5F64)($at)
/* 322EC 800316EC 46088034 */  c.olt.s    $f16, $f8
/* 322F0 800316F0 45030095 */  bc1tl      .L80031948
/* 322F4 800316F4 2508FFFF */   addiu     $t0, $t0, -0x1
/* 322F8 800316F8 C4880000 */  lwc1       $f8, 0x0($a0)
/* 322FC 800316FC C4AA0000 */  lwc1       $f10, 0x0($a1)
/* 32300 80031700 46085001 */  sub.s      $f0, $f10, $f8
/* 32304 80031704 C4880004 */  lwc1       $f8, 0x4($a0)
/* 32308 80031708 C4AA0004 */  lwc1       $f10, 0x4($a1)
/* 3230C 8003170C 46085081 */  sub.s      $f2, $f10, $f8
/* 32310 80031710 C4880008 */  lwc1       $f8, 0x8($a0)
/* 32314 80031714 C4AA0008 */  lwc1       $f10, 0x8($a1)
/* 32318 80031718 46085101 */  sub.s      $f4, $f10, $f8
/* 3231C 8003171C 44805000 */  mtc1       $zero, $f10
/* 32320 80031720 46128201 */  sub.s      $f8, $f16, $f18
/* 32324 80031724 460A4033 */  c.ueq.s    $f8, $f10
/* 32328 80031728 45010002 */  bc1t       .L80031734
/* 3232C 8003172C 00000000 */   nop
/* 32330 80031730 46088283 */  div.s      $f10, $f16, $f8
.L80031734:
/* 32334 80031734 460A0002 */  mul.s      $f0, $f0, $f10
/* 32338 80031738 C4860000 */  lwc1       $f6, 0x0($a0)
/* 3233C 8003173C 3C014080 */  lui        $at, (0x40800000 >> 16)
/* 32340 80031740 460A1082 */  mul.s      $f2, $f2, $f10
/* 32344 80031744 240C0003 */  addiu      $t4, $zero, 0x3
/* 32348 80031748 460A2102 */  mul.s      $f4, $f4, $f10
/* 3234C 8003174C 44815000 */  mtc1       $at, $f10
/* 32350 80031750 46003000 */  add.s      $f0, $f6, $f0
/* 32354 80031754 C4860004 */  lwc1       $f6, 0x4($a0)
/* 32358 80031758 46023080 */  add.s      $f2, $f6, $f2
/* 3235C 8003175C C4860008 */  lwc1       $f6, 0x8($a0)
/* 32360 80031760 46043100 */  add.s      $f4, $f6, $f4
.L80031764:
/* 32364 80031764 95430002 */  lhu        $v1, 0x2($t2)
/* 32368 80031768 0000C025 */  or         $t8, $zero, $zero
/* 3236C 8003176C 30798000 */  andi       $t9, $v1, 0x8000
/* 32370 80031770 53200004 */  beql       $t9, $zero, .L80031784
/* 32374 80031774 00031900 */   sll       $v1, $v1, 4
/* 32378 80031778 30637FFF */  andi       $v1, $v1, 0x7FFF
/* 3237C 8003177C 24180001 */  addiu      $t8, $zero, 0x1
/* 32380 80031780 00031900 */  sll        $v1, $v1, 4
.L80031784:
/* 32384 80031784 006B1821 */  addu       $v1, $v1, $t3
/* 32388 80031788 C4660000 */  lwc1       $f6, 0($v1)
/* 3238C 8003178C C4680004 */  lwc1       $f8, 4($v1)
/* 32390 80031790 46060182 */  mul.s      $f6, $f0, $f6
/* 32394 80031794 00000000 */  nop
/* 32398 80031798 46081202 */  mul.s      $f8, $f2, $f8
/* 3239C 8003179C 46083180 */  add.s      $f6, $f6, $f8
/* 323A0 800317A0 C4680008 */  lwc1       $f8, 0x8($v1)
/* 323A4 800317A4 46082202 */  mul.s      $f8, $f4, $f8
/* 323A8 800317A8 46083180 */  add.s      $f6, $f6, $f8
/* 323AC 800317AC C468000C */  lwc1       $f8, 0xC($v1)
/* 323B0 800317B0 13000002 */  beqz       $t8, .L800317BC
/* 323B4 800317B4 46083180 */   add.s     $f6, $f6, $f8
/* 323B8 800317B8 46003187 */  neg.s      $f6, $f6
.L800317BC:
/* 323BC 800317BC 460A3036 */  c.ole.s    $f6, $f10
/* 323C0 800317C0 45020061 */  bc1fl      .L80031948
/* 323C4 800317C4 2508FFFF */   addiu     $t0, $t0, -0x1
/* 323C8 800317C8 258CFFFF */  addiu      $t4, $t4, -0x1
/* 323CC 800317CC 1580FFE5 */  bnez       $t4, .L80031764
/* 323D0 800317D0 254A0002 */   addiu     $t2, $t2, 0x2
/* 323D4 800317D4 3C01800E */  lui        $at, %hi(D_800E5F68)
/* 323D8 800317D8 C4205F68 */  lwc1       $f0, %lo(D_800E5F68)($at)
/* 323DC 800317DC C4420004 */  lwc1       $f2, 0x4($v0)
/* 323E0 800317E0 C4440008 */  lwc1       $f4, 0x8($v0)
/* 323E4 800317E4 46001035 */  c.ult.s    $f2, $f0
/* 323E8 800317E8 C4400000 */  lwc1       $f0, 0x0($v0)
/* 323EC 800317EC 45010016 */  bc1t       .L80031848
/* 323F0 800317F0 00000000 */   nop
/* 323F4 800317F4 81A30000 */  lb         $v1, 0x0($t5)
/* 323F8 800317F8 24010004 */  addiu      $at, $zero, 0x4
/* 323FC 800317FC 10610012 */  beq        $v1, $at, .L80031848
/* 32400 80031800 00000000 */   nop
/* 32404 80031804 3C038012 */  lui        $v1, %hi(D_8011B0F4)
/* 32408 80031808 8C63B0F4 */  lw         $v1, %lo(D_8011B0F4)($v1)
/* 3240C 8003180C 1460000E */  bnez       $v1, .L80031848
/* 32410 80031810 00000000 */   nop
/* 32414 80031814 C4A60000 */  lwc1       $f6, 0x0($a1)
/* 32418 80031818 46003002 */  mul.s      $f0, $f6, $f0
/* 3241C 8003181C C4A60008 */  lwc1       $f6, 0x8($a1)
/* 32420 80031820 46043102 */  mul.s      $f4, $f6, $f4
/* 32424 80031824 C446000C */  lwc1       $f6, 0xC($v0)
/* 32428 80031828 46040000 */  add.s      $f0, $f0, $f4
/* 3242C 8003182C C4A40008 */  lwc1       $f4, 0x8($a1)
/* 32430 80031830 46060000 */  add.s      $f0, $f0, $f6
/* 32434 80031834 C4C60000 */  lwc1       $f6, 0x0($a2)
/* 32438 80031838 46003001 */  sub.s      $f0, $f6, $f0
/* 3243C 8003183C 46020083 */  div.s      $f2, $f0, $f2
/* 32440 80031840 0800C632 */  j          .L800318C8
/* 32444 80031844 C4A00000 */   lwc1      $f0, 0x0($a1)
.L80031848:
/* 32448 80031848 3C01800E */  lui        $at, %hi(D_800E5F6C)
/* 3244C 8003184C C42A5F6C */  lwc1       $f10, %lo(D_800E5F6C)($at)
/* 32450 80031850 460A1034 */  c.olt.s    $f2, $f10
/* 32454 80031854 45000012 */  bc1f       .L800318A0
/* 32458 80031858 00000000 */   nop
/* 3245C 8003185C 3C038012 */  lui        $v1, %hi(D_8011B0F4)
/* 32460 80031860 8C63B0F4 */  lw         $v1, %lo(D_8011B0F4)($v1)
/* 32464 80031864 24010002 */  addiu      $at, $zero, 0x2
/* 32468 80031868 1061000D */  beq        $v1, $at, .L800318A0
/* 3246C 8003186C 00000000 */   nop
/* 32470 80031870 24030001 */  addiu      $v1, $zero, 0x1
/* 32474 80031874 3C018012 */  lui        $at, %hi(D_8011B0F0)
/* 32478 80031878 AC23B0F0 */  sw         $v1, %lo(D_8011B0F0)($at)
/* 3247C 8003187C C4460000 */  lwc1       $f6, 0x0($v0)
/* 32480 80031880 3C018012 */  lui        $at, %hi(D_8011B0E4)
/* 32484 80031884 E426B0E4 */  swc1       $f6, %lo(D_8011B0E4)($at)
/* 32488 80031888 C4460004 */  lwc1       $f6, 0x4($v0)
/* 3248C 8003188C 3C018012 */  lui        $at, %hi(D_8011B0E8)
/* 32490 80031890 E426B0E8 */  swc1       $f6, %lo(D_8011B0E8)($at)
/* 32494 80031894 C4460008 */  lwc1       $f6, 0x8($v0)
/* 32498 80031898 3C018012 */  lui        $at, %hi(D_8011B0EC)
/* 3249C 8003189C E426B0EC */  swc1       $f6, %lo(D_8011B0EC)($at)
.L800318A0:
/* 324A0 800318A0 46120002 */  mul.s      $f0, $f0, $f18
/* 324A4 800318A4 C4A60000 */  lwc1       $f6, 0x0($a1)
/* 324A8 800318A8 46121082 */  mul.s      $f2, $f2, $f18
/* 324AC 800318AC 00000000 */  nop
/* 324B0 800318B0 46122102 */  mul.s      $f4, $f4, $f18
/* 324B4 800318B4 46003001 */  sub.s      $f0, $f6, $f0
/* 324B8 800318B8 C4A60004 */  lwc1       $f6, 0x4($a1)
/* 324BC 800318BC 46023081 */  sub.s      $f2, $f6, $f2
/* 324C0 800318C0 C4A60008 */  lwc1       $f6, 0x8($a1)
/* 324C4 800318C4 46043101 */  sub.s      $f4, $f6, $f4
.L800318C8:
/* 324C8 800318C8 3C038012 */  lui        $v1, %hi(D_8011B0F0)
/* 324CC 800318CC 8C63B0F0 */  lw         $v1, %lo(D_8011B0F0)($v1)
/* 324D0 800318D0 5460000B */  bnel       $v1, $zero, .L80031900
/* 324D4 800318D4 81AC0000 */   lb        $t4, 0x0($t5)
/* 324D8 800318D8 C4460000 */  lwc1       $f6, 0x0($v0)
/* 324DC 800318DC 3C018012 */  lui        $at, %hi(D_8011B0E4)
/* 324E0 800318E0 E426B0E4 */  swc1       $f6, %lo(D_8011B0E4)($at)
/* 324E4 800318E4 C4460004 */  lwc1       $f6, 0x4($v0)
/* 324E8 800318E8 3C018012 */  lui        $at, %hi(D_8011B0E8)
/* 324EC 800318EC E426B0E8 */  swc1       $f6, %lo(D_8011B0E8)($at)
/* 324F0 800318F0 C4460008 */  lwc1       $f6, 0x8($v0)
/* 324F4 800318F4 3C018012 */  lui        $at, %hi(D_8011B0EC)
/* 324F8 800318F8 E426B0EC */  swc1       $f6, %lo(D_8011B0EC)($at)
/* 324FC 800318FC 81AC0000 */  lb         $t4, 0x0($t5)
.L80031900:
/* 32500 80031900 80E20000 */  lb         $v0, 0x0($a3)
/* 32504 80031904 004C082A */  slt        $at, $v0, $t4
/* 32508 80031908 50200003 */  beql       $at, $zero, .L80031918
/* 3250C 8003190C 25CE0001 */   addiu     $t6, $t6, 0x1
/* 32510 80031910 A0EC0000 */  sb         $t4, 0x0($a3)
/* 32514 80031914 25CE0001 */  addiu      $t6, $t6, 0x1
.L80031918:
/* 32518 80031918 29C1000B */  slti       $at, $t6, 0xB
/* 3251C 8003191C 14200005 */  bnez       $at, .L80031934
/* 32520 80031920 240F0001 */   addiu     $t7, $zero, 0x1
/* 32524 80031924 00007825 */  or         $t7, $zero, $zero
/* 32528 80031928 C4800000 */  lwc1       $f0, 0x0($a0)
/* 3252C 8003192C C4820004 */  lwc1       $f2, 0x4($a0)
/* 32530 80031930 C4840008 */  lwc1       $f4, 0x8($a0)
.L80031934:
/* 32534 80031934 E4A00000 */  swc1       $f0, 0x0($a1)
/* 32538 80031938 E4A20004 */  swc1       $f2, 0x4($a1)
/* 3253C 8003193C 0800C655 */  j          func_80031954
/* 32540 80031940 E4A40008 */   swc1      $f4, 0x8($a1)
.L80031944:
/* 32544 80031944 2508FFFF */  addiu      $t0, $t0, -0x1
.L80031948:
/* 32548 80031948 25AD0001 */  addiu      $t5, $t5, 0x1
/* 3254C 8003194C 1500FF3C */  bnez       $t0, .L80031640
/* 32550 80031950 25290004 */   addiu     $t1, $t1, 0x4

glabel func_80031954
/* 32554 80031954 15E0FF33 */  bnez       $t7, .L80031624
/* 32558 80031958 00000000 */   nop
/* 3255C 8003195C 11C00008 */  beqz       $t6, .L80031980
/* 32560 80031960 93AA0001 */   lbu       $t2, 0x1($sp)
/* 32564 80031964 8FA90014 */  lw         $t1, 0x14($sp)
/* 32568 80031968 8D280000 */  lw         $t0, 0x0($t1)
/* 3256C 8003196C 25080001 */  addiu      $t0, $t0, 0x1
/* 32570 80031970 AD280000 */  sw         $t0, 0x0($t1)
/* 32574 80031974 93A80000 */  lbu        $t0, 0x0($sp)
/* 32578 80031978 010A4025 */  or         $t0, $t0, $t2
/* 3257C 8003197C A3A80000 */  sb         $t0, 0x0($sp)
.L80031980:
/* 32580 80031980 000A5040 */  sll        $t2, $t2, 1
/* 32584 80031984 A3AA0001 */  sb         $t2, 0x1($sp)
/* 32588 80031988 00007025 */  or         $t6, $zero, $zero
.L8003198C:
/* 3258C 8003198C 3C098012 */  lui        $t1, %hi(D_8011D370)
/* 32590 80031990 3C088012 */  lui        $t0, %hi(D_8011D378)
/* 32594 80031994 00007825 */  or         $t7, $zero, $zero
/* 32598 80031998 8D29D370 */  lw         $t1, %lo(D_8011D370)($t1)
/* 3259C 8003199C 8D08D378 */  lw         $t0, %lo(D_8011D378)($t0)
.L800319A0:
/* 325A0 800319A0 8D2A0000 */  lw         $t2, 0x0($t1)
/* 325A4 800319A4 59400006 */  blezl      $t2, .L800319C0
/* 325A8 800319A8 95420000 */   lhu       $v0, 0x0($t2)
/* 325AC 800319AC 3C0B8000 */  lui        $t3, 0x8000
/* 325B0 800319B0 016A5825 */  or         $t3, $t3, $t2
/* 325B4 800319B4 0800C6C6 */  j          .L80031B18
/* 325B8 800319B8 8D6B0018 */   lw        $t3, 0x18($t3)
/* 325BC 800319BC 95420000 */  lhu        $v0, 0x0($t2)
.L800319C0:
/* 325C0 800319C0 C4A80000 */  lwc1       $f8, 0x0($a1)
/* 325C4 800319C4 C4AA0004 */  lwc1       $f10, 0x4($a1)
/* 325C8 800319C8 00021100 */  sll        $v0, $v0, 4
/* 325CC 800319CC 004B1021 */  addu       $v0, $v0, $t3
/* 325D0 800319D0 C4400000 */  lwc1       $f0, 0x0($v0)
/* 325D4 800319D4 C4420004 */  lwc1       $f2, 0x4($v0)
/* 325D8 800319D8 C4440008 */  lwc1       $f4, 0x8($v0)
/* 325DC 800319DC 46004202 */  mul.s      $f8, $f8, $f0
/* 325E0 800319E0 C4B00008 */  lwc1       $f16, 0x8($a1)
/* 325E4 800319E4 C446000C */  lwc1       $f6, 0xC($v0)
/* 325E8 800319E8 46025282 */  mul.s      $f10, $f10, $f2
/* 325EC 800319EC 3C01800E */  lui        $at, %hi(D_800E5F70)
/* 325F0 800319F0 46048402 */  mul.s      $f16, $f16, $f4
/* 325F4 800319F4 460A4200 */  add.s      $f8, $f8, $f10
/* 325F8 800319F8 46104200 */  add.s      $f8, $f8, $f16
/* 325FC 800319FC 46064480 */  add.s      $f18, $f8, $f6
/* 32600 80031A00 C4C80000 */  lwc1       $f8, 0x0($a2)
/* 32604 80031A04 46089481 */  sub.s      $f18, $f18, $f8
/* 32608 80031A08 C4285F70 */  lwc1       $f8, %lo(D_800E5F70)($at)
/* 3260C 80031A0C 46089034 */  c.olt.s    $f18, $f8
/* 32610 80031A10 45000041 */  bc1f       .L80031B18
/* 32614 80031A14 3C014040 */   lui       $at, (0x40400000 >> 16)
/* 32618 80031A18 44815000 */  mtc1       $at, $f10
/* 3261C 80031A1C C4C80000 */  lwc1       $f8, 0x0($a2)
/* 32620 80031A20 460A4200 */  add.s      $f8, $f8, $f10
/* 32624 80031A24 46004207 */  neg.s      $f8, $f8
/* 32628 80031A28 46089036 */  c.ole.s    $f18, $f8
/* 3262C 80031A2C 4501003A */  bc1t       .L80031B18
/* 32630 80031A30 3C014080 */   lui       $at, (0x40800000 >> 16)
/* 32634 80031A34 44815000 */  mtc1       $at, $f10
/* 32638 80031A38 C4A00000 */  lwc1       $f0, 0x0($a1)
/* 3263C 80031A3C C4A20004 */  lwc1       $f2, 0x4($a1)
/* 32640 80031A40 C4A40008 */  lwc1       $f4, 0x8($a1)
/* 32644 80031A44 240C0003 */  addiu      $t4, $zero, 0x3
.L80031A48:
/* 32648 80031A48 95430002 */  lhu        $v1, 0x2($t2)
/* 3264C 80031A4C 0000C025 */  or         $t8, $zero, $zero
/* 32650 80031A50 30798000 */  andi       $t9, $v1, 0x8000
/* 32654 80031A54 53200004 */  beql       $t9, $zero, .L80031A68
/* 32658 80031A58 00031900 */   sll       $v1, $v1, 4
/* 3265C 80031A5C 30637FFF */  andi       $v1, $v1, 0x7FFF
/* 32660 80031A60 24180001 */  addiu      $t8, $zero, 0x1
/* 32664 80031A64 00031900 */  sll        $v1, $v1, 4
.L80031A68:
/* 32668 80031A68 006B1821 */  addu       $v1, $v1, $t3
/* 3266C 80031A6C C4660000 */  lwc1       $f6, 0x0($v1)
/* 32670 80031A70 C4680004 */  lwc1       $f8, 0x4($v1)
/* 32674 80031A74 46060182 */  mul.s      $f6, $f0, $f6
/* 32678 80031A78 00000000 */  nop
/* 3267C 80031A7C 46081202 */  mul.s      $f8, $f2, $f8
/* 32680 80031A80 46083180 */  add.s      $f6, $f6, $f8
/* 32684 80031A84 C4680008 */  lwc1       $f8, 0x8($v1)
/* 32688 80031A88 46082202 */  mul.s      $f8, $f4, $f8
/* 3268C 80031A8C 46083180 */  add.s      $f6, $f6, $f8
/* 32690 80031A90 C468000C */  lwc1       $f8, 0xC($v1)
/* 32694 80031A94 13000002 */  beqz       $t8, .L80031AA0
/* 32698 80031A98 46083180 */   add.s     $f6, $f6, $f8
/* 3269C 80031A9C 46003187 */  neg.s      $f6, $f6
.L80031AA0:
/* 326A0 80031AA0 460A3036 */  c.ole.s    $f6, $f10
/* 326A4 80031AA4 4502001D */  bc1fl      .L80031B1C
/* 326A8 80031AA8 2508FFFF */   addiu     $t0, $t0, -0x1
/* 326AC 80031AAC 258CFFFF */  addiu      $t4, $t4, -0x1
/* 326B0 80031AB0 1580FFE5 */  bnez       $t4, .L80031A48
/* 326B4 80031AB4 254A0002 */   addiu     $t2, $t2, 0x2
/* 326B8 80031AB8 C4400000 */  lwc1       $f0, 0x0($v0)
/* 326BC 80031ABC C4420004 */  lwc1       $f2, 0x4($v0)
/* 326C0 80031AC0 C4A60000 */  lwc1       $f6, 0x0($a1)
/* 326C4 80031AC4 46120002 */  mul.s      $f0, $f0, $f18
/* 326C8 80031AC8 C4440008 */  lwc1       $f4, 0x8($v0)
/* 326CC 80031ACC 25CE0001 */  addiu      $t6, $t6, 0x1
/* 326D0 80031AD0 46121082 */  mul.s      $f2, $f2, $f18
/* 326D4 80031AD4 29C1000B */  slti       $at, $t6, 0xB
/* 326D8 80031AD8 240F0001 */  addiu      $t7, $zero, 0x1
/* 326DC 80031ADC 46122102 */  mul.s      $f4, $f4, $f18
/* 326E0 80031AE0 46003001 */  sub.s      $f0, $f6, $f0
/* 326E4 80031AE4 C4A60004 */  lwc1       $f6, 0x4($a1)
/* 326E8 80031AE8 46023081 */  sub.s      $f2, $f6, $f2
/* 326EC 80031AEC C4A60008 */  lwc1       $f6, 0x8($a1)
/* 326F0 80031AF0 14200005 */  bnez       $at, .L80031B08
/* 326F4 80031AF4 46043101 */   sub.s     $f4, $f6, $f4
/* 326F8 80031AF8 00007825 */  or         $t7, $zero, $zero
/* 326FC 80031AFC C4800000 */  lwc1       $f0, 0x0($a0)
/* 32700 80031B00 C4820004 */  lwc1       $f2, 0x4($a0)
/* 32704 80031B04 C4840008 */  lwc1       $f4, 0x8($a0)
.L80031B08:
/* 32708 80031B08 E4A00000 */  swc1       $f0, 0x0($a1)
/* 3270C 80031B0C E4A20004 */  swc1       $f2, 0x4($a1)
/* 32710 80031B10 0800C6C9 */  j          func_80031B24
/* 32714 80031B14 E4A40008 */   swc1      $f4, 0x8($a1)
.L80031B18:
/* 32718 80031B18 2508FFFF */  addiu      $t0, $t0, -0x1
.L80031B1C:
/* 3271C 80031B1C 1500FFA0 */  bnez       $t0, .L800319A0
/* 32720 80031B20 25290004 */   addiu     $t1, $t1, 0x4

glabel func_80031B24
/* 32724 80031B24 15E0FF99 */  bnez       $t7, .L8003198C
/* 32728 80031B28 00000000 */   nop
/* 3272C 80031B2C 8FA80010 */  lw         $t0, 0x10($sp)
/* 32730 80031B30 2484000C */  addiu      $a0, $a0, 0xC
/* 32734 80031B34 24A5000C */  addiu      $a1, $a1, 0xC
/* 32738 80031B38 2508FFFF */  addiu      $t0, $t0, -0x1
/* 3273C 80031B3C 24C60004 */  addiu      $a2, $a2, 0x4
/* 32740 80031B40 24E70001 */  addiu      $a3, $a3, 0x1
/* 32744 80031B44 1500FEB6 */  bnez       $t0, .L80031620
/* 32748 80031B48 AFA80010 */   sw        $t0, 0x10($sp)
.L80031B4C:
/* 3274C 80031B4C 03E00008 */  jr         $ra
/* 32750 80031B50 83A20000 */   lb        $v0, 0x0($sp)
/* 32754 80031B54 00000000 */  nop
/* 32758 80031B58 00000000 */  nop
/* 3275C 80031B5C 00000000 */  nop
