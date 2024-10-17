module saturation_round #(parameter I, parameter Fin, parameter Fout)(
input logic [15:0] in,
input logic up_down, //the control input
output logic [8:0] out 

);
// Assume Q(8.8) and Q(8.4)
// Assume 16-bit Q(I.Fin) and 8-bit Q(I.Fout)
logic unsigned [7:0] rnd_up;
assign rnd_up = unsigned'(in[15:8])+1'b1;

assign out    = (up_down==1)?in[15:8]:rnd_up; //1-down 0-up


endmodule