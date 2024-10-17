library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

entity ReLu is

	port (
		result_in         : in  signed(INT_BITS+FRAC_BITS-1 downto 0);
    	output            : out signed(INT_BITS+FRAC_BITS-1 downto 0));

end entity ReLu;

architecture behaviour of ReLu is
begin
process(result_in)
begin
    if(result_in > 0) then
        output <= result_in;
    else
        output <= (others =>'0');
    end if;
end process;
end behaviour;
