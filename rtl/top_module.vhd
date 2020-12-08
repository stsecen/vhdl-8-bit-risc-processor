library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity top_module is
    port (
        clk, rst    :  in std_logic;
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
end entity top_module;

architecture rtl of top_module is
    component cpu is
        port (
            clk, rst        :  in std_logic;
            i_from_mem      :  in std_logic_vector(7 downto 0);
            o_to_mem        :  in std_logic_vector(7 downto 0);
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
            o_mem       : out std_logic_vector(7 downto 0);
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
begin
    
    cpumodule: cpu port map(
        clk => clk, 
        rst => rst,  
        i_from_mem =>s_fromdata,
        o_to_mem => s_todata ,
        o_address => s_address,
        o_we => s_we
    );

    memmodule: memory port map(
        clk      => clk, 
        rst      => rst,
        i_address=> s_address,
        i_we     => s_we,
        i_data   => s_todata,
        i_port00 => i_port00,
        i_port01 => i_port01,
        i_port02 => i_port02,
        i_port03 => i_port03,
        i_port04 => i_port04,
        i_port05 => i_port05,
        i_port06 => i_port06,
        i_port07 => i_port07,
        i_port08 => i_port08,
        i_port09 => i_port09,
        i_port0A => i_port0A,
        i_port0B => i_port0B,
        i_port0C => i_port0C,
        i_port0D => i_port0D,
        i_port0E => i_port0E,
        i_port0F => i_port0F,
        o_mem    => s_fromdata,
        o_port00 => o_port00,
        o_port01 => o_port01,
        o_port02 => o_port02,
        o_port03 => o_port03,
        o_port04 => o_port04,
        o_port05 => o_port05,
        o_port06 => o_port06,
        o_port07 => o_port07,
        o_port08 => o_port08,
        o_port09 => o_port09,
        o_port0A => o_port0A,
        o_port0B => o_port0B,
        o_port0C => o_port0C,
        o_port0D => o_port0D,
        o_port0E => o_port0E,
        o_port0F => o_port0F
    );
    
    
end architecture rtl;