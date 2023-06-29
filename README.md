# Synchronous-Fifo

A Synchronous FIFO is a First-In-First-Out queue in which there is a single clock pulse for both data write and data read. In Synchronous FIFO the read and write operations are performed at the same rate. Basically Synchronous FIFO are used for High speed systems because of their high operating speed. Synchronous FIFO are easier to handle at high speed because they use free running clocks whereas in case of Asynchronous FIFO they uses two different clocks for read and write. Synchronous FIFO is more complex then the Asynchronous FIFO.

# Operations in the synchronous FIFO:

-->Write Operation: The operation involves in writing or storing the data in to the FIFO memory till it rises any flag conditions for not to write anymore.
To perform a write operation the data to be written is given at DIN port and write EN is to be set high then at the next rising edge the data will be written.

-->Read Operation: Read operation performed when we want to get data out from the FIFO memory until it informs there is no more data to be read from the memory, the condition called empty condition. Empty conditions are generated using empty flags.
To perform read operation we need to set read EN high then at next rising edge the data to be read will be at DOUT
 
# Pointers to control operations:

-->Write Pointer: This pointer controls the write operation of the FIFO. It used to points to the FIFO memory location where the data will be written.

-->Read Operation: The read operation is controlled by the read pointer. It will be pointing the location from where next data is to be read.

# Flags in FIFO:

Synchronous FIFO provides us with few flags, to determine the status or to interrupt the operation of FIFO.
  
-->EMPTY flag: This flags is useful to avoid the case of the invalid request of read operation when the FIFO is already empty.

-->FULL flag: This flags is useful to avoid the case of the invalid request of write operation when the FIFO is already full.

Here we use a variable named count, which will count the total number of words in the FIFO. On the basis of value of count the flag logic will assign values to flags. If the count reaches a value equal to the size of FIFO it will assign FULL flag as logic high and if the count becomes zero it will assign EMPTY flag as logic high.

# Block diagram
![image](https://github.com/Anvitatadepalli/Synchronous-Fifo/assets/98482161/71a4f2ed-9c7b-4d05-9ace-48303bca76a6)

the code provides a verilog implementation of a synchronous FIFO memory in behavioural style using various sequential and combinational blocks.
