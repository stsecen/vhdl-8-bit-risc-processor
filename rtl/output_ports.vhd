library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity output_ports is
    port (
        clk, rst    : in std_logic;
        i_address   : in std_logic_vector(7 downto 0);
        i_data      : in std_logic_vector(7 downto 0);
        i_we        : in std_logic;
        o_port00    : out std_logic_vector(7 downto 0);
        o_port01    : out std_logic_vector(7 downto 0);
        o_port02    : out std_logic_vector(7 downto 0);
        o_port03    : out std_logic_vector(7 downto 0);
        o_port04    : out std_logic_vector(7 downto 0);
        o_port05    : out std_logic_vector(7 downto 0);
        o_port06    : out std_logic_vector(7 downto 0);
        o_port07    : out std_logic_vector(7 downto 0);
        o_port08    : out std_logic_vector(7 downto 0);
        o_port09    : out std_logic_vector(7 downto 0);
        o_port0A    : out std_logic_vector(7 downto 0);
        o_port0B    : out std_logic_vector(7 downto 0);
        o_port0C    : out std_logic_vector(7 downto 0);
        o_port0D    : out std_logic_vector(7 downto 0);
        o_port0E    : out std_logic_vector(7 downto 0);
        o_port0F    : out std_logic_vector(7 downto 0)
    );
end entity output_ports;

architecture rtl of output_ports is
begin
    outs: process(clk, rst)
    begin
        if rst = '1' then
            o_port00 <= (others => '0');
            o_port01 <= (others => '0');
            o_port02 <= (others => '0');
            o_port03 <= (others => '0');
            o_port04 <= (others => '0');
            o_port05 <= (others => '0');
            o_port06 <= (others => '0');
            o_port07 <= (others => '0');
            o_port08 <= (others => '0');
            o_port09 <= (others => '0');
            o_port0A <= (others => '0');
            o_port0B <= (others => '0');
            o_port0C <= (others => '0');
            o_port0D <= (others => '0');
            o_port0E <= (others => '0');
            o_port0F <= (others => '0');
        elsif rising_edge(clk) then
            if i_we = '1' then 
                case i_address is
                    when x"E0" =>
                        o_port00 <= i_data; 
                    when x"E1" =>
                        o_port01 <= i_data;
                    when x"E2" =>
                        o_port02 <= i_data;
                    when x"E3" =>
                        o_port03 <= i_data;
                    when x"E4" =>
                        o_port04 <= i_data;
                    when x"E5" =>
                        o_port05 <= i_data;
                    when x"E6" =>
                        o_port06 <= i_data;
                    when x"E7" =>
                        o_port07 <= i_data;
                    when x"E8" =>
                        o_port08 <= i_data;
                    when x"E9" =>
                        o_port09 <= i_data;
                    when x"EA" =>
                        o_port0A <= i_data;
                    when x"EB" =>
                        o_port0B <= i_data;
                    when x"EC" =>
                        o_port0C <= i_data;
                    when x"ED" =>
                        o_port0D <= i_data;
                    when x"EE" =>
                        o_port0E <= i_data;
                    when x"EF" =>
                        o_port0F <= i_data;
                    when others =>
                        o_port00 <= (others => '0');
                        o_port01 <= (others => '0');
                        o_port02 <= (others => '0');
                        o_port03 <= (others => '0');
                        o_port04 <= (others => '0');
                        o_port05 <= (others => '0');
                        o_port06 <= (others => '0');
                        o_port07 <= (others => '0');
                        o_port08 <= (others => '0');
                        o_port09 <= (others => '0');
                        o_port0A <= (others => '0');
                        o_port0B <= (others => '0');
                        o_port0C <= (others => '0');
                        o_port0D <= (others => '0');
                        o_port0E <= (others => '0');
                        o_port0F <= (others => '0');

                end case;
            end if; 
        end if;
    end process outs;
end architecture rtl;