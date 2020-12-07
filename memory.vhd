library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity memory is
    port (
        clk, rst    :  in std_logic;
        i_address   :  in std_logic_vector(7 downto 0);
        i_we        :  in std_logic;
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
end entity memory;

architecture rtl of memory is

    component data_memory is
        port (
            clk, rst : in std_logic;
            i_addres : in std_logic_vector(7 downto 0);
            i_data   : in std_logic_vector(7 downto 0);
            i_we     : in std_logic;
            o_data   : out std_logic_vector(7 downto 0);
        );
    end component;

    component output_ports is
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
    end component;

    component instruction_memory is
        port (
            clk, rst : in std_logic;
            i_addres : in std_logic_vector(7 downto 0);
            o_instr  : out std_logic_vector(7 downto 0)
        );
    end component instruction_memory;
    
    signal s_instruction, s_data_out : in std_logic_vector(7 downto 0) := (others => '0');

begin
    rom: instruction_memory : port map(
        clk => clk, 
        rst => rst,
        i_addres => i_address, 
        o_instr => s_instruction
    );
    ram: data_memory : port map(
        clk => clk, 
        rst => rst,
        i_addres => i_address,
        i_data   => i_data,
        i_we     => i_we,
        o_data   => s_data_out
    );
    oport: output_ports : port map(
        clk => clk, 
        rst  => rst,
        i_address => i_address
        i_data    => i_data,
        i_we      => i_we,
        o_port00  => o_port00,
        o_port01  => o_port01,
        o_port02  => o_port02,
        o_port03  => o_port03,
        o_port04  => o_port04,
        o_port05  => o_port05,
        o_port06  => o_port06,
        o_port07  => o_port07,
        o_port08  => o_port08,
        o_port09  => o_port09,
        o_port0A  => o_port0A,
        o_port0B  => o_port0B,
        o_port0C  => o_port0C,
        o_port0D  => o_port0D,
        o_port0E  => o_port0E,
        o_port0F  => o_port00F
    );

    out_mux: process(s_instruction,s_data_out,i_port01,i_port02,i_port03,i_port04,i_port05,
                    i_port06,i_port07,i_port08,i_port09,i_port0A,i_port0B,i_port0C,i_port0D,
                    i_port0E,i_port0F)
    begin
        if i_address >= x"00" and i_address <= x"7F" then
            o_data <= s_instruction;
        elsif i_address >= x"80" and i_address <= x"DF" then
            o_data <= s_data_out;
        elsif i_address >= x"F0" and i_address <= x"7F" then
            case i_address is
                when x"F0" =>
                    o_data <= i_port00;
                when x"F1" =>
                    o_data <= i_port01;
                when x"F2" =>
                    o_data <= i_port02;
                when x"F3" =>
                    o_data <= i_port03;
                when x"F4" =>
                    o_data <= i_port04;
                when x"F5" =>
                    o_data <= i_port05;
                when x"F6" =>
                    o_data <= i_port06;
                when x"F7" =>
                    o_data <= i_port07;
                when x"F8" =>
                    o_data <= i_port08;
                when x"F9" =>
                    o_data <= i_port09;
                when x"FA" =>
                    o_data <= i_port0A;
                when x"FB" =>
                    o_data <= i_port0B;
                when x"FC" =>
                    o_data <= i_port0C;
                when x"FD" =>
                    o_data <= i_port0D;
                when x"FE" =>
                    o_data <= i_port0E;
                when x"FF" =>
                    o_data <= i_port0F;
                when others =>
                    o_data <= (others => '0');
            end case;
        else
            o_data <= (others => '0');
        end if; 
    end process out_mux;
    
    
end architecture rtl;