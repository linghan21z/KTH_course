library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

-- The MAC (Multipply ACcumulate) component performs a very simple
-- arithmetic operation:
-- output = sample * coefficient + accumulate
entity MAC is

	port (
		--! Input sample
		x_in        : in  signed(INT_BITS+FRAC_BITS-1 downto 0);
		--! Input coefficient
		coefficient : in  signed(INT_BITS+FRAC_BITS-1 downto 0);
		--! Accumulate input
		accumulate  : in  signed(2*INT_BITS+2*FRAC_BITS+N-1 downto 0);
		--! Output result
		result      : out signed(2*INT_BITS+2*FRAC_BITS+N-1 downto 0));

end entity MAC;

architecture behaviour of MAC is
	signal mult_result : signed(2*INT_BITS+2*FRAC_BITS-1 downto 0);
begin
  -- result <= resize(resize(x_in * coefficient, result'high, result'low) + accumulate, result'high, result'low);
  mult_result <= x_in * coefficient;
  result <= mult_result + accumulate;
end behaviour;
