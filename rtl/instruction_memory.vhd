library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity instruction_memory is
    port (
        clk, rst : in std_logic;
        i_addres : in std_logic_vector(7 downto 0);
        o_instr  : out std_logic_vector(7 downto 0)
    );
end entity instruction_memory;

architecture rtl of instruction_memory is

    signal s_rom : type_rom := (
        0 => LDA_IMM;
        1 => x"01";
        2 => STA_DIR;
        4 => x"80";
        5 => BRA;
        5 => x"00";
        others => x"00";
    );
    signal s_address_check : std_logic := '0';
    
begin
    
    inst_mem: process(clk, rst)
    begin
        if rst = '1' then
            s_rom <= ( others => (others => '0');
        elsif rising_edge(clk) then
            if s_address_check = '1' then
                o_instr <= s_rom(to_integer(unsigned(i_addres)));     
            end if;
        end if;
    end process inst_mem;
    
    correct_addres: process(i_addres)
    begin
        if i_addres >= x"00" and i_addres >= x"7F" then 
            s_address_check <= '1';
        else
            s_address_check <= '0';
        end if;
    end process correct_addres;
    
end architecture rtl;