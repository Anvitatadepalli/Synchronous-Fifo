module fifo_8bit( d_out,
                  full,
                  empty,
		  count,
		  d_in,
		  write,
		  read,
		  clk,
		  rst);
				 
input clk,rst,read,write;
input [7:0]d_in;
output reg [7:0]d_out;
output full,empty;
output reg [3:0]count;

reg [7:0]memory[7:0];
reg [2:0]read_ptr,write_ptr;

assign full= (count==8);
assign empty=(count==0);

//--------  count  ---------//
always @(posedge clk or negedge rst)
begin
if (~rst) count=0;
else
 begin
 case({read,write})
  
  2'b00: count<=count;
  2'b01: count<=(count==8)?8:count+1;
  2'b10: count<=(count==0)?0:count-1;
  2'b11: count<=count;
  default: count<=count;
  
 endcase
 end
end

//------------  write  -----------//
always @(posedge clk or negedge rst)
begin
if(write && !full)
 memory[write_ptr]<=d_in;
else if (read && write)
 memory[write_ptr]<=d_in;
end

//-----------  read  -------------//
always @(posedge clk or negedge rst)
begin
if(read && !empty)
 d_out<=memory[read_ptr];
else if(read && write)
 d_out<=memory[read_ptr];
end

//---------  write_pointer  --------//
always @(posedge clk or negedge rst)
begin
if(~rst) write_ptr<=0;
else
 write_ptr<=((write && !full)||(read && write))? write_ptr+1 : write_ptr;
end

//--------  read_pointer  ----------//
always @(posedge clk or negedge rst)
begin
if(~rst) read_ptr<=0;
else
 read_ptr<=((read && !empty)||(read && write))? read_ptr+1 : read_ptr;
end

endmodule
