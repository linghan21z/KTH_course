module fsm_N_neuron #(parameter M = 3, N = 2) (
	input  logic clk,
	input  logic nrst,
	input  logic init,
	output logic read_en,
	output logic write_en,
	output logic done,
	output logic [$clog2(M-1)-1: 0] layer_addr
);

typedef enum logic [1: 0] {IDLE, CALC, DONE} state; 

state present_state, next_state;

logic [$clog2(M-1)-1: 0] layer_addr_tmp;

always_ff @(posedge clk, negedge nrst) begin
	if (!nrst) begin
		layer_addr_tmp  <= 0;
		present_state   <= IDLE;
	end else begin
		present_state   <= next_state;
		case(present_state)
			CALC: begin
				layer_addr_tmp  <= (layer_addr_tmp == M - 2)? 0: layer_addr_tmp + 1;
			end
			DONE: begin
				layer_addr_tmp  <= 0;
			end
		endcase
	end
end

always_comb begin
	read_en = 1'b0;
	write_en = 1'b0;
	done    = 1'b0;
	case(present_state)
		IDLE: begin
			if (init) begin
				next_state = CALC;
			end
		end
		CALC: begin
			read_en  = 1'b1;
			write_en = 1'b1;
			if (layer_addr == M - 2) begin 
				next_state = DONE;
			end
		end
		DONE: begin
			done = 1'b1;
			next_state = IDLE;
		end
	endcase
end

assign layer_addr  = layer_addr_tmp;

endmodule
