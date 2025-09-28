module up_down_counter_tb;

parameter N=4;

  logic clk, rst_n;
  logic load, up_down, carry_out;
  logic [N-1:0] input_load, count_out;

  up_down_counter #(N) dut(
    .clk(clk),
    .rst_n(rst_n),
    .load(load),
    .up_down(up_down),
    .carry_out(carry_out),
    .input_load(input_load),
    .count_out(count_out)
  );

  initial begin
    clk=0;
    always #5 clk=~clk;
  end

  initial begin
    rst_n=0; load=0; up_down=1; input_load='0;
    #12 rst_n=1;
    #10 load=1; input_load=4'b1110;
    #10 load=0;
    #40 up_down=0;
    #30 rst_n=0;
    #30 $stop;
  end

  initial begin
    $monitor("time=%0t\tload=%b\tinput_load=%b\tup_down=%b\tcount_out=%0d\tcarry_out=%b",
             $time, load, input_load, up_down, count_out, carry_out);
  end
    
endmodule
