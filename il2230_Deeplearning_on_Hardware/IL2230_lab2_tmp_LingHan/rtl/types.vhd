library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

package types is 
	constant N          : integer := 2;
	constant K          : integer := 1;
	constant INT_BITS   : integer := 3;
	constant FRAC_BITS  : integer := 5;
	constant CNT_WIDTH  : integer := integer(ceil(log2(((real(N+1)/real(K))))));
	constant ADDR_WIDTH : integer := integer(ceil(log2(real(N+1))));

	type InputType is array (N-1 downto 0) of signed(INT_BITS+FRAC_BITS-1 downto 0);
	type WeightType is array (N downto 0) of signed(INT_BITS+FRAC_BITS-1 downto 0);
	type BatchType is array (K-1 downto 0) of signed(INT_BITS+FRAC_BITS-1 downto 0);
end package;
