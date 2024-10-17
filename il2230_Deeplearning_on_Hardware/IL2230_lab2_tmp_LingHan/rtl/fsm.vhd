library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;
use work.types.all;

entity fsm is

	port(
		nrst                : in  std_logic;
		clk                 : in  std_logic;
		new_input           : in  std_logic;
		write_enable        : out std_logic;
		read_address        : out unsigned(ADDR_WIDTH-1 downto 0);
		output_ready        : out std_logic;
		nrst_mac            : out std_logic);
end fsm;

architecture behavioral of fsm is

	constant NUM_WEIGHTS : integer := integer(ceil((real(N+1)/real(K))));

	-- fsm state signals
	type state_type is (IDLE, CALC, READY);
	signal present_state : state_type;
	signal next_state    : state_type;
	
	signal nrst_mac_tmp            : std_logic;
	signal write_enable_tmp        : std_logic;
	signal counter                 : unsigned(CNT_WIDTH-1 downto 0);
	signal read_address_tmp        : unsigned(ADDR_WIDTH-1 downto 0);

begin

  READ_ADDRESS_PR : process(clk, nrst)
  begin
    if nrst = '0' then
      read_address_tmp <= (others => '0');
    elsif rising_edge (clk) then
      if new_input = '1' then
        read_address_tmp <= (others => '0');
      else
        if nrst_mac_tmp = '0' then
          read_address_tmp <= to_unsigned(0, read_address_tmp'length);
        else
          read_address_tmp <= read_address_tmp + to_unsigned(K, read_address_tmp'length);
        end if;
      end if;
    end if;
  end process READ_ADDRESS_PR;


  COUNTER_PR : process(clk, nrst)
  begin
    if nrst = '0' then
      counter <= (others => '0');
    elsif rising_edge (clk) then
      if (nrst_mac_tmp = '0') then
        counter <= (others => '0');
      else
        counter <= counter + 1;
      end if;
    end if;
  end process COUNTER_PR;

  -- purpose: fsm state registers
  -- type   : sequential
  -- inputs : clk, nrst, present_state
  -- outputs: next_state
  REG_STATE_PR : process(clk, nrst)
  begin
    if nrst = '0' then
      present_state <= IDLE;
    elsif rising_edge (clk) then
      present_state <= next_state;
    end if;
  end process REG_STATE_PR;


  -- purpose: main fsm logic controling the MACs, address pointers and memory 
  -- type   : combinational
  -- inputs : all (requires VHDL 2008)
  -- outputs: 
  FSM_LOGIC_PR : process(all)
  begin
    next_state              <= present_state;
    output_ready            <= '0';
    nrst_mac_tmp            <= '1';
	write_enable_tmp        <= '0';
    case present_state is
      when IDLE =>
        nrst_mac_tmp <= '0';
        if new_input = '1' then
          write_enable_tmp <= '1';
          next_state       <= CALC;
        end if;
      when CALC =>
        nrst_mac_tmp <= '1';
        if (counter = NUM_WEIGHTS - 1) then
          next_state <= READY;
        end if;

      when READY =>
        output_ready <= '1';
        next_state   <= IDLE;
    end case;
  end process FSM_LOGIC_PR;

  nrst_mac            <= nrst_mac_tmp;
  write_enable        <= write_enable_tmp;
  read_address        <= read_address_tmp;

end behavioral;
