module fp16mult (
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] x
);

    wire [4:0] expa, expb,expc;
    wire [10:0] mula,mulb;
    reg sign,signmid,signmid1;
    wire [21:0] sum;
    wire inc;
    reg [4:0] exp,expmid,expmid1;
    wire [9:0] summid;
    reg [9:0] rounded;

    assign expa=a[14:10];
    assign expb=b[14:10];
    
    //Stage 1
    always @(negedge clk) begin
	signmid1<=a[15]|b[15];
	expmid1<=expa+expb;
    end
    //Stage 2
    assign mula[10]=1;
    assign mulb[10]=1;
    assign mula[9:0]=a[9:0];
    assign mulb[9:0]=b[9:0];
    wallace_tree w1(.clk(clk),.a(mula),.b(mulb),.out(sum)); //Wallace Tree has both Stage 1 and 2 for multiplier path
    rounding round (
        .num  (sum),
        .round(summid),
        .shift(inc)
    );
    always @(posedge clk) begin
	signmid<=signmid1;
	expmid<=expmid1+5'b10001;
    end

    // Stage 3
    always @(negedge clk) begin
	sign<=signmid;
	exp<=expmid+inc;
	rounded<=summid;
	end
    
    //Final Stage
    always @(posedge clk, negedge rst) begin
        if (~rst) begin
            x <= 16'b0;
        end else if (!(|expa) | !(|expb)) begin
            // subnormal numbers are clamped to zero
            x[15] <= sign;
            x[14:10] <= 5'b00000;
            x[9:0] <= 10'b0;
        end else if (&expa | &expb) begin
            // infinity and NaN are clamped to infinity
            x[15] <= sign;
            x[14:10] <= 5'b11111;
            x[9:0] <= 10'b0;
        end else begin
            x[15] <= sign;
            x[14:10] <= exp;
            x[9:0] <= rounded;
        end
    end
endmodule