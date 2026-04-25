module tb_counter;

reg clk;
reg rst;
wire [3:0] out;

counter uut (
    .clk(clk),
    .rst(rst),
    .out(out)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;

    #100;
    $finish;
end

initial
begin
    $monitor("TIME=%0t CLK=%b RESET=%b OUT=%d", $time, clk, rst, out);
end

initial
begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb_counter);
end

endmodule