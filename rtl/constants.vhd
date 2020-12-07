library ieee;
use ieee.std_logic_1164.all;

use work.constants.all;

package constants is

    --> load and stores instructions: 
    
    constant LDA_IMM: std_logic_vector(7 downto 0) := x"86";
    constant LDA_DIR: std_logic_vector(7 downto 0) := x"87";
    constant LDB_IMM: std_logic_vector(7 downto 0) := x"88";
    constant LDB_DIR: std_logic_vector(7 downto 0) := x"89";
    constant STA_DIR: std_logic_vector(7 downto 0) := x"96";
    constant STB_DIR: std_logic_vector(7 downto 0) := x"97";

    --> Arithmetic instructions:

    constant ADD_AB: std_logic_vector(7 downto 0) := x"42";
    constant SUB_AB: std_logic_vector(7 downto 0) := x"43";
    constant AND_AB: std_logic_vector(7 downto 0) := x"44";
    constant OR_AB: std_logic_vector(7 downto 0) := x"45";
    constant INC_A: std_logic_vector(7 downto 0) := x"46";
    constant DEC_A: std_logic_vector(7 downto 0) := x"47";
    constant INC_B: std_logic_vector(7 downto 0) := x"48";
    constant DEC_B: std_logic_vector(7 downto 0) := x"49";

    --> Branch instructions:

    constant BRA: std_logic_vector(7 downto 0) := x"20";
    constant BMI: std_logic_vector(7 downto 0) := x"21";
    constant BPL: std_logic_vector(7 downto 0) := x"22";
    constant BEQ: std_logic_vector(7 downto 0) := x"23";
    constant BNE: std_logic_vector(7 downto 0) := x"24";
    constant BVS: std_logic_vector(7 downto 0) := x"25";
    constant BVC: std_logic_vector(7 downto 0) := x"26";
    constant BCS: std_logic_vector(7 downto 0) := x"27";
    constant BCC: std_logic_vector(7 downto 0) := x"28";

    constant ALU_ADD: std_logic_vector(2 downto 0) := "000";
    constant ALU_SUB: std_logic_vector(2 downto 0) := "001";
    constant ALU_AND: std_logic_vector(2 downto 0) := "010";
    constant ALU_OR: std_logic_vector(2 downto 0)  := "011";
    constant ALU_INC: std_logic_vector(2 downto 0) := "100";
    constant ALU_DEC: std_logic_vector(2 downto 0) := "101";


end package constants;