library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity cpu is
    port (
        clk, rst        :  in std_logic;
        i_from_mem      :  in std_logic_vector(7 downto 0);
        o_to_mem        : out std_logic_vector(7 downto 0);
        o_address       : out std_logic_vector(7 downto 0);
        o_we            : out std_logic
    );
end entity cpu;

architecture rtl of cpu is
    component control_unit is
        port (
            clk, rst        :  in std_logic;
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
            o_bus1cont      : out std_logic_vector(1 downto 0);   
            o_bus2cont      : out std_logic_vector(1 downto 0);   
            o_we            : out std_logic
        );
    end component;
    component data_path is
        port (
            clk, rst        :  in std_logic;
            i_ir_load       :  in std_logic;
            i_mar_load      :  in std_logic;
            i_pc_load       :  in std_logic;
            i_pc_inc        :  in std_logic;
            i_a_load        :  in std_logic;
            i_b_load        :  in std_logic;
            i_alucontrol    :  in std_logic_vector(2 downto 0);
            i_ccrload       :  in std_logic;
            i_bus1cont      :  in std_logic_vector(1 downto 0);
            i_bus2cont      :  in std_logic_vector(1 downto 0);
            i_from_mem      :  in std_logic_vector(7 downto 0);
            o_ir            : out std_logic_vector(7 downto 0);
            o_address       : out std_logic_vector(7 downto 0);
            o_ccr_res       : out std_logic_vector(3 downto 0);
            o_to_mem        : out std_logic_vector(7 downto 0)
        );
    end component;
    signal s_ir_load, s_mar_load, s_pc_load, s_a_load, s_b_load, s_ccr_load, s_pc_inc, s_we : std_logic := '0';
    signal s_bus1cont, s_bus2cont : std_logic_vector(1 downto 0) := "00";
    signal s_alucont : std_logic_vector(2 downto 0) := "000";
    signal s_crr_res : std_logic_vector(3 downto 0) := (others => '0');
    signal s_inst_register : std_logic_vector(7 downto 0) := (others => '0');
begin
    
    cont_unit: control_unit port map(
        clk => clk, 
        rst => rst,
        i_inst_register => s_inst_register,
        i_ccr_res => s_crr_res,
        o_ir_load => s_ir_load,
        o_mar_load => s_mar_load,
        o_pc_load => s_pc_load,
        o_pc_inc => s_pc_inc,
        o_a_load => s_a_load,
        o_b_load => s_b_load,
        o_alucontrol => s_alucont,
        o_ccrload => s_ccr_load,
        o_bus1cont => s_bus1cont,
        o_bus2cont => s_bus2cont,
        o_we => o_we
    );

    data: data_path port map(
        clk => clk, 
        rst  => rst,
        i_ir_load => s_ir_load,
        i_mar_load=> s_mar_load,
        i_pc_load => s_pc_load,
        i_pc_inc  => s_pc_inc,
        i_a_load  => s_a_load,
        i_b_load  => s_a_load,
        i_alucontrol => s_alucont,
        i_ccrload => s_ccr_load,
        i_bus1cont=> s_bus1cont,
        i_bus2cont=> s_bus2cont,
        i_from_mem=> i_from_mem,
        o_ir      => s_inst_register,
        o_address => o_address,
        o_ccr_res => s_crr_res,
        o_to_mem  => o_to_mem
    );
end architecture rtl;