module register_file (
    input clk,
    input reg_write,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] write_data,
    output reg [31:0] reg_data1,
    output reg [31:0] reg_data2
);

    reg [31:0] registers [31:0];

    always @(posedge clk) begin
        if (reg_write)
            registers[rd] <= write_data;
    end

    always @(*) begin
        reg_data1 = registers[rs];
        reg_data2 = registers[rt];
    end

endmodule
