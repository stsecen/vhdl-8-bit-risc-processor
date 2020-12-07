library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package package_core is
    
    function cla is (

    );

    type states is ();
    type type_rom is array (0 to 127) of std_logic_vector(7 downto 0);
    type type_ram is array (128 to 223) of std_logic_vector(7 downto 0);

end package package_core;


package body package_core is
    
end package body package_core;