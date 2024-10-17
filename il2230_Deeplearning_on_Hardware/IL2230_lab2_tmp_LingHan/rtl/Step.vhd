library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use work.types.all;

entity Step is

  port (
    result_in         : in  signed(INT_BITS+FRAC_BITS-1 downto 0);
    output            : out signed(INT_BITS+FRAC_BITS-1 downto 0));

end entity Step;

architecture behaviour of Step is
	signal constant_int  : signed(INT_BITS-2 downto 0);
	signal constant_frac : signed(FRAC_BITS-1 downto 0);
begin
process(result_in)
begin
    if(result_in > 0) then
        output <= constant_int & '1' & constant_frac; -- This signal has to amount to 1 and need to be changed depending on the number of bits used.
    else
        output <= (others => '0');
    end if;
end process;
end behaviour;
