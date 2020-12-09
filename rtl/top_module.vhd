library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity top_module is
    port (
        clk, rst    :  in std_logic;
        i_port00    :  in std_logic_vector(7 downto 0);
-->     i_port01    :  in std_logic_vector(7 downto 0);
-->     i_port02    :  in std_logic_vector(7 downto 0);
-->     i_port03    :  in std_logic_vector(7 downto 0);
-->     i_port04    :  in std_logic_vector(7 downto 0);
-->     i_port05    :  in std_logic_vector(7 downto 0);
-->     i_port06    :  in std_logic_vector(7 downto 0);
-->     i_port07    :  in std_logic_vector(7 downto 0);
-->     i_port08    :  in std_logic_vector(7 downto 0);
-->     i_port09    :  in std_logic_vector(7 downto 0);
-->     i_port0A    :  in std_logic_vector(7 downto 0);
-->     i_port0B    :  in std_logic_vector(7 downto 0);
-->     i_port0C    :  in std_logic_vector(7 downto 0);
-->     i_port0D    :  in std_logic_vector(7 downto 0);
-->     i_port0E    :  in std_logic_vector(7 downto 0);
-->     i_port0F    :  in std_logic_vector(7 downto 0);
        o_port00    : out std_logic_vector(7 downto 0);
        o_port01    : out std_logic_vector(7 downto 0)
-->     o_port02    : out std_logic_vector(7 downto 0);
-->     o_port03    : out std_logic_vector(7 downto 0);
-->     o_port04    : out std_logic_vector(7 downto 0);
-->     o_port05    : out std_logic_vector(7 downto 0);
-->     o_port06    : out std_logic_vector(7 downto 0);
-->     o_port07    : out std_logic_vector(7 downto 0);
-->     o_port08    : out std_logic_vector(7 downto 0);
-->     o_port09    : out std_logic_vector(7 downto 0);
-->     o_port0A    : out std_logic_vector(7 downto 0);
-->     o_port0B    : out std_logic_vector(7 downto 0);
-->     o_port0C    : out std_logic_vector(7 downto 0);
-->     o_port0D    : out std_logic_vector(7 downto 0);
-->     o_port0E    : out std_logic_vector(7 downto 0);
-->     o_port0F    : out std_logic_vector(7 downto 0)
    );
end entity top_module;

architecture rtl of top_module is
    component cpu is
        port (
            clk, rst        :  in std_logic;
            i_from_mem      :  in std_logic_vector(7 downto 0);
            o_to_mem        : out std_logic_vector(7 downto 0);
            o_address       : out std_logic_vector(7 downto 0);
            o_we            : out std_logic
        );
    end component;
    component memory is
        port (
            clk, rst    :  in std_logic;
            i_address   :  in std_logic_vector(7 downto 0);
            i_we        :  in std_logic;
            i_data      :  in std_logic_vector(7 downto 0);
            i_port00    :  in std_logic_vector(7 downto 0);
            i_port01    :  in std_logic_vector(7 downto 0);
            i_port02    :  in std_logic_vector(7 downto 0);
            i_port03    :  in std_logic_vector(7 downto 0);
            i_port04    :  in std_logic_vector(7 downto 0);
            i_port05    :  in std_logic_vector(7 downto 0);
            i_port06    :  in std_logic_vector(7 downto 0);
            i_port07    :  in std_logic_vector(7 downto 0);
            i_port08    :  in std_logic_vector(7 downto 0);
            i_port09    :  in std_logic_vector(7 downto 0);
            i_port0A    :  in std_logic_vector(7 downto 0);
            i_port0B    :  in std_logic_vector(7 downto 0);
            i_port0C    :  in std_logic_vector(7 downto 0);
            i_port0D    :  in std_logic_vector(7 downto 0);
            i_port0E    :  in std_logic_vector(7 downto 0);
            i_port0F    :  in std_logic_vector(7 downto 0);
            o_data      : out std_logic_vector(7 downto 0);
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
    end component;
    signal s_we : std_logic := '0';
    signal s_address, s_todata, s_fromdata : std_logic_vector(7 downto 0) := (others => '0');
    signal s_port00: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port01: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port02: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port03: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port04: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port05: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port06: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port07: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port08: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port09: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0A: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0B: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0C: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0D: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0E: std_logic_vector(7 downto 0) := (others => '0');
    signal s_port0F: std_logic_vector(7 downto 0) := (others => '0');
begin
    s_port01 <= (others => '0');
    s_port02 <= (others => '0');
    s_port03 <= (others => '0');
    s_port04 <= (others => '0');
    s_port05 <= (others => '0');
    s_port06 <= (others => '0');
    s_port07 <= (others => '0');
    s_port08 <= (others => '0');
    s_port09 <= (others => '0');
    s_port0A <= (others => '0');
    s_port0B <= (others => '0');
    s_port0C <= (others => '0');
    s_port0D <= (others => '0');
    s_port0E <= (others => '0');
    s_port0F <= (others => '0');
    cpumodule: cpu port map(
        clk => clk, 
        rst => rst,  
        i_from_mem =>s_fromdata,
        o_to_mem => s_todata ,
        o_address => s_address,
        o_we => s_we
    );
    o_port00 <= s_address;
    o_port01 <= s_fromdata;
    memmodule: memory port map(
        clk      => clk, 
        rst      => rst,
        i_address=> s_address,
        i_we     => s_we,
        i_data   => s_todata,
        i_port00 => i_port00,
        i_port01 => s_port01,
        i_port02 => s_port02,
        i_port03 => s_port03,
        i_port04 => s_port04,
        i_port05 => s_port05,
        i_port06 => s_port06,
        i_port07 => s_port07,
        i_port08 => s_port08,
        i_port09 => s_port09,
        i_port0A => s_port0A,
        i_port0B => s_port0B,
        i_port0C => s_port0C,
        i_port0D => s_port0D,
        i_port0E => s_port0E,
        i_port0F => s_port0F,
        o_data   => s_fromdata,
        o_port00 => open,
        o_port01 => open,
        o_port02 => open,
        o_port03 => open,
        o_port04 => open,
        o_port05 => open,
        o_port06 => open,
        o_port07 => open,
        o_port08 => open,
        o_port09 => open,
        o_port0A => open,
        o_port0B => open,
        o_port0C => open,
        o_port0D => open,
        o_port0E => open,
        o_port0F => open
    );
    
    
end architecture rtl;