module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
  always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
      count_out<='0;
      carrry_out<=1'b0;
    end else if(load)begin
      count_out<=input_load;
      carry_out<=1'b0;
    end else begin
      if(up_down)begin
        if(&count_out)begin
          carry_out<=1'b1;
          count_out<='0;
        end else begin
          count_out<=count_out+1;
          carry_out<=1'b0;
        end
      end else begin
        if(count_out=='0)begin
          carry_out<=1'b1;
          count_out<={N{1'b1}};
        end else begin
          count_out<=count_out-1;
          carry_out<=1'b0;
        end
      end
    end
  end

endmodule
