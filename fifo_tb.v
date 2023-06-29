module tb;
reg clk,rst,read,write;
reg [7:0]d_in;
wire [7:0]d_out;
wire full,empty;
wire [3:0]count;

fifo_synchronous dut(d_out,full,empty,count,d_in,write,read,clk,rst);

//------clk-----//
initial
 clk =0;
always #10 clk=~clk;

 //----- reset ---//
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

//------ memory operations ----//
initial
 begin
  repeat(30)
  begin
  d_in=$random;
  write=$random;
  read=$random;
  #20;
  $display(" in= %d, read= %b, write= %b, out= %d , count = %d, full=%d, empty =%d",
             d_in,read,write,d_out,count,full,empty);
  end
 end

endmodule
