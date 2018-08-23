## Developers Information  
This page has information relating to developers and what they can and cannot use.
  
### Contents:
System Variables  
Modules  
Built-In Calls and Labels  

## System Variables
NOS has a decent amount of system varibles and labels that cannot be overwritten. Below is a list of them and their location (what subprogram they are in) and whether or not they can be overwritten.  
  
### NOSSPRIT    
No Variables  
  
### NOSHEAD  
No Variables  
  
### NOSSRH  
FILES - This has the program names and the data. This is in the format of a 17 byte set as seen below:  - DO NOT OVERWRITE -  
  0-7 - Program Name  
  8 - Zero Byte (help with reading program name)  
  9 - Archive Status  
  10, 11 - Saved for future features  
  12 - Icon Status (:DCS Header)  
  13 - Size  
  16 - ASM or BASIC  
I, F, X, D, P - Temporary Varibles, you can overwrite these after  
TBPRGMS - Total BASIC Programs - DO NOT OVERWRITE -  
TAPRGMS - Total ASM Programs - DO NOT OVERWRITE -  
BASIC - List of BASIC programs, follows above syntax (see FILES)  
ASM - List of ASM programs, follows above syntax (see FILES)  
TPRGMS - Total Program Count - DO NOT OVERWRITE -  
OFFSET - Offset for Copy() - Okay to Overwrite -  
SIZE - Size of first program, this may be overwritten after the program is switched  
ARC - Archive status of the first program, this may be overwritten after the program is switched  
  
### NOSGUI  
No variables  
  
### NOSCTRL
G - getKey variable, overwrite at your own risk  
prgmTEMP - Temporary program for running ASM and BASIC programs  
prgmASM - ASM program data for running  
SLOT - Selected Program Slot, overwrite at your own risk  
  
### NOSSET
SET, G - Temporary value, may be overwritten after run  
L5 - Color / Settings Data, formated as below:  
  L5(0) - Primary Background  
  L5(3) - Banner Background  
  L5(6) - Primary Text  
  L5(9) - Secondary Text  
LOC - Location of cursor on menu  

### NOSPROG  
No Variables  
  
### NOSSUB  
B, ICONX, ICONY, ICONCHAR, ICONCOLOR, SET, STATUS, POS - Temporary Varibles, may be overwritten  
COLORS - Has the conversions for OS to ICE colors, DO NOT OVERWRITE
DISTRO - Current Distro name, can be set  
VERSION - Current NOS build version, can be set  
  
## Modules  
The current (v.0.5.1) module list and uses is below:  
NOSSPRIT - Houses Sprite Data  
NOSHEAD - Houses Starting Values  
NOSSRH - Searches for, and arranges, programs into one list  
NOSGUI - Holds the GUI parts that update on every next program call along with Icon display code, user customisable   
NOSCTRL - Has all of the shell's controls, includes changing programs  
NOSSET - Has all of the shells settings  
NOSPROG - Hold built-in subprograms  
NOSSUB - Has subprograms for shell, including Icon display, GUI setup, and data setup  
  
## Built-In Calls and Labels  
Here are the Calls and Labels that you can use:  
  
### Calls:  
TOOLBAR - This has the toolbar for pinned programs,  
GUISTART - Sets up the base for the GUI, i.e no data, just background  
ICONDISPLAY - Displays DCS header icon (if applicable)  
DATASETUP - Has the setup for the originla values of the varibles  
  
### Labels:  
TOP - Top of the program  
SEARCH - Before the Search module, in prgmNOS  
GUI - Before the GUI module, in prgmNOS  
SETTINGS - Before the Settings module, in prgmNOS  
