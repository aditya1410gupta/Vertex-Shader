module bit16cla(input [15:0] a,input [15:0] b,input cin,output [16:0] s);
    wire c1,c2,c3;
    bit4cla b1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(s[3:0]),.cout(c1));
    bit4cla b2(.a(a[7:4]),.b(b[7:4]),.cin(c1),.s(s[7:4]),.cout(c2));
    bit4cla b3(.a(a[11:8]),.b(b[11:8]),.cin(c2),.s(s[11:8]),.cout(c3));
    bit4cla b4(.a(a[15:12]),.b(b[15:12]),.cin(c3),.s(s[15:12]),.cout(s[16]));
    
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