library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

entity arithmetic_unit is

	port (
		--! Clock signal
		clk          : in  std_logic;
		--! Active low asynchronous reset
		nrst         : in  std_logic;
		--! Active low MAC reset. Clears the accumulate value.
		nrst_mac     : in  std_logic;
		--! Inputs batch 
		input_batch  : in  BatchType;
		--! Weights batch
		weight_batch : in  BatchType;
		--! Output result
		result       : out signed(INT_BITS+FRAC_BITS-1 downto 0));

end entity arithmetic_unit;

architecture behaviour of arithmetic_unit is
	type result_type is array (K-1 downto 0) of signed(2*INT_BITS+2*FRAC_BITS+N-1 downto 0);
	type result_tmp_type is array (K downto 0) of signed(2*INT_BITS+2*FRAC_BITS+N-1 downto 0);

	signal temp_result : result_type;
	signal MAC_result  : result_type;

	signal li_result   : signed(INT_BITS+FRAC_BITS-1 downto 0);
	signal result_tmp  : result_tmp_type;
begin

	ACTIVATION_FUNC_1 : entity work.Sigmoid
	-- ACTIVATION_FUNC_1 : entity work.ReLu

		port map (
			result_in => li_result, 
			output    => result);

	-- Instantiate K MACs
	GENERATE_MACS: 
	for i in 0 to (K-1) generate
		MAC: entity work.MAC

		port map (
			x_in        => input_batch(i),
			coefficient => weight_batch(i),
			accumulate  => temp_result(i),
			result      => MAC_result(i));

	end generate GENERATE_MACS;

	UPDATE_PR: process (clk, nrst)
	begin
		if nrst = '0' then
			temp_result <= (others => (others => '0'));
    	elsif rising_edge (clk) then
			if nrst_mac = '0' then
				temp_result <= (others => (others => '0'));
			else
				for i in 0 to K-1 loop
					temp_result(i) <= MAC_result(i);
				end loop;
			end if;
    	end if;
	end process UPDATE_PR;

	SUM_PR: process (all)
	begin
		result_tmp(0) <= (others => '0');
		for i in 0 to K-1 loop
			result_tmp(i+1) <= result_tmp(i) + MAC_result(i);
		end loop;
		li_result <= result_tmp(K)(INT_BITS+2*FRAC_BITS-1 downto FRAC_BITS);
	end process SUM_PR;

end behaviour;
