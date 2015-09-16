// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1ns/1ps

module rand_top_uitofp_32ns_32_6
#(parameter
    ID         = 29,
    NUM_STAGE  = 6,
    din0_WIDTH = 32,
    dout_WIDTH = 32
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [63:0]           a_tdata;
wire                  r_tvalid;
wire [31:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
//------------------------Instantiation------------------
rand_top_ap_uitofp_4_no_dsp_32 rand_top_ap_uitofp_4_no_dsp_32_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1==='bx ? 'b0 : {{(64-din0_WIDTH){1'b0}}, din0_buf1};
assign dout     = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
    end
end

endmodule
