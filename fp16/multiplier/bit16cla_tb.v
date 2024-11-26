module bit16cla_tb;
    reg [15:0] a, b;
    reg clk;
    wire cin;
    wire [16:0] out;
    assign cin=0;
    always begin
        #5 clk=~clk;
    end
    bit16cla b1(a,b,cin,clk,out);
    initial begin
        $dumpfile("bit16cla_tb.vcd");
        $dumpvars(0, bit16cla_tb);
        $display("A    B     Y");
        clk=0;
        a   = 16'b0_10000_1000000000;
        b   = 16'b0_10011_1000000000;

        //greater lesser exponent difference check
        #7;
        a = 16'b0_11000_1000000000;
        b = 16'b0_10011_1000000000;
        #20;
        a = 16'b0_10000_1000000000;
        b = 16'b0_00000_1011011011;
        #20;
        a = 16'b0_11000_1000000000;
        b = 16'b0_11000_1000000011;
        // adder inputs check
        #20;
        a = 16'b0_11000_1111000000;
        b = 16'b0_10011_1000100011;
        // shifting check
        #20;
        a = 16'b1_11110_1110000000;
        b = 16'b0_11010_0011100011;

        #20;
        a = 16'b0_10010_1101100000;
        b = 16'b0_10001_1100000000;

        $finish;
    end

    always @(posedge clk) begin
        $display("%f %f %f", a, b, out);
        if (a + b == out) $display("Correct");
    end

endmodule


module bit16cla(input [15:0] a,input [15:0] b,input cin,input clk,output reg [16:0] s);
    wire c1,c2,c3;
    wire [16:0] med;
    bit4cla b1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(med[3:0]),.cout(c1));
    bit4cla b2(.a(a[7:4]),.b(b[7:4]),.cin(c1),.s(med[7:4]),.cout(c2));
    bit4cla b3(.a(a[11:8]),.b(b[11:8]),.cin(c2),.s(med[11:8]),.cout(c3));
    bit4cla b4(.a(a[15:12]),.b(b[15:12]),.cin(c3),.s(med[15:12]),.cout(med[16]));
    always @(posedge clk) begin
        s<=med;
    end
endmodule
module bit4cla(input [3:0] a,input [3:0] b, input cin,output  [3:0]s,output cout);
wire g[3:0], p[3:0];
    wire c[4:0];

    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];

    assign p[0] = a[0] | b[0];
    assign p[1] = a[1] | b[1];
    assign p[2] = a[2] | b[2];
    assign p[3] = a[3] | b[3];
    
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & cin);
    assign c[2] = g[1] | (p[1] & (g[0] | (p[0] & cin)));
    assign c[3] = g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))));
    assign cout = g[3] | (p[3] & (g[2] | (p[2] & (g[1] | (p[1] & (g[0] | (p[0] & cin)))))));

    assign s[0] = a[0] ^ b[0] ^ c[0];
    assign s[1] = a[1] ^ b[1] ^ c[1];
    assign s[2] = a[2] ^ b[2] ^ c[2];
    assign s[3] = a[3] ^ b[3] ^ c[3];
endmodule

