// Generated by vp3

//|@Module -v2k;
module ranges (
      output wire [16:0] s1_hiconn_toobig_explicit
    , input wire [16:0] s1_hiconn_toobig_implicit
    , output wire [14:0] s2_hiconn_toosmall_explicit
    , input wire [15:0] s2_hiconn_toosmall_implicit
    , input wire [31:0] s3_vector_i
    , output wire [15:0] s3_vector_o
);

//|@Wires;
wire [31:0] s0_hiconn_slice;

//|@Instance subA s0
//|    -connect vector_i s0_hiconn_slice[31:16]
//|    -connect vector_o s0_hiconn_slice[15:0]
//|;
subA s0 (
 .vector_i(s0_hiconn_slice[31:16])
,.vector_o(s0_hiconn_slice[15:0])
);

//

//|@Vector 17 s1_hiconn_toobig_implicit;

//|@Instance subA s1
//|    // no warning, but maybe should be
//|    -connect vector_i s1_hiconn_toobig_implicit
//|    // warning
//|    -connect vector_o s1_hiconn_toobig_explicit[16:0]
//|;
subA s1 (
 .vector_i(s1_hiconn_toobig_implicit[15:0])
,.vector_o(s1_hiconn_toobig_explicit[16:0])
);

//

//|@Vector 15 s2_hiconn_toosmall_implicit;

//|@Instance subA s2
//|    // no warning, but maybe should be
//|    -connect vector_i s2_hiconn_toosmall_implicit
//|    // warning
//|    -connect vector_o s2_hiconn_toosmall_explicit[14:0]
//|;
subA s2 (
 .vector_i(s2_hiconn_toosmall_implicit[15:0])
,.vector_o(s2_hiconn_toosmall_explicit[14:0])
);

//

//|@Instance subB s3
//|    -connect vector_i s3_vector_i
//|    -connect vector_o s3_vector_o
//|;
subB s3 (
 .vector_i(s3_vector_i[31:0])
,.vector_o(s3_vector_o[15:0])
);

endmodule

//|@Module -v2k subA;
module subA (
      input wire [15:0] vector_i
    , output wire [15:0] vector_o
);

//|@Vector 16 vector_i;
//|@Vector 16 vector_o;

assign vector_o = vector_i;

endmodule

module subB (
    input [2*16-1:0] vector_i,
    output [15:0] vector_o
);
    
assign vector_o = vector_i[0+:16] ^ vector_i[16+:16];

endmodule
