module wallace_tree_tb;
    reg [10:0] a,b;
    reg clk,rst;
    wire [21:0] out;
    always begin
        #5 clk=~clk;
    end
    wallace_tree w1(clk,rst,a,b,out);
    initial begin
        rst=1;clk<=0;
        a<=11'd1894;
        b<=11'd1062;
        #12
        a<=11'd194;
        b<=11'd1162;
        #10
        a<=11'd190;
        b<=11'd162;
        #10
        $finish;
    end
    reg [21:0] outactual;
    always @(negedge clk)begin
        outactual<=a*b;
        $display("%d %d %d %d",a,b,out,outactual);
        if(a*b==out) $display("Correct");
    end
endmodule
