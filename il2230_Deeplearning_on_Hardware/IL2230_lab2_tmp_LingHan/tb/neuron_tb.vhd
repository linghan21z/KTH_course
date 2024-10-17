library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.types.all;

entity neuron_tb is
end entity neuron_tb;

architecture behavior of neuron_tb is

	signal clk           : std_logic := '0';
	signal nrst          : std_logic := '0';
	signal new_input     : std_logic := '0';
	signal output_ready  : std_logic;
	signal inputs        : InputType;
	signal weights       : WeightType;
	signal output        : signed(INT_BITS+FRAC_BITS-1 downto 0);


begin

	NEURON_1 : entity work.neuron

		port map (
			clk          => clk,
	    	nrst         => nrst,
	    	inputs       => inputs,
	    	weights      => weights,
			new_input    => new_input,
	    	output       => output,
	    	output_ready => output_ready);

	clk       <= not clk                    after 10 ns;
	nrst      <= '1'                        after 5 ns;
	
	new_testcase_generation: process
		variable seed1, seed2  : integer := 99;
		variable r1, r2        : real;
		variable slv : std_logic_vector(INT_BITS + FRAC_BITS - 1 downto 0);
	begin
		wait for 40 ns;
		while true loop
			for i in 0 to N loop
				for j in slv'range loop
					uniform(seed1, seed2, r1);
				    slv(j) := '1' when r1 > 0.5 else '0';
				end loop;
				-- weights(i) <= to_signed(slv, INT_BITS-1, -FRAC_BITS);
				weights(i) <= to_signed(8, INT_BITS+FRAC_BITS);
			end loop;
			for i in 0 to N-1 loop
				for j in slv'range loop
					uniform(seed1, seed2, r2);
				    slv(j) := '1' when r2 > 0.5 else '0';
				end loop;
				-- inputs(i) <= to_signed(slv, INT_BITS-1, -FRAC_BITS);
				inputs(i) <= to_signed(8, INT_BITS+FRAC_BITS);
			end loop;
			new_input <= '1';
			wait for 20 ns;
			new_input <= '0';
			wait for 360 ns;
		end loop;
	end process;
end behavior;
