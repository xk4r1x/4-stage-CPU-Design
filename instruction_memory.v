module instruction_memory (
    input [31:0] pc,
    output reg [31:0] instruction
);

    reg [31:0] memory [0:31];

    initial begin
        // Load some instructions (Example: R-type ADD, LW, SW)
        memory[0] = 32'b000000_00001_00010_00011_00000_100000; // ADD $3, $1, $2
        memory[1] = 32'b100011_00001_00010_00000_00000_000100; // LW $2, 4($1)
        memory[2] = 32'b101011_00001_00010_00000_00000_000100; // SW $2, 4($1)
        memory[3] = 32'b000100_00001_00010_00000_00000_000011; // BEQ $1, $2, skip
    end

    always @(*) begin
        instruction = memory[pc >> 2];
    end

endmodule
