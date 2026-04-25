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
    $monitor("TIME=%0t RESET=%b OUT=%d", $time, rst, out);
end

endmodule