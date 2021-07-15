`include "definitions.v"

module DRAM (input clk,
             input [`NUM_C:0] write_en,
             input [((`NUM_C+1)*16)-1:0] addr, 
             input [((`NUM_C+1)*16)-1:0] data_in,
             output reg [((`NUM_C+1)*16)-1:0] data_out);
    
    reg [15:0] ram [1024:0];
    
    initial begin
        ram[0]  = 16'd1;                // # of cores

        ram[3]  = 16'b0000000000010111; // 23
        ram[2]  = 16'b0000000000000011; // 3
        // XOR  = 16'b0000000000010100; // 20
        
        ram[7]  = 16'b0000100010010111; // 2199
        ram[6]  = 16'b0000000000000101; // 5
        // XOR  = 16'b0000100010010010; // 2194
    end
    
    integer i;
    
    always @(posedge clk) begin
        for (i = 0; i < `NUM_C + 1; i = i + 1) begin
            if (write_en[i] == 1)
                ram[addr[i*16 +:16]] <= data_in[i*16 +:16];
            else
                data_out[i*16 +:16] <= ram[addr[i*16 +:16]];
        end
    end
    
endmodule
