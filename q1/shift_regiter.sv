module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)
      parallel_out<='0;
    else if (load_enable) begin
      if(serial_parallel)begin
        parallel_out<=parallel_in;
      end else begin
        parallel_out<={serial_in, parallel_out[N-1:1]};
      end
    end else begin
      parallel_out<=parallel_out;
    end
  end

  assign serail_out<=parallel_out[0];

endmodule

