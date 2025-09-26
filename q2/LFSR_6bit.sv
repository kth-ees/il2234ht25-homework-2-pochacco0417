module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  logic [5:0] next_state;
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      parallel_out<='0;
    end else if(!sel) begin
      parallel_out<=parallel_in;
    end else begin
      next_state[0]=parallel_out[5];
      next_state[1]=parallel_out[0]^parallel_out[5];
      next_state[2]=parallel_out[1];
      next_state[3]=parallel_out[2]^parallel_out[5];
      next_state[4]=parallel_out[3];
      next_state[5]=parallel_out[4];
      parallel_out<=next_state;
    end
  end
endmodule

