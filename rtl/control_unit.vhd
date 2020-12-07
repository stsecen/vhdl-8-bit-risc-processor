library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity control_unit is
    port (
        clk, rst        :  in std_logic,
        i_inst_register :  in std_logic_vector(7 downto 0);
        i_ccr_res       :  in std_logic_vector(3 downto 0);
        o_ir_load       : out std_logic;        
        o_mar_load      : out std_logic;      
        o_pc_load       : out std_logic;   
        o_pc_inc        : out std_logic;           
        o_a_load        : out std_logic;               
        o_b_load        : out std_logic;   
        o_alucontrol    : out std_logic_vector(2 downto 0);                   
        o_ccrload       : out std_logic;   
        o_bus1cont      : out std_logic;   
        o_bus2cont      : out std_logic;   
        o_we            : out std_logic
    );
end entity control_unit;

architecture rtl of control_unit is
    

begin

end architecture rtl;