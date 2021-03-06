// Generated by vp3

// Future cases to support and test:
//  * override parameter in instantiation
//  * generated instantiations
//  * specify WIDTH instead of 8 in @Vector

//|@Module -v2k;
module paramports (
      input wire [31:0] in
    , output wire [31:0] out
    , input wire  sel
);

    parameter WIDTH = 8;

    //|@Instance sub sub0 -connect (in|out) $1\[0*WIDTH+:WIDTH];
    sub sub0 (
     .sel(sel)
    ,.in(in[0*WIDTH+:WIDTH])
    ,.out(out[0*WIDTH+:WIDTH])
    );
    //|@Instance sub sub1 -connect (in|out) $1\[1*WIDTH+:WIDTH];
    sub sub1 (
     .sel(sel)
    ,.in(in[1*WIDTH+:WIDTH])
    ,.out(out[1*WIDTH+:WIDTH])
    );
    //|@Instance sub sub2 -connect (in|out) $1\[2*WIDTH+:WIDTH];
    sub sub2 (
     .sel(sel)
    ,.in(in[2*WIDTH+:WIDTH])
    ,.out(out[2*WIDTH+:WIDTH])
    );
    //|@Instance sub sub3 -connect (in|out) $1\[3*WIDTH+:WIDTH];
    sub sub3 (
     .sel(sel)
    ,.in(in[3*WIDTH+:WIDTH])
    ,.out(out[3*WIDTH+:WIDTH])
    );

endmodule

module sub #(parameter WIDTH = 8) (
      input                 sel
    , input  [WIDTH-1:0]    in
    , output [WIDTH-1:0]    out
);

    //|@Regs;
    //|@Wires;
    wire [7:0] tmp;

    //|@Vector 8 tmp;

    assign tmp = in + 1;
    assign out = sel ? in : tmp;

endmodule
