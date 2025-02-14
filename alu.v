module alu (
    input [3:0] alu_control,
    input [31:0] input1,
    input [31:0] input2,
    output reg [31:0] alu_result
);

    always @(*) begin
        case (alu_control)
            4'b0000: alu_result = input1 & input2;  // AND
            4'b0001: alu_result = input1 | input2;  // OR
            4'b0010: alu_result = input1 + input2;  // ADD
            4'b0110: alu_result = input1 - input2;  // SUBTRACT
            4'b0111: alu_result = (input1 < input2) ? 1 : 0; // SLT
            default: alu_result = 0;
        endcase
    end

endmodule
