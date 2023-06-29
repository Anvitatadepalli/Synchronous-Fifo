module tb;
reg clk,rst,read,write;
reg [7:0]d_in;
wire [7:0]d_out;
wire full,empty;
wire [3:0]count;

fifo_8bit dut(d_out,full,empty,count,d_in,write,read,clk,rst);

initial
 clk =0;
always #10 clk=~clk;

initial
begin
rst=1;
 @(posedge clk) rst=0;
 @(posedge clk) rst=1;
end

initial
 begin
 #10000;
 $finish;
 end

initial
 begin
  repeat(30)
  begin
  d_in=$random;
  write=1;
  read=$random;
  #20;
  $display(" in= %d, read= %b, write= %b, out= %d , count = %d, full=%d ",
             d_in,read,write,d_out,count,full);
  end
 end

endmodule