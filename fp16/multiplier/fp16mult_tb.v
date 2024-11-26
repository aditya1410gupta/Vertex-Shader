module fp16mult_tb;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] y;

    reg clk = 0;
    always #5 clk = ~clk;
    real ar,br,outr;
    fp16mult uut (
        .a  (a),
        .b  (b),
        .x  (y),
        .clk(clk),
        .rst(1'b1)
    );
    function automatic real fp16_to_real(input [15:0] num);
        begin
            fp16_to_real = (num[15] ? -1 : 1) * (1.0 + ($itor(num[9:0]) / $itor(2 ** 10))) *
                $itor(2 ** (num[14:10] - 5'd15));
        end
    endfunction
    initial begin
        $dumpfile("fp16mult_tb.vcd");
        $dumpvars(0, fp16mult_tb);
        $display("A    B     Y");
        // $monitor("%b %b %b", a, b, y);
        assign a = 16'b0100010101100000;    
        assign b = 16'b0000100000100110;
	#3
	assign a = 16'b0100010001100100;    
        assign b = 16'b0000100111100110;
        #50
        $finish;
    end

    always @(a, b, y) begin
        ar   = fp16_to_real(a);
        br   = fp16_to_real(b);
        outr = fp16_to_real(y);
    end

    always @(negedge clk) begin
        $display("%b %b %b", a, b, y);
        if (ar * br == outr) $display("Correct");
    end
endmodule

