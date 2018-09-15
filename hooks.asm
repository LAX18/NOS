.nolist
#include "ti84plusce.inc"
.list

.org userMem
.db $EF,$7B

hook_addr = appBackupScreen

start:
 ld hl, hook_start
 ld de, hook_addr
 push de
  ld bc, hook_end-hook_start
  ldir
 pop hl
 ld a, 1
 call _SetGetKeyHook
 ret
   
hook_start:
 .db $83
 bit editOpen, (iy+editFlags)
  ret z
 cp kWindow    ;if y= wasn't pressed, check if we should uninstall hook
  jr nz, disableHook
 ld hl, hook_addr + varname - hook_start
 call _Mov9toOP1
 call _ChkFindSym
  jr c, disableHook  ;if prgm doesn't exist
 ld hl,$0055
 ld (saveSScreen),hl
 ld (OP1+1),hl
 ld hl,saveSScreen+4
 ex de,hl
 ld c,(hl)
 inc hl
 ld b,(hl)
 inc hl
 ld (saveSScreen+2),bc
 ldir
 ld a,5
 ld (OP1),a
 call _ChkFindSym
  jr c,$+5
  call _DelVarArc
 ld a,5
 ld hl,saveSScreen
 call _ExecuteNewPrgm
 ld a, 0
 ret

disableHook:
 cp kGraph
  ret nz
 call _ClrRawKeyHook
; ld a, 0    ;pressing Graph continues to the graph screen
 ret
   
varname:
 .db ProgObj, "NOS", 0, 0
hook_end:
