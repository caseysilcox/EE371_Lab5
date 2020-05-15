module pt2_fir  (
                input clk,
                input rst,
                input signed [23:0] Data_in,
                output signed [23:0] Data_out
                );

    reg signed [23:0] temp1;
    reg signed [23:0] temp2;
    reg signed [23:0] temp3;
    reg signed [23:0] temp4;
    reg signed [23:0] temp5;
    reg signed [23:0] temp6;
    reg signed [23:0] temp7;
    
    wire signed [23:0] s0;
    wire signed [23:0] s1;
    wire signed [23:0] s2;
    wire signed [23:0] s3;
    wire signed [23:0] s4;
    wire signed [23:0] s5;
    wire signed [23:0] s6;
    wire signed [23:0] s7;
    
    always @(posedge clk) begin
        if (rst) begin
            temp1 <= 24'b0;
            temp2 <= 24'b0;
            temp3 <= 24'b0;
            temp4 <= 24'b0;
            temp5 <= 24'b0;
            temp6 <= 24'b0;
            temp7 <= 24'b0;
        end else begin
            temp1 <= Data_in;
            temp2 <= temp1;
            temp3 <= temp2;
            temp4 <= temp3;
            temp5 <= temp4;
            temp6 <= temp5;
            temp7 <= temp6;
        end
    end

    assign s0 = Data_in>>>3;
    assign s1 = temp1>>>3;
    assign s2 = temp2>>>3;
    assign s3 = temp3>>>3;
    assign s4 = temp4>>>3;
    assign s5 = temp5>>>3;
    assign s6 = temp6>>>3;
    assign s7 = temp7>>>3;

    assign Data_out = s0+s1+s2+s3+s4+s5+s6+s7;

endmodule

module fir_test();

    reg clk;
    reg rst;

    reg signed [23:0] Data_in;
    wire signed [23:0] Data_out;

    pt2_fir dut(clk, rst, Data_in, Data_out);

    initial clk <= 1'b0;

    always #10 clk <= ~clk;

    initial begin
        @(posedge clk) rst <= 1'b1;
        @(posedge clk) rst <= 1'b0; Data_in <= -19;
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) Data_in <= 19;
        @(posedge clk)
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        @(posedge clk) 
        $stop;
    end

endmodule