library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package package_core is

    type type_state is (
        s_fetch0, s_fetch1, s_fetch2, s_decode3,
        s_ldaimm4, s_ldaimm5, s_ldaimm6,
        s_ldadir4, s_ldadir5, s_ldadir6, s_ldadir7, s_ldadir8,
        s_ldbimm4, s_ldbimm5, s_ldbimm6,
        s_ldbdir4, s_ldbdir5, s_ldbdir6, s_ldbdir7, s_ldbdir8,
        s_stadir4, s_stadir5, s_stadir6, s_stadir7,
        s_stbdir4, s_stbdir5, s_stbdir6, s_stbdir7,
        s_addab4, 
        s_subab4,
        s_andab4,
        s_orab4,
        s_inca4,
        s_incb4,
        s_deca4,
        s_decb4,
        s_bra4, s_bra5, s_bra6,
        s_bni4, s_bni5, s_bni6, s_bni7,  
        s_bpl4, s_bpl5, s_bpl6, s_bpl7,  
        s_beq4, s_beq5, s_beq6, s_beq7,
        s_bne4, s_bne5, s_bne6, s_bne7, 
        s_bvs4, s_bvs5, s_bvs6, s_bvs7,  
        s_bvc4, s_bvc5, s_bvc6, s_bvc7,  
        s_bcs4, s_bcs5, s_bcs6, s_bcs7,     
        s_bcc4, s_bcc5, s_bcc6, s_bcc7   
    );
    type type_rom is array (0 to 127) of std_logic_vector(7 downto 0);
    type type_ram is array (128 to 223) of std_logic_vector(7 downto 0);

end package package_core;


package body package_core is
    
end package body package_core;