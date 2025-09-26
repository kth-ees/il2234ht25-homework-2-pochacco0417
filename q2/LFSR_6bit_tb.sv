module LFSR_6bit_tb;

  logic clk, rst_n, sel;
  logic [5:0] parallel_in;
  logic [5:0] parallel_out;

  LFSR_6bit DUT(
    .clk(clk),
    .rst_n(rst_n),
    .sel(sel),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );

  initial begin
    clk=0;
    always #5 clk=~clk;
  end

  initial begin
    rst_n=0; sel=0; parallel_in='0;
    #12 rst_n=1;
    #10 sel=0; parallel_in=6'b100000;
    #10 sel=1;
    #10 $stop;
  end

  initial begin
    $monitor("Time=%0t Output=%b", $time, parallel_out);
  end

endmodule
