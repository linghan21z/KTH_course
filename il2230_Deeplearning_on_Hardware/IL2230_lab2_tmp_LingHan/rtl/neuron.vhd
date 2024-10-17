library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use work.types.all;

entity neuron is

	port (
		--! Clock signal
  		clk          : in  std_logic;
  		--! Active low asynchronous reset
  		nrst         : in  std_logic;
  		--! Inputs of the neuron
  		inputs       : in  InputType;
  		--! Weights of the neuron
  		weights      : in  WeightType;
  		--! New input flag
  		new_input    : in  std_logic;
  		--! Output of the neuron
  		output       : out signed(INT_BITS+FRAC_BITS-1 downto 0);
  		--! Output ready flag
  		output_ready : out std_logic);

end entity neuron;

architecture structural of neuron is

	signal nrst_mac            : std_logic;
	signal write_enable        : std_logic;
	signal result              : signed(INT_BITS+FRAC_BITS-1 downto 0);
	signal read_address        : unsigned(ADDR_WIDTH-1 downto 0);
	signal input_batch         : BatchType;
	signal weight_batch        : BatchType;
	signal output_ready_tmp    : std_logic;

begin

	ARITHMETIC_UNIT_1 : entity work.arithmetic_unit

		port map (
			clk          => clk,
			nrst         => nrst,
			nrst_mac     => nrst_mac,
			input_batch  => input_batch,
			weight_batch => weight_batch,
			result       => result);

	FSM_1 : entity work.fsm

		port map (
			clk          => clk,
			nrst         => nrst,
			new_input    => new_input,
			write_enable => write_enable,
			read_address => read_address,
			output_ready => output_ready_tmp,
			nrst_mac     => nrst_mac);

	MEMORY_1 : entity work.memory

		port map (
			clk          => clk, 
			nrst         => nrst, 
			write_enable => write_enable,
			read_address => read_address, 
			inputs       => inputs, 
			weights      => weights, 
			input_batch  => input_batch, 
			weight_batch => weight_batch);


	OUTPUT_SELECT : output <= result when (output_ready_tmp = '1') else (others => '0');
	output_ready <= output_ready_tmp;

end structural;
