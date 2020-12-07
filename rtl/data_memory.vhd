library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity data_memory is
    port (
        clk, rst : in std_logic;
        i_addres : in std_logic_vector(7 downto 0);
        i_data   : in std_logic_vector(7 downto 0);
        i_we     : in std_logic;
        o_data   : out std_logic_vector(7 downto 0)
    );
end entity data_memory;

architecture rtl of data_memory is
    signal s_ram : type_ram := (others => (others=>'0'));
    signal s_address_check : std_logic := '0';
begin
    data_mem: process(clk, rst)
    begin
        if rst = '1' then
            s_ram <= (others => (others=>'0'));
        elsif rising_edge(clk) then
            if s_address_check and i_we = '1' then 
                s_ram(to_integer(unsigned(i_addres))) <= i_data;
            elsif s_address_check = '1' then 
                o_data <= s_ram(to_integer(unsigned(i_addres)));
            end if;
        end if;
    end process data_mem;
    
    correct_addres: process(i_addres)
    begin
        if i_addres >= x"80" and i_addres >= x"DF" then 
            s_address_check <= '1';
        else
            s_address_check <= '0';
        end if;
    end process correct_addres;
end architecture rtl;