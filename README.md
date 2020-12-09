![Screenshot](top_module.png)
# 8-bit-risc-processor
 this repo include 8-bit risc processor which has 23 integer instructions.

# Table of ISA
  Mnemonic| Opcode, Operand | Description 
  :---:|:---:|:---:|
  LDA_IMM |x"86", data|Load Register A uing immediate addresing
  LDA_DIR |x"87", addr|Load Register A uing direct addresing
  LDB_IMM |x"88", data|Load Register B uing immediate addresing
  LDB_DIR |x"89", addr|Load Register B uing direct addresing
  STA_DIR |x"96", addr|Store Register A uing direct addresing
  STB_DIR |x"97", addr|Store Register B uing direct addresing      
  ADD_AB  |x"42"        |A= A + B|
  SUB_AB  |x"43"        |A= A - B|
  AND_AB  |x"44"        |A= A and B|
  OR_AB   |x"45"        |A= A or  B|
  INC_A   |x"46"        |A= A + 1|
  DEC_A   |x"47"        |A= A - 1|
  INC_B   |x"48"        |B= B + 1|
  DEC_B   |x"49"        |B= B - 1|  
  BRA     |x"20", addr|Branch always to Address|
  BNI     |x"21", addr|Branch to Address provided if flag N (negative) = 1|
  BPL     |x"22", addr|Branch to Address provided if flag N (negative) = 0|
  BEQ     |x"23", addr|Branch to Address provided if flag Z (zero) = 1 |
  BNE     |x"24", addr|Branch to Address provided if flag Z (zero) = 0 |
  BVS     |x"25", addr|Branch to Address provided if flag V (overflow) = 1 |
  BVC     |x"26", addr|Branch to Address provided if flag V (overflow) = 0 |
  BCS     |x"27", addr|Branch to Address provided if flag Z (zero) = 1 |
  BCC     |x"28", addr|Branch to Address provided if flag Z (zero) = 0|

# Table of Utilization
    Implementation was performed using Vivado 2020.1 for Arty Z7-20 (xc7z020clg400-1) for 10 input port 16 output port 
  LUT | Reg | Power | Freq 
  :---:|:---:|:---:|:---:|
  24  |26|0.105W|50 Mhz