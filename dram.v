module DRAM (input clk,
             input write_en,
             input [15:0] addr,
             input [15:0] data_in,
             output reg [15:0] data_out);
    
    reg [15:0] ram [1024:0];
    
    initial begin
        // ram[0]  = 16'd8;
        // ram[1]  = 16'd3;
        // ram[2]  = 16'd2;
        // ram[3]  = 16'd4;
        // ram[4]  = 16'd8;
        // ram[5]  = 16'd14;
        // ram[6]  = 16'd22;
        // ram[7]  = 16'd34;
        // ram[8]  = 16'd2;
        // ram[9]  = 16'd5;
        // ram[10] = 16'd7;
        // ram[11] = 16'd1;
        // ram[12] = 16'd5;
        // ram[13] = 16'd4;
        // ram[14] = 16'd3;
        // ram[15] = 16'd1;
        // ram[16] = 16'd2;
        // ram[17] = 16'd6;
        // ram[18] = 16'd5;
        // ram[19] = 16'd3;
        // ram[20] = 16'd2;
        // ram[21] = 16'd1;
    end
    
    integer i;
    
    always @(posedge clk) begin
        if (write_en == 1)
            ram[addr] <= data_in;
        else
            data_out <= ram[addr];
    end
    
endmodule
