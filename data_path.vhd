library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity data_path is
    port (
        clk, rst        :  in std_logic;
        i_ir_load       :  in std_logic;
        i_mar_load      :  in std_logic;
        i_pc_load       :  in std_logic;
        i_pc_inc        :  in std_logic;
        i_a_load        :  in std_logic;
        i_b_load        :  in std_logic;
        i_alucontrol    :  in std_logic;
        i_ccrload       :  in std_logic;
        i_bus1cont      :  in std_logic_vector(1 downto 0);
        i_bus2cont      :  in std_logic_vector(1 downto 0);
        i_from_mem      :  in std_logic_vector(7 downto 0);
        o_ir            : out std_logic_vector(7 downto 0);
        o_address       : out std_logic_vector(7 downto 0);
        o_ccr_res       : out std_logic_vector(3 downto 0);
        o_to_mem        : out std_logic_vector(7 downto 0)
    );
end entity data_path;

architecture rtl of data_path is

    component alu is
        port (
            i_data0      :  in std_logic_vector(7 downto 0);
            i_data1      :  in std_logic_vector(7 downto 0);
            i_alucontrol :  in std_logic_vector(2 downto 0);
            o_result     : out std_logic_vector(7 downto 0);
            o_flags      : out std_logic_vector(3 downto 0)  
        );
    end component;

    signal s_bus1,s_bus2 : std_logic_vector(1 downto 0);
    signal s_alu_result  : std_logic_vector(7 downto 0);
    signal s_ir,s_mar,s_pc,s_areg,s_breg: std_logic_vector(7 downto 0);
    signal s_ccr_in, s_ccr_out : std_logic_vector(3 downto 0);

begin
    s_bus1<=s_pc when i_bus1cont = "00" else
            s_areg when i_bus1cont = "01" else
            s_breg when i_bus1cont = "10" else
            "00";
    s_bus2<=s_alu_result when i_bus1cont = "00" else
            s_bus1 when i_bus1cont = "01" else
            i_from_mem when i_bus1cont = "10" else
            "00";
    --> output assignment
    o_address <= s_mar;
    o_ccr_res <= s_ccr_out;
    o_to_mem  <= s_bus1;

    instruction_reg: process(clk, rst)
    begin
        if rst = '1' then
            s_ir <= (others => '0');
        elsif rising_edge(clk) then
            if i_ir_load = '1' then 
                s_ir <= s_bus2;
            end if;
        end if;
    end process instruction_reg;
    mem_access_reg: process(clk, rst)
    begin
        if rst = '1' then
            s_mar <= (others => '0');
        elsif rising_edge(clk) then
            if i_mar_load = '1' then 
                s_ir <= s_bus2;
            end if;
        end if;
    end process mem_access_reg;
    program_counter: process(clk, rst)
    begin
        if rst = '1' then
            s_pc <= (others => '0');
        elsif rising_edge(clk) then
            if i_pc_load = '1' then 
                s_pc <= s_bus2;
            elsif i_pc_inc = '1' then 
                s_pc <= std_logic_vector((unsigned(s_pc) +1));
            end if;
        end if;
    end process program_counter;
    register_a: process(clk, rst)
    begin
        if rst = '1' then
            s_areg <= (others => '0');
        elsif rising_edge(clk) then
            if i_a_load = '1' then 
                s_areg <= s_bus2;
            end if;
        end if;
    end process register_a;
    register_b: process(clk, rst)
    begin
        if rst = '1' then
            s_breg <= (others => '0');
        elsif rising_edge(clk) then
            if i_b_load = '1' then 
                s_breg <= s_bus2;
            end if;
        end if;
    end process register_b;
    alu_map: alu port map(
        i_data0      => s_breg,
        i_data1      => s_bus1,
        i_alucontrol => i_alucontrol,
        o_result     => s_alu_result,
        o_flags      => s_ccr_in,
    );
    cc_register: process(clk, rst)
    begin
        if rst = '1' then
            s_ccr_out <= (others => '0');
        elsif rising_edge(clk) then
            if i_ccrload = '1' then
                s_ccr_out <= s_ccr_in;
            end if;
        end if;
    end process cc_register;
end architecture rtl;