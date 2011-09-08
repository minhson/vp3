// Generated by vp3

//|@Module -v2k;
module connect (
      output wire  s1_scalar
    , output wire [15:0] s1_vector
    , input wire  scalar_i
    , output wire  scalar_o
    , input wire [15:0] vec_s0_i
    , output wire [15:0] vec_s0_o
);

//|@Wires;

// 1. regex connect to modify a prefix

//|@Instance submod s0
//|    -connect /^vector_/ vec_s0_
//|;
submod s0 (
 .scalar_i(scalar_i)
,.scalar_o(scalar_o)
,.vector_i(vec_s0_i[15:0])
,.vector_o(vec_s0_o[15:0])
);

// 1. connection to a constant value
// 2. regex connect with capture group

//|@Instance submod s1
//|    -connect vector_i 16'h1234
//|    -connect scalar_i 1'b1
//|    -connect (.*)_o s1_${1}
//|;
submod s1 (
 .scalar_i(1'b1)
,.scalar_o(s1_scalar)
,.vector_i(16'h1234)
,.vector_o(s1_vector[15:0])
);

endmodule

// vim: sts=4 sw=4 et
