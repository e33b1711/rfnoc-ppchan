//-----------------------------------------------------------------
// System Generator version 2015.4 Verilog source file.
//
// Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

`include "conv_pkg.v"
`timescale 1 ns / 10 ps
module sysgen_logical_8b7810a2aa (
  input [(1 - 1):0] d0,
  input [(1 - 1):0] d1,
  output [(1 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire d0_1_24;
  wire d1_1_27;
  wire fully_2_1_bit;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign fully_2_1_bit = d0_1_24 | d1_1_27;
  assign y = fully_2_1_bit;
endmodule
`timescale 1 ns / 10 ps
module sysgen_logical_f9d74a72d1 (
  input [(1 - 1):0] d0,
  input [(1 - 1):0] d1,
  output [(1 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire d0_1_24;
  wire d1_1_27;
  wire fully_2_1_bit;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign fully_2_1_bit = d0_1_24 & d1_1_27;
  assign y = fully_2_1_bit;
endmodule
`timescale 1 ns / 10 ps
module sysgen_reinterpret_ad93f43143 (
  input [(16 - 1):0] input_port,
  output [(16 - 1):0] output_port,
  input clk,
  input ce,
  input clr);
  wire [(16 - 1):0] input_port_1_40;
  wire signed [(16 - 1):0] output_port_5_5_force;
  assign input_port_1_40 = input_port;
  assign output_port_5_5_force = input_port_1_40;
  assign output_port = output_port_5_5_force;
endmodule
`timescale 1 ns / 10 ps

module  channelizer_xlslice  (x, y);

//Parameter Definitions
parameter new_msb= 9;
parameter new_lsb= 1;
parameter x_width= 16;
parameter y_width= 8;

//Port Declartions
input [x_width-1:0] x;
output [y_width-1:0] y;

assign y = x[new_msb:new_lsb];

endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_fa8d4b3e6d (
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 1'b1;
endmodule
`timescale 1 ns / 10 ps
module sysgen_inverter_dea83a2b38 (
  input [(1 - 1):0] ip,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire ip_1_26;
  reg op_mem_22_20[0:(1 - 1)];
  initial
    begin
      op_mem_22_20[0] = 1'b0;
    end
  wire op_mem_22_20_front_din;
  wire op_mem_22_20_back;
  wire op_mem_22_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire internal_ip_12_1_bitnot;
  assign ip_1_26 = ip;
  assign op_mem_22_20_back = op_mem_22_20[0];
  always @(posedge clk)
    begin:proc_op_mem_22_20
      integer i;
      if (((ce == 1'b1) && (op_mem_22_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_22_20[0] <= op_mem_22_20_front_din;
        end
    end
  assign internal_ip_12_1_bitnot = ~ip_1_26;
  assign op_mem_22_20_push_front_pop_back_en = 1'b0;
  assign op = internal_ip_12_1_bitnot;
endmodule
`timescale 1 ns / 10 ps
module sysgen_concat_c4ee67c59a (
  input [(16 - 1):0] in0,
  input [(16 - 1):0] in1,
  output [(32 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire [(16 - 1):0] in0_1_23;
  wire [(16 - 1):0] in1_1_27;
  wire [(32 - 1):0] y_2_1_concat;
  assign in0_1_23 = in0;
  assign in1_1_27 = in1;
  assign y_2_1_concat = {in0_1_23, in1_1_27};
  assign y = y_2_1_concat;
endmodule
`timescale 1 ns / 10 ps


module channelizer_xlconvert (din, clk, ce, clr, en, dout);

//Parameter Definitions
   parameter din_width= 16;
   parameter din_bin_pt= 4;
   parameter din_arith= `xlUnsigned;
   parameter dout_width= 8;
   parameter dout_bin_pt= 2;
   parameter dout_arith= `xlUnsigned;
   parameter en_width = 1;
   parameter en_bin_pt = 0;
   parameter en_arith = `xlUnsigned;
   parameter bool_conversion = 0;
   parameter latency = 0;
   parameter quantization= `xlTruncate;
   parameter overflow= `xlWrap;

//Port Declartions
   input [din_width-1:0] din;
   input clk, ce, clr;
   input [en_width-1:0] en;
   output [dout_width-1:0] dout;

//Wire Declartions
   wire [dout_width-1:0]   result;
   wire internal_ce;
   assign internal_ce = ce & en[0];

generate
 if (bool_conversion == 1)
    begin:bool_converion_generate
       assign result = din;
    end
 else
    begin:std_conversion
       convert_type #(din_width,
                      din_bin_pt,
                      din_arith,
		              dout_width,
                      dout_bin_pt,
                      dout_arith,
                      quantization,
                      overflow)
        conv_udp (.inp(din), .res(result));
    end
endgenerate

generate
if (latency > 0)
     begin:latency_test
	synth_reg # (dout_width, latency)
	  reg1 (
	       .i(result),
	       .ce(internal_ce),
	       .clr(clr),
	       .clk(clk),
	       .o(dout));
     end
else
     begin:latency0
	assign dout = result;
     end
endgenerate

endmodule

`timescale 1 ns / 10 ps
module sysgen_reinterpret_af1a0b71e1 (
  input [(16 - 1):0] input_port,
  output [(16 - 1):0] output_port,
  input clk,
  input ce,
  input clr);
  wire signed [(16 - 1):0] input_port_1_40;
  wire [(16 - 1):0] output_port_5_5_force;
  assign input_port_1_40 = input_port;
  assign output_port_5_5_force = input_port_1_40;
  assign output_port = output_port_5_5_force;
endmodule
`timescale 1 ns / 10 ps
module xlpassthrough(din, dout);

//Parameter Definitions
   parameter din_width= 16;
   parameter dout_width= 16;

//Port Declartions
   input [din_width-1:0] din;
   output [dout_width-1:0] dout;

   assign dout = din;
endmodule

`timescale 1 ns / 10 ps
module sysgen_inverter_9a61a206ed (
  input [(1 - 1):0] ip,
  input [(1 - 1):0] en,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire ip_1_26;
  wire en_1_30;
  reg op_mem_22_20[0:(1 - 1)];
  initial
    begin
      op_mem_22_20[0] = 1'b0;
    end
  wire op_mem_22_20_front_din;
  wire op_mem_22_20_back;
  wire op_mem_22_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire internal_ip_12_1_bitnot;
  reg op_mem_shift_join_29_3;
  reg op_mem_shift_join_29_3_en;
  assign ip_1_26 = ip;
  assign en_1_30 = en;
  assign op_mem_22_20_back = op_mem_22_20[0];
  always @(posedge clk)
    begin:proc_op_mem_22_20
      integer i;
      if (((ce == 1'b1) && (op_mem_22_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_22_20[0] <= op_mem_22_20_front_din;
        end
    end
  assign internal_ip_12_1_bitnot = ~ip_1_26;
  always @(en_1_30 or internal_ip_12_1_bitnot)
    begin:proc_if_29_3
      if (en_1_30)
        begin
          op_mem_shift_join_29_3_en = 1'b1;
        end
      else 
        begin
          op_mem_shift_join_29_3_en = 1'b0;
        end
      op_mem_shift_join_29_3 = internal_ip_12_1_bitnot;
    end
  assign op_mem_22_20_front_din = op_mem_shift_join_29_3;
  assign op_mem_22_20_push_front_pop_back_en = op_mem_shift_join_29_3_en;
  assign op = op_mem_22_20_back;
endmodule
`timescale 1 ns / 10 ps
module sysgen_logical_20edb24841 (
  input [(1 - 1):0] d0,
  input [(1 - 1):0] d1,
  input [(1 - 1):0] d2,
  output [(1 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire d0_1_24;
  wire d1_1_27;
  wire d2_1_30;
  wire fully_2_1_bit;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign d2_1_30 = d2;
  assign fully_2_1_bit = d0_1_24 & d1_1_27 & d2_1_30;
  assign y = fully_2_1_bit;
endmodule
`timescale 1 ns / 10 ps
module sysgen_mux_c5d8f79c53 (
  input [(1 - 1):0] sel,
  input [(32 - 1):0] d0,
  input [(32 - 1):0] d1,
  output [(32 - 1):0] y,
  input clk,
  input ce,
  input clr);
  wire sel_1_20;
  wire [(32 - 1):0] d0_1_24;
  wire [(32 - 1):0] d1_1_27;
  wire [(1 - 1):0] sel_internal_2_1_convert;
  reg [(32 - 1):0] unregy_join_6_1;
  assign sel_1_20 = sel;
  assign d0_1_24 = d0;
  assign d1_1_27 = d1;
  assign sel_internal_2_1_convert = {sel_1_20};
  always @(d0_1_24 or d1_1_27 or sel_internal_2_1_convert)
    begin:proc_switch_6_1
      case (sel_internal_2_1_convert)
        1'b0 :
          begin
            unregy_join_6_1 = d0_1_24;
          end
        default:
          begin
            unregy_join_6_1 = d1_1_27;
          end
      endcase
    end
  assign y = unregy_join_6_1;
endmodule
`timescale 1 ns / 10 ps
module channelizer_xldelay #(parameter width = -1, latency = -1, reg_retiming = 0, reset = 0)
  (input [width-1:0] d,
   input ce, clk, en, rst,
   output [width-1:0] q);

generate
  if ((latency == 0) || ((reg_retiming == 0) && (reset == 0)))
  begin:srl_delay
    synth_reg # (width, latency)
      reg1 (
        .i(d),
        .ce(ce & en),
        .clr(1'b0),
        .clk(clk),
        .o(q));
  end

  if ((latency>=1) && ((reg_retiming) || (reset)))
  begin:reg_delay
    synth_reg_reg # (width, latency)
      reg2 (
        .i(d),
        .ce(ce & en),
        .clr(rst),
        .clk(clk),
        .o(q));
  end
endgenerate
endmodule
`timescale 1 ns / 10 ps
module sysgen_reinterpret_4bd3487388 (
  input [(34 - 1):0] input_port,
  output [(34 - 1):0] output_port,
  input clk,
  input ce,
  input clr);
  wire signed [(34 - 1):0] input_port_1_40;
  wire [(34 - 1):0] output_port_5_5_force;
  assign input_port_1_40 = input_port;
  assign output_port_5_5_force = input_port_1_40;
  assign output_port = output_port_5_5_force;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_471810e732 (
  output [(7 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 7'b1111111;
endmodule
`timescale 1 ns / 10 ps
module sysgen_delay_52cccd8896 (
  input [(1 - 1):0] d,
  input [(1 - 1):0] en,
  input [(1 - 1):0] rst,
  output [(1 - 1):0] q,
  input clk,
  input ce,
  input clr);
  wire d_1_22;
  wire en_1_25;
  wire rst_1_29;
  wire op_mem_0_8_24_next;
  reg op_mem_0_8_24 = 1'b0;
  wire op_mem_0_8_24_rst;
  wire op_mem_0_8_24_en;
  localparam [(1 - 1):0] const_value = 1'b1;
  reg op_mem_0_join_10_5;
  reg op_mem_0_join_10_5_en;
  reg op_mem_0_join_10_5_rst;
  assign d_1_22 = d;
  assign en_1_25 = en;
  assign rst_1_29 = rst;
  always @(posedge clk)
    begin:proc_op_mem_0_8_24
      if (((ce == 1'b1) && (op_mem_0_8_24_rst == 1'b1)))
        begin
          op_mem_0_8_24 <= 1'b0;
        end
      else if (((ce == 1'b1) && (op_mem_0_8_24_en == 1'b1)))
        begin
          op_mem_0_8_24 <= op_mem_0_8_24_next;
        end
    end
  always @(d_1_22 or en_1_25 or rst_1_29)
    begin:proc_if_10_5
      if (rst_1_29)
        begin
          op_mem_0_join_10_5_rst = 1'b1;
        end
      else if (en_1_25)
        begin
          op_mem_0_join_10_5_rst = 1'b0;
        end
      else 
        begin
          op_mem_0_join_10_5_rst = 1'b0;
        end
      if (en_1_25)
        begin
          op_mem_0_join_10_5_en = 1'b1;
        end
      else 
        begin
          op_mem_0_join_10_5_en = 1'b0;
        end
      op_mem_0_join_10_5 = d_1_22;
    end
  assign op_mem_0_8_24_next = d_1_22;
  assign op_mem_0_8_24_rst = op_mem_0_join_10_5_rst;
  assign op_mem_0_8_24_en = op_mem_0_join_10_5_en;
  assign q = op_mem_0_8_24;
endmodule
`timescale 1 ns / 10 ps
module sysgen_relational_61af23dbad (
  input [(7 - 1):0] a,
  input [(7 - 1):0] b,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(7 - 1):0] a_1_31;
  wire [(7 - 1):0] b_1_34;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire result_12_3_rel;
  assign a_1_31 = a;
  assign b_1_34 = b;
  assign result_12_3_rel = a_1_31 == b_1_34;
  assign op = result_12_3_rel;
endmodule
`timescale 1 ns / 10 ps
module sysgen_relational_fc1426e2d9 (
  input [(8 - 1):0] a,
  input [(8 - 1):0] b,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(8 - 1):0] a_1_31;
  wire [(8 - 1):0] b_1_34;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire result_12_3_rel;
  assign a_1_31 = a;
  assign b_1_34 = b;
  assign result_12_3_rel = a_1_31 == b_1_34;
  assign op = result_12_3_rel;
endmodule
`timescale 1 ns / 10 ps
module sysgen_relational_9133ff9c4b (
  input [(2 - 1):0] a,
  input [(2 - 1):0] b,
  output [(1 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire [(2 - 1):0] a_1_31;
  wire [(2 - 1):0] b_1_34;
  localparam [(1 - 1):0] const_value = 1'b1;
  wire result_12_3_rel;
  assign a_1_31 = a;
  assign b_1_34 = b;
  assign result_12_3_rel = a_1_31 == b_1_34;
  assign op = result_12_3_rel;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_07b701207a (
  output [(8 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 8'b11001000;
endmodule
`timescale 1 ns / 10 ps
module sysgen_constant_118900d9b9 (
  output [(2 - 1):0] op,
  input clk,
  input ce,
  input clr);
  assign op = 2'b11;
endmodule
module channelizer_xlcounter_free  (ce, clr, clk, op, up, load, din, en, rst);
 
 parameter core_name0= "";
 parameter op_width= 5;
 parameter op_arith= `xlSigned;
 
 input ce, clr, clk;
 input up, load;
 input [op_width-1:0] din;
 input en, rst;
 output [op_width-1:0] op;
 
 parameter [(8*op_width)-1:0] oneStr = { op_width{"1"}}; 
 
 wire  core_sinit;
 wire  core_ce;
 wire [op_width-1:0] op_net;
 
    assign core_ce = ce & en;
    assign core_sinit = (clr | rst) & ce;
    assign op = op_net;
 
 generate



if (core_name0 == "channelizer_c_counter_binary_v12_0_i0") 
     begin:comp0
channelizer_c_counter_binary_v12_0_i0 core_instance0 ( 
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net) 
       ); 
     end 

if (core_name0 == "channelizer_c_counter_binary_v12_0_i1") 
     begin:comp1
channelizer_c_counter_binary_v12_0_i1 core_instance1 ( 
        .CLK(clk),
        .CE(core_ce),
        .SINIT(core_sinit),
        .Q(op_net) 
       ); 
     end 

endgenerate 
 endmodule

`timescale 1 ns / 10 ps
module  xlfast_fourier_transform_3eb527a91efd8e0d74be600ebe174c57 (ce,clk,event_data_in_channel_halt,event_data_out_channel_halt,event_frame_started,event_status_channel_halt,event_tlast_missing,event_tlast_unexpected,m_axis_data_tdata_xn_im_0,m_axis_data_tdata_xn_re_0,m_axis_data_tlast,m_axis_data_tready,m_axis_data_tvalid,rst,s_axis_config_tdata_fwd_inv,s_axis_config_tready,s_axis_config_tvalid,s_axis_data_tdata_xn_im_0,s_axis_data_tdata_xn_re_0,s_axis_data_tlast,s_axis_data_tready,s_axis_data_tvalid);

input ce;
input clk;
output event_data_in_channel_halt;
output event_data_out_channel_halt;
output event_frame_started;
output event_status_channel_halt;
output event_tlast_missing;
output event_tlast_unexpected;
output[23:0] m_axis_data_tdata_xn_im_0;
output[23:0] m_axis_data_tdata_xn_re_0;
output m_axis_data_tlast;
input m_axis_data_tready;
output m_axis_data_tvalid;
input rst;
input[0:0] s_axis_config_tdata_fwd_inv;
output s_axis_config_tready;
input s_axis_config_tvalid;
input[15:0] s_axis_data_tdata_xn_im_0;
input[15:0] s_axis_data_tdata_xn_re_0;
input s_axis_data_tlast;
output s_axis_data_tready;
input s_axis_data_tvalid;
wire aresetn_net;
wire[47:0] m_axis_data_tdata_net;
wire[7:0] s_axis_config_tdata_net;
wire[31:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_xn_im_0 = m_axis_data_tdata_net[47 : 24];
  assign m_axis_data_tdata_xn_re_0 = m_axis_data_tdata_net[23 : 0];
  assign s_axis_config_tdata_net[7 : 1] = 7'b0;
  assign s_axis_config_tdata_net[0 : 0] = s_axis_config_tdata_fwd_inv;
  assign s_axis_data_tdata_net[31 : 16] = s_axis_data_tdata_xn_im_0;
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_xn_re_0;
  channelizer_xfft_v9_0_i0 channelizer_xfft_v9_0_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .event_data_in_channel_halt(event_data_in_channel_halt),
      .event_data_out_channel_halt(event_data_out_channel_halt),
      .event_frame_started(event_frame_started),
      .event_status_channel_halt(event_status_channel_halt),
      .event_tlast_missing(event_tlast_missing),
      .event_tlast_unexpected(event_tlast_unexpected),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tlast(m_axis_data_tlast),
      .m_axis_data_tready(m_axis_data_tready),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_config_tdata(s_axis_config_tdata_net),
      .s_axis_config_tready(s_axis_config_tready),
      .s_axis_config_tvalid(s_axis_config_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tlast(s_axis_data_tlast),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_52b7c57832347085ca61d3be319bb07e (ce,clk,event_s_config_tlast_missing,event_s_config_tlast_unexpected,m_axis_data_tdata_path0,m_axis_data_tdata_path1,m_axis_data_tlast,m_axis_data_tready,m_axis_data_tvalid,rst,s_axis_config_tdata_fsel,s_axis_config_tlast,s_axis_config_tready,s_axis_config_tvalid,s_axis_data_tdata_path0,s_axis_data_tdata_path1,s_axis_data_tlast,s_axis_data_tready,s_axis_data_tvalid,src_ce,src_clk);

input ce;
input clk;
output event_s_config_tlast_missing;
output event_s_config_tlast_unexpected;
output[33:0] m_axis_data_tdata_path0;
output[33:0] m_axis_data_tdata_path1;
output m_axis_data_tlast;
input m_axis_data_tready;
output m_axis_data_tvalid;
input rst;
input[6:0] s_axis_config_tdata_fsel;
input s_axis_config_tlast;
output s_axis_config_tready;
input s_axis_config_tvalid;
input[17:0] s_axis_data_tdata_path0;
input[17:0] s_axis_data_tdata_path1;
input s_axis_data_tlast;
output s_axis_data_tready;
input s_axis_data_tvalid;
input src_ce;
input src_clk;
wire aresetn_net;
wire[79:0] m_axis_data_tdata_net;
wire[7:0] s_axis_config_tdata_net;
wire[47:0] s_axis_data_tdata_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_path1 = m_axis_data_tdata_net[73 : 40];
  assign m_axis_data_tdata_path0 = m_axis_data_tdata_net[33 : 0];
  assign s_axis_config_tdata_net[7 : 7] = 1'b0;
  assign s_axis_config_tdata_net[6 : 0] = s_axis_config_tdata_fsel;
  assign s_axis_data_tdata_net[47 : 42] = 6'b0;
  assign s_axis_data_tdata_net[41 : 24] = s_axis_data_tdata_path1;
  assign s_axis_data_tdata_net[23 : 18] = 6'b0;
  assign s_axis_data_tdata_net[17 : 0] = s_axis_data_tdata_path0;
  channelizer_fir_compiler_v7_2_i0 channelizer_fir_compiler_v7_2_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .event_s_config_tlast_missing(event_s_config_tlast_missing),
      .event_s_config_tlast_unexpected(event_s_config_tlast_unexpected),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tlast(m_axis_data_tlast),
      .m_axis_data_tready(m_axis_data_tready),
      .m_axis_data_tvalid(m_axis_data_tvalid),
      .s_axis_config_tdata(s_axis_config_tdata_net),
      .s_axis_config_tlast(s_axis_config_tlast),
      .s_axis_config_tready(s_axis_config_tready),
      .s_axis_config_tvalid(s_axis_config_tvalid),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tlast(s_axis_data_tlast),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(s_axis_data_tvalid)
    );

 endmodule



