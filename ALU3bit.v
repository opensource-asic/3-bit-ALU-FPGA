
module ALU3bit(
    input  [2:0] ain,
    input  [2:0] bin,
    input  [1:0] fun_sel,
    output [6:0] HEX0,
    output [6:0] HEX1
);


    wire signed [2:0] a_signed = $signed(ain);
    wire signed [2:0] b_signed = $signed(bin);
    wire signed [2:0] result;

    
    alu3 core (
        .ain(a_signed),
        .bin(b_signed),
        .fun_sel(fun_sel),
        .out(result)
    );


    signed_hex_display display (
        .value(result),
        .hex0(HEX0),
        .hex1(HEX1)
    );
endmodule



module alu3(
    input  signed [2:0] ain,
    input  signed [2:0] bin,
    input  [1:0] fun_sel,
    output reg signed [2:0] out
);
    always @(*) begin
        case (fun_sel)
            2'b00: out = ain + bin;  //add
            2'b01: out = ain - bin;  //sub
            2'b10: out = ain ^ bin;  // XOR
            2'b11: out = ain <<< 1;  // left shift
            default: out = 000;
        endcase
    end
endmodule



module signed_hex_display(
    input  signed [2:0] value,
    output reg [6:0] hex0,
    output reg [6:0] hex1
);

    wire [2:0] abs_val = (value < 0) ? -value : value;

    always @(*) begin
        
        if (value < 0)
            hex1 = 7'b0111111; // "-"
        else
            hex1 = 7'b1111111; 

        
        case (abs_val)
            3'd0: hex0 = 7'b1000000; 
            3'd1: hex0 = 7'b1111001; 
            3'd2: hex0 = 7'b0100100; 
            3'd3: hex0 = 7'b0110000; 
            3'd4: hex0 = 7'b0011001; 
            default: hex0 = 7'b1111111; 
        endcase
    end
endmodule
