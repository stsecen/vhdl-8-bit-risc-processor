library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.package_core.all;
use work.constants.all;

entity control_unit is
    port (
        clk, rst        :  in std_logic,
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
        o_bus1cont      : out std_logic;   
        o_bus2cont      : out std_logic;   
        o_we            : out std_logic
    );
end entity control_unit;

architecture rtl of control_unit is
    state_reg, state_next : state_type := s_fetch0;
begin

    current_state: process(clk, rst)
    begin
        if rst = '1' then
            state_reg <= s_fetch0;
        elsif rising_edge(clk) then
            state_reg <= state_next;
        end if;
    end process current_state;
    
    next_state: process(i_inst_register,i_ccr_res,state_reg)
    begin
        case state_reg is
            when s_fetch0 =>
                state_next <= s_fetch1;
            when s_fetch1 =>
                state_next <= s_fetch2;
            when s_fetch2 =>
                state_next <= s_decode3;
            when s_decode3 =>
                if i_inst_register = LDA_IMM  then
                    state_next <= s_ldaimm4;
                elsif i_inst_register = LDA_DIR then
                    state_next <= s_ldadir4;
                elsif i_inst_register = LDB_IMM then
                    state_next <= s_ldbimm4;
                elsif i_inst_register = LDB_DIR then
                    state_next <= s_ldbdir4;
                elsif i_inst_register = STA_DIR then
                    state_next <= s_stadir4;
                elsif i_inst_register = STB_DIR then
                    state_next <= s_stbdir4;
                elsif i_inst_register = ADD_AB then
                    state_next <= s_addab4;
                elsif i_inst_register = SUB_AB then
                    state_next <= s_subab4;
                elsif i_inst_register = AND_AB then
                    state_next <= s_andab4;
                elsif i_inst_register = OR_AB then
                    state_next <= s_orab4;
                elsif i_inst_register = INC_A then
                    state_next <= s_inca4;
                elsif i_inst_register = DEC_A then
                    state_next <= s_incb4;
                elsif i_inst_register = INC_B then
                    state_next <= s_deca4;
                elsif i_inst_register = DEC_B then
                    state_next <= s_decb4;
                elsif i_inst_register = BRA then
                    state_next <= s_bra4;
                elsif i_inst_register = BNI then
                    if i_ccr_res(3) = '1' then  
                        state_next <= s_bni4;
                    else 
                        state_next <= s_bni7;
                    end if;
                elsif i_inst_register = BPL then
                    if i_ccr_res(3) = '0' then
                        state_next <= s_bpl4;
                    else 
                        state_next <= s_bpl4;
                    end if;
                elsif i_inst_register = BEQ then
                    if i_ccr_res(2) = '1' then
                        state_next <= s_beq4;
                    else
                        state_next <= s_beq7;
                    end if;
                elsif i_inst_register = BNE then
                    if i_ccr_res(2) = '0' then
                        state_next <= s_bne4;
                    else
                        state_next <= s_bne7;
                    end if;
                elsif i_inst_register = BVS then
                    if i_ccr_res(1) = '1' then
                        state_next <= s_bvs4;
                    else
                        state_next <= s_bvs7;
                    end if;
                elsif i_inst_register = BVC then
                    if i_ccr_res(1) = '0' then
                        state_next <= s_bvc4;
                    else
                        state_next <= s_bvc7;
                    end if;
                elsif i_inst_register = BCS then
                    if i_ccr_res(0) = '1' then
                        state_next <= s_bcd4;
                    else
                        state_next <= s_bcs7;
                    end if;
                elsif i_inst_register = BCC then
                    if i_ccr_res(2) = '0' then
                        state_next <= s_bcc4;
                    else
                        state_next <= s_bcc7;
                    end if;
                else
                    state_next <= s_fetch0;
                end if;
            --> load amd store instrunctions 
            when s_ldaimm4 =>
                state_next <= s_ldaimm5;
            when s_ldaimm5 =>
                state_next <= s_ldaimm6;
            when s_ldaimm6 =>
                state_next <= s_fetch0;
            when s_ldadir4 =>
                state_next <= s_ldadir5;
            when s_ldadir5 =>    
                state_next <= s_ldadir6;
            when s_ldadir6 =>
                state_next <= s_ldadir7;
            when s_ldadir7 =>
                state_next <= s_ldadir8;
            when s_ldadir8 =>
                state_next <= s_fetch0;
            when s_ldbimm4 =>
                state_next <= s_ldbimm5;
            when s_ldbimm5 =>
                state_next <= s_ldbimm6;
            when s_ldbimm6 =>
                state_next <= s_fetch0;
            when s_ldadir4 =>
                state_next <= s_ldadir5;
            when s_ldbimm5 =>
                state_next <= s_ldadir6;
            when s_ldbdir6 =>
                state_next <= s_ldadir7;
            when s_ldbdir7 =>
                state_next <= s_ldadir8;
            when s_ldbdir8 =>
                state_next <= s_fetch0;
            when s_stadir4 =>
                state_next <= s_stadir5;
            when s_stadir5 =>
                state_next <= s_stadir6;
            when s_stadir6 =>
                state_next <= s_stadir7;
            when s_stadir7 =>
                state_next <= s_fetch0;
            when s_stabdir4 =>
                state_next <= s_stabdir5;
            when s_stabdir5 =>
                state_next <= s_stabdir6;
            when s_stabdir6 =>
                state_next <= s_stabdir7;
            when s_stabdir7 =>
                state_next <= s_fetch0;
            --> alu operations 
            when s_addab4 =>
                state_next <= s_fetch0;
            when s_subab4 =>
                state_next <= s_fetch0;
            when s_andab4 =>
                state_next <= s_fetch0;
            when s_orab4 =>
                state_next <= s_fetch0;
            when s_inca4 =>
                state_next <= s_fetch0;
            when s_incb4 =>
                state_next <= s_fetch0;
            when s_deca4 =>
                state_next <= s_fetch0;
            when s_decb4 =>
                state_next <= s_fetch0;
            --> branch operations 
            when s_bra4 =>
                state_next <= s_bra5;
            when s_bra5 =>
                state_next <= s_bra6;
            when s_bra6 =>
                state_next <= s_fetch0;
            when s_bni4 =>
                state_next <= s_bni5;
            when s_bni5 =>
                state_next <= s_bni6;
            when s_bni6 =>
                state_next <= s_fetch0;
            when s_bni7 => 
                state_next <= s_fetch0;
            when s_bpl4 =>
                state_next <= s_bpl5;
            when s_bpl5 =>
                state_next <= s_bpl6;
            when s_bpl6 =>
                state_next <= s_fetch0;
            when s_bpl7 =>
                state_next <= s_fetch0;
            when s_beq4 =>
                state_next <= s_beq5;
            when s_beq5 =>
                state_next <= s_beq6;
            when s_beq6 =>
                state_next <= s_fetch0;
            when s_beq7 =>
                state_next <= s_fetch0;
            when s_bne4 =>
                state_next <= s_bne5;
            when s_bne5 =>
                state_next <= s_bne6;
            when s_bne6 =>
                state_next <= s_fetch0;
            when s_bne7 =>
                state_next <= s_fetch0;
            when s_bvs4 =>
                state_next <= s_bvs5;
            when s_bvs5 =>
                state_next <= s_bvs6;
            when s_bvs6 =>
                state_next <= s_fetch0;
            when s_bvs7 =>
                state_next <= s_fetch0;
            when s_bvc4 =>
                state_next <= s_bvc5;
            when s_bvc5 =>
                state_next <= s_bvc6;
            when s_bvc6 =>
                state_next <= s_fetch0;
            when s_bvc7 =>
                state_next <= s_fetch0;
            when s_bcs4 =>
                state_next <= s_bcs5;
            when s_bcs5 =>
                state_next <= s_bcs6;
            when s_bcs6 =>
                state_next <= s_fetch0;
            when s_bcs7 =>
                state_next <= s_fetch0;
            when s_bcc4 =>
                state_next <= s_bcc5;
            when s_bcc5 =>
                state_next <= s_bcc6;
            when s_bcc6 =>
                state_next <= s_fetch0;
            when s_bcc7 =>        
                state_next <= s_fetch0;
            when others =>
                state_next <= s_fetch0;        
        end case ;
    end process next_state;

    output_logic: process(state_reg)
    begin
        o_ir_load    <= '0';        
        o_mar_load   <= '0';      
        o_pc_load    <= '0';   
        o_pc_inc     <= '0';           
        o_a_load     <= '0';               
        o_b_load     <= '0';   
        o_alucontrol <= "111";  --> nop value for alu              
        o_ccrload    <= '0';   
        o_bus1cont   <= "11";   --> nop value for bus1
        o_bus2cont   <= "11";   --> nop value for bus2
        o_we         <= '0';
        case state_reg is
            when s_fetch0 =>
                o_bus1cont <= "00"; --> program counter current value 
                o_bus2cont <= "01"; --> pc value registered in ir
                o_mar_load <= '1';  --> pc value stored in mar 
            when s_fetch1 =>
                o_pc_inc <= '1';    --> next pc value calculated
            when s_fetch2 =>
                o_bus2cont <= "10"; --> fecth in  instruction memory
            when s_decode3 =>
            --> load amd store instrunctions 
            when s_ldaimm4 =>
                o_bus1cont <= "00";
                o_bus2cont <= "01";
                o_mar_load <= '1';
            when s_ldaimm5 =>
                o_pc_inc <= '1';    --> next pc value calculated
            when s_ldaimm6 =>
                o_bus2cont <= "10"; --> fecth in  instruction memory
                o_a_load <= '1';
            when s_ldadir4 =>
                o_bus1cont <= "00"; --> program counter current value 
                o_bus2cont <= "01"; --> pc value registered in ir
                o_mar_load <= '1';  --> pc value stored in mar 
            when s_ldadir5 =>    
            when s_ldadir6 =>
            when s_ldadir7 =>
            when s_ldadir8 =>
            when s_ldbimm4 =>
            when s_ldbimm5 =>
            when s_ldbimm6 =>
            when s_ldadir4 =>
            when s_ldbimm5 =>
            when s_ldbdir6 =>
            when s_ldbdir7 =>
            when s_ldbdir8 =>
            when s_stadir4 =>
            when s_stadir5 =>
            when s_stadir6 =>
            when s_stadir7 =>
            when s_stabdir4 =>
            when s_stabdir5 =>
            when s_stabdir6 =>
            when s_stabdir7 =>
            --> alu operations 
            when s_addab4 =>
            when s_subab4 =>
            when s_andab4 =>
            when s_orab4 =>
            when s_inca4 =>
            when s_incb4 =>
            when s_deca4 =>
            when s_decb4 =>
            --> branch operations 
            when s_bra4 =>
            when s_bra5 =>
            when s_bra6 =>
            when s_bni4 =>
            when s_bni5 =>
            when s_bni6 =>
            when s_bni7 => 
            when s_bpl4 =>
            when s_bpl5 =>
            when s_bpl6 =>
            when s_bpl7 =>
            when s_beq4 =>
            when s_beq5 =>
            when s_beq6 =>
            when s_beq7 =>
            when s_bne4 =>
            when s_bne5 =>
            when s_bne6 =>
            when s_bne7 =>
            when s_bvs4 =>
            when s_bvs5 =>
            when s_bvs6 =>
            when s_bvs7 =>
            when s_bvc4 =>
            when s_bvc5 =>
            when s_bvc6 =>
            when s_bvc7 =>
            when s_bcs4 =>
            when s_bcs5 =>
            when s_bcs6 =>
            when s_bcs7 =>
            when s_bcc4 =>
            when s_bcc5 =>
            when s_bcc6 =>
            when s_bcc7 =>        
            when others =>
        end case ;
        
    end process output_logic;
end architecture rtl;