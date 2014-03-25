/*REXX*/

Call rxfuncadd sysloadfuncs, rexxutil, sysloadfuncs
Call sysloadfuncs
Call SysCls

/* Sprache */
FEHLER = SysIni('USER', 'Shield', 'Schrif~tartgr”áe...')
IF FEHLER = 'ERROR:' THEN
  SPRACHE = 'E'
ELSE
  SPRACHE = 'D'
  
UMBRUCH = D2C(10)

/* voller Pfad */
EXE_NAME = SysSearchPath( 'PATH', 'SETAMP.EXE' )
PTR0_NAME = SysSearchPath( 'PATH', 'SETAMP0.PTR' )
PTR1_NAME = SysSearchPath( 'PATH', 'SETAMP1.PTR' )

IF EXE_NAME = '' THEN
  DO
    IF SPRACHE = 'D' THEN SAY 'SETAMP.EXE nicht gefunden'
    IF SPRACHE = 'E' THEN SAY 'SETAMP.EXE not found'
    EXIT 1
  END
  
/* Programmkonstanten */  
KLASSENNAME = 'WPProgram'

IF SPRACHE = 'D' THEN TITEL0 = 'Verst„rker'||UMBRUCH||'aus'
IF SPRACHE = 'E' THEN TITEL0 = 'amplifier'||UMBRUCH||'off'
IF SPRACHE = 'D' THEN TITEL1 = 'Verst„rker'||UMBRUCH||'ein'
IF SPRACHE = 'E' THEN TITEL1 = 'amplifier'||UMBRUCH||'on'

POSITION = '<WP_DESKTOP>'

/* 'PROGTYPE=WINDOWABLEVIO;' */
KONFIG0 = 'PROGTYPE=PM;NOAUTOCLOSE=NO;MINIMIZED=YES;EXENAME='||EXE_NAME||';ICONFILE='||PTR0_NAME||';PARAMETERS=0'
KONFIG1 = 'PROGTYPE=PM;NOAUTOCLOSE=NO;MINIMIZED=YES;EXENAME='||EXE_NAME||';ICONFILE='||PTR1_NAME||';PARAMETERS=1'

FEHLER = SysCreateObject('WPProgram',TITEL0,POSITION,KONFIG0,'Replace')
IF FEHLER = 0 THEN
  DO
    IF SPRACHE = 'D' THEN SAY '         Fehler aufgetreten !'
    IF SPRACHE = 'E' THEN SAY '            error occured !'
    EXIT 1
  END

FEHLER = SysCreateObject('WPProgram',TITEL1,POSITION,KONFIG1,'Replace')  
IF FEHLER = 0 THEN
  DO
    IF SPRACHE = 'D' THEN SAY '         Fehler aufgetreten !'
    IF SPRACHE = 'E' THEN SAY '            error occured !'
    EXIT 1
  END
