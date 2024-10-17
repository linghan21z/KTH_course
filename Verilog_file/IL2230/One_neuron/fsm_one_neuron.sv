module fsm_one_neuron #(parameter M = 3, N = 2) (
	input  logic clk,
	input  logic nrst,
	input  logic init,
	output logic read_en,
	output logic write_en,
	output logic done,
	output logic [$clog2(M-1)-1: 0] layer_addr,
	output logic [$clog2(N)-1: 0] neuron_addr
);

typedef enum logic [1: 0] {IDLE, CALC, DONE} state; 

state present_state, next_state;

logic [$clog2(N)-1: 0]   neuron_addr_tmp;
logic [$clog2(M-1)-1: 0] layer_addr_tmp;

always_ff @(posedge clk, negedge nrst) begin
	if (!nrst) begin
		neuron_addr_tmp <= 0;
		layer_addr_tmp  <= 0;
		present_state   <= IDLE;
	end else begin
		present_state   <= next_state;
		case(present_state)
			CALC: begin
				if (neuron_addr_tmp == N - 1) begin
					layer_addr_tmp  <= (layer_addr_tmp == M-2)? 0: layer_addr_tmp + 1;
					neuron_addr_tmp <= 0;
				end else begin
					neuron_addr_tmp <= neuron_addr_tmp + 1;
				end
			end
		endcase
	end
end

always_comb begin
	read_en    = 1'b0;
	write_en   = 1'b0;
	done       = 1'b0;
	case(present_state)
		IDLE: begin
			if (init) begin
				next_state = CALC;
			end
		end
		CALC: begin
			read_en  = 1'b1;
			write_en = 1'b1;
			if (neuron_addr_tmp == N - 1 && layer_addr_tmp == M - 2) begin 
				next_state = DONE;
			end else begin
				next_state = CALC;
			end
		end
		DONE: begin
			done = 1'b1;
			next_state = IDLE;
		end
	endcase
end

assign neuron_addr = neuron_addr_tmp;
assign layer_addr  = layer_addr_tmp;
endmodule
