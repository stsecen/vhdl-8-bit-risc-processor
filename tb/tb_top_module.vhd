library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity tb_top_module is
end entity tb_top_module;

architecture rtl of tb_top_module is
    signal rst,clk : std_logic := '0';
    signal i_port00,o_port00,o_port01 : std_logic_vector(7 downto 0) := (others => '0');
    constant clock_period : time := 50 ns;
begin    
    uut: entity work.top_module(rtl)
    port map(
        clk => clk, 
        rst => rst, 
        i_port00 => i_port00,
        o_port00 => o_port00,
        o_port01 => o_port00
    );
    clock_process: process
        begin
            clk <= '0';
            wait for clock_period/2;
            clk <= '1';
            wait for clock_period/2;
        end process clock_process;
    process
    begin
    rst <= '1';
    wait for clock_period*2;
    rst <= '0';
    wait for clock_period*200;
    wait;
    end process;
    
    
end architecture rtl;