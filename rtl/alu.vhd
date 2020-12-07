library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity alu is
    port (
        i_data0      :  in std_logic_vector(7 downto 0);
        i_data1      :  in std_logic_vector(7 downto 0);
        i_alucontrol :  in std_logic_vector(2 downto 0);
        o_result     : out std_logic_vector(7 downto 0);
        o_flags      : out std_logic_vector(3 downto 0)  
    );
end entity alu;

architecture rtl of alu is
    signal s_data0, s_data1 : signed(8 downto 0) := (others => '0');
    signal s_result : std_logic_vector(8 downto 0) := (others => '0');
    signal s_addv, s_subv : std_logic := '0';
begin
    s_data0 <= '0' & i_data0;
    s_data1 <= '0' & i_data1;
    o_result <= s_result(7 downto 0);
    o_flags(3) <= s_result(7); --> negative signal 
    o_flags(2) <= '1' when s_result(7 downto 0) = x"00" else '0'; --> zero flag
    s_addv <= (not(i_data0(7)) and not i_data1(7) and s_result(7) 
                or (i_data0(7) and i_data1(7) and not(s_result(7))));
    s_subv <= (not(i_data0(7)) and i_data1(7) and s_result(7) 
                or (i_data0(7) and not(i_data1(7)) and not(s_result(7)))); --> overflow flag
    o_flags(1) <= s_addv when (i_alucontrol = ALU_ADD) else
                  s_subv when (i_alucontrol = ALU_SUB) else
                    '0';
    o_flags(0) <= s_result(8) when i_alucontrol = ALU_ADD else  --> carry flag
                  s_result(8) when i_alucontrol = ALU_SUB else
                    '0';

    arith: process(i_alucontrol, s_data0, s_data1)
    begin
        s_result <= (others => '0');
        case i_alucontrol is
            when ALU_ADD =>
                s_result <= std_logic_vector(s_data0 + s_data1);
            when ALU_SUB =>
                s_result <= std_logic_vector(s_data0 - s_data1);
            when ALU_AND =>
                s_result <= std_logic_vector(s_data0 and s_data1);
            when ALU_OR  =>
                s_result <= std_logic_vector(s_data0  or s_data1);
            when ALU_INC =>
                s_result <= std_logic_vector(s_data0 + 1);
            when ALU_DEC =>
                s_result <= std_logic_vector(s_data0 - 1);
            when others =>
                s_result <= (others => '0');
        end case;
    end process arith;
    
    
end architecture rtl;