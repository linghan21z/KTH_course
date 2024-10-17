library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.types.all;

--! @brief The memory stores the inputs and weights of the neuron.
--
-- It has synchoronous input port an asynchronous output port.
entity memory is

	port (
		--! Clock signal
		clk           : in  std_logic;
		--! Active low asynchronous reset
		nrst          : in  std_logic;
		--! Flag to enable write of the new inputs and weights to memory
		write_enable  : in  std_logic;
		--! Read address of stored inputs and weights
		read_address  : in  unsigned(ADDR_WIDTH-1 downto 0);
		--! Input (write) (Synchronous)
		inputs        : in  InputType;
		--! Weight (write) (Synchronous)
		weights       : in  WeightType;
		--! Input (read). (Asynchronous)
		input_batch   : out BatchType;
		--! Weight (read). (Asynchronous)
		weight_batch  : out BatchType);

end memory;

architecture behaviour of memory is

	--! Sample memory
	signal input_data    : WeightType;
	signal weight_data   : WeightType;
	-- signal constant_int  : signed(INT_BITS-2 downto 0);
	-- signal constant_frac : signed(FRAC_BITS-1 downto 0);

begin

	-- Synchronous write to sample memory
	memory_write_pr : process (nrst, clk)
	begin
		if nrst = '0' then
			for i in 1 to N loop
				input_data(i) <= (others => '0');
			end loop;
			weight_data <= (others => (others => '0'));
	  	elsif rising_edge (clk) then
			if write_enable = '1' then
			end if;
	  	end if;
		input_data(0)(INT_BITS+FRAC_BITS-1 downto FRAC_BITS+1) <= (others => '0');
		input_data(0)(FRAC_BITS) <= '1';
		input_data(0)(FRAC_BITS-1 downto 0) <= (others => '0');
		for i in 1 to N loop
			input_data(i) <= inputs(i-1);
		end loop;
		for i in 0 to N loop
			weight_data(i) <= weights(i);
		end loop;
	end process memory_write_pr;

	-- Asynchronous read from sample memory
	memory_read_pr : process (all)
	begin
		for i in 0 to (K-1) loop
			if read_address + i < N + 1 then
				input_batch(i) <= input_data(to_integer(read_address+i));
				weight_batch(i) <= weight_data(to_integer(read_address+i));
			else
				input_batch(i) <= (others => '0');
				weight_batch(i) <= (others => '0');
			end if;
		end loop;
	end process memory_read_pr;

end behaviour;








