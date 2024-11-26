module finalshader(
    input clk,
    input rst,
    input [15:0][15:0] a ,
    input [3:0][15:0] b ,
    output wire [3:0][15:0] out);

    wire [15:0] pp [15:0]; //Partial Products
    wire [15:0] ps [7:0]; //Partial Sums
    //The entire process is divided into three stages
    //Stage 1:Multiplication of individual elements
    fp16mult fm1(.clk(clk),.rst(rst),.a(a[0]),.b(b[0]),.x(pp[0]));
    fp16mult fm2(.clk(clk),.rst(rst),.a(a[1]),.b(b[1]),.x(pp[1]));
    fp16mult fm3(.clk(clk),.rst(rst),.a(a[2]),.b(b[2]),.x(pp[2]));
    fp16mult fm4(.clk(clk),.rst(rst),.a(a[3]),.b(b[3]),.x(pp[3]));

    fp16mult fm5(.clk(clk),.rst(rst),.a(a[4]),.b(b[0]),.x(pp[4]));
    fp16mult fm6(.clk(clk),.rst(rst),.a(a[5]),.b(b[1]),.x(pp[5]));
    fp16mult fm7(.clk(clk),.rst(rst),.a(a[6]),.b(b[2]),.x(pp[6]));
    fp16mult fm8(.clk(clk),.rst(rst),.a(a[7]),.b(b[3]),.x(pp[7]));

    fp16mult fm9(.clk(clk),.rst(rst),.a(a[8]),.b(b[0]),.x(pp[8]));
    fp16mult fm10(.clk(clk),.rst(rst),.a(a[9]),.b(b[1]),.x(pp[9]));
    fp16mult fm11(.clk(clk),.rst(rst),.a(a[10]),.b(b[2]),.x(pp[10]));
    fp16mult fm12(.clk(clk),.rst(rst),.a(a[11]),.b(b[3]),.x(pp[11]));

    fp16mult fm13(.clk(clk),.rst(rst),.a(a[12]),.b(b[0]),.x(pp[12]));
    fp16mult fm14(.clk(clk),.rst(rst),.a(a[13]),.b(b[1]),.x(pp[13]));
    fp16mult fm15(.clk(clk),.rst(rst),.a(a[14]),.b(b[2]),.x(pp[14]));
    fp16mult fm16(.clk(clk),.rst(rst),.a(a[15]),.b(b[3]),.x(pp[15]));

    //Stage 2:Addition of partial products taken 2 at a time;
    fp16adder fa1(.clk(clk),.rst(rst),.a(pp[0]),.b(pp[1]),.x(ps[0]));
    fp16adder fa2(.clk(clk),.rst(rst),.a(pp[2]),.b(pp[3]),.x(ps[1]));

    fp16adder fa3(.clk(clk),.rst(rst),.a(pp[4]),.b(pp[5]),.x(ps[2]));
    fp16adder fa4(.clk(clk),.rst(rst),.a(pp[7]),.b(pp[6]),.x(ps[3]));

    fp16adder fa5(.clk(clk),.rst(rst),.a(pp[9]),.b(pp[8]),.x(ps[4]));
    fp16adder fa6(.clk(clk),.rst(rst),.a(pp[11]),.b(pp[10]),.x(ps[5]));

    fp16adder fa7(.clk(clk),.rst(rst),.a(pp[13]),.b(pp[12]),.x(ps[6]));
    fp16adder fa8(.clk(clk),.rst(rst),.a(pp[14]),.b(pp[15]),.x(ps[7]));

    //Stage 3:Final Addition of partial products;
    fp16adder fa9(.clk(clk),.rst(rst),.a(ps[0]),.b(ps[1]),.x(out[0]));
    fp16adder fa10(.clk(clk),.rst(rst),.a(ps[2]),.b(ps[3]),.x(out[1]));
    fp16adder fa11(.clk(clk),.rst(rst),.a(ps[4]),.b(ps[5]),.x(out[2]));
    fp16adder fa12(.clk(clk),.rst(rst),.a(ps[6]),.b(ps[7]),.x(out[3]));

endmodule