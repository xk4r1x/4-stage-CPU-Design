module cpu (
    input clk,
    input reset
);

    wire [31:0] instruction, pc_next, pc;
    wire [31:0] reg_data1, reg_data2, alu_result;
    wire [31:0] sign_ext_imm, write_data;
    wire [4:0] rs, rt, rd;
    wire [3:0] alu_control;
    wire reg_write, alu_src, mem_to_reg, branch, jump;

    // Program Counter
    pc PC (
        .clk(clk),
        .reset(reset),
        .pc_next(pc_next),
        .pc(pc)
    );

    // Instruction Memory
    instruction_memory IM (
        .pc(pc),
        .instruction(instruction)
    );

    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];

    // Register File
    register_file RF (
        .clk(clk),
        .reg_write(reg_write),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .write_data(write_data),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2)
    );

    // ALU Control Unit
    control_unit CU (
        .opcode(instruction[31:26]),
        .alu_op(alu_control),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .jump(jump)
    );

    // ALU
    alu ALU (
        .alu_control(alu_control),
        .input1(reg_data1),
        .input2(alu_src ? sign_ext_imm : reg_data2),
        .alu_result(alu_result)
    );

    assign pc_next = pc + 4; // Simple PC increment (no branching yet)

endmodule
