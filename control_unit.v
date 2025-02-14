module control_unit (
    input [5:0] opcode,
    output reg [3:0] alu_op,
    output reg reg_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg branch,
    output reg jump
);

    always @(*) begin
        case (opcode)
            6'b000000: begin // R-type instructions
                reg_write = 1;
                alu_src = 0;
                mem_to_reg = 0;
                branch = 0;
                jump = 0;
                alu_op = 4'b0010; // Default ADD
            end
            6'b100011: begin // LW
                reg_write = 1;
                alu_src = 1;
                mem_to_reg = 1;
                branch = 0;
                jump = 0;
                alu_op = 4'b0010; // ADD
            end
            6'b101011: begin // SW
                reg_write = 0;
                alu_src = 1;
                mem_to_reg = 0;
                branch = 0;
                jump = 0;
                alu_op = 4'b0010; // ADD
            end
            6'b000100: begin // BEQ
                reg_write = 0;
                alu_src = 0;
                mem_to_reg = 0;
                branch = 1;
                jump = 0;
                alu_op = 4'b0110; // SUBTRACT
            end
            default: begin
                reg_write = 0;
                alu_src = 0;
                mem_to_reg = 0;
                branch = 0;
                jump = 0;
                alu_op = 4'b0000; // Default NOP
            end
        endcase
    end

endmodule
