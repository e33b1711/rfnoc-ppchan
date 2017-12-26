`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/fft1/Subsystem
module channelizer_subsystem_x22 (
  input [32-1:0] in1,
  output [16-1:0] imag,
  output [16-1:0] real_x0
);
  wire [16-1:0] reinterpret1_output_port_net;
  wire [16-1:0] reinterpret_output_port_net;
  wire [32-1:0] mux_y_net;
  wire [16-1:0] slice_y_net;
  wire [16-1:0] slice1_y_net;
  assign imag = reinterpret1_output_port_net;
  assign real_x0 = reinterpret_output_port_net;
  assign mux_y_net = in1;
  sysgen_reinterpret_ad93f43143 reinterpret (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice_y_net),
    .output_port(reinterpret_output_port_net)
  );
  sysgen_reinterpret_ad93f43143 reinterpret1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(slice1_y_net),
    .output_port(reinterpret1_output_port_net)
  );
  channelizer_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  slice (
    .x(mux_y_net),
    .y(slice_y_net)
  );
  channelizer_xlslice #(
    .new_lsb(16),
    .new_msb(31),
    .x_width(32),
    .y_width(16)
  )
  slice1 (
    .x(mux_y_net),
    .y(slice1_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/fft1/Subsystem1
module channelizer_subsystem1_x23 (
  input [24-1:0] imag,
  input [24-1:0] real_x0,
  input clk_1,
  input ce_1,
  output [32-1:0] out1
);
  wire [32-1:0] concat_y_net;
  wire [24-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net;
  wire [24-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net;
  wire clk_net;
  wire ce_net;
  wire [16-1:0] convert2_dout_net;
  wire [16-1:0] reinterpret2_output_port_net;
  wire [16-1:0] reinterpret1_output_port_net;
  wire [16-1:0] convert_dout_net;
  assign out1 = concat_y_net;
  assign ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net = imag;
  assign ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net = real_x0;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_concat_c4ee67c59a concat (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .in0(reinterpret2_output_port_net),
    .in1(reinterpret1_output_port_net),
    .y(concat_y_net)
  );
  channelizer_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(15),
    .din_width(24),
    .dout_arith(2),
    .dout_bin_pt(13),
    .dout_width(16),
    .latency(0),
    .overflow(`xlSaturate),
    .quantization(`xlTruncate)
  )
  convert (
    .clr(1'b0),
    .en(1'b1),
    .din(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net),
    .clk(clk_net),
    .ce(ce_net),
    .dout(convert_dout_net)
  );
  channelizer_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(15),
    .din_width(24),
    .dout_arith(2),
    .dout_bin_pt(13),
    .dout_width(16),
    .latency(0),
    .overflow(`xlSaturate),
    .quantization(`xlTruncate)
  )
  convert2 (
    .clr(1'b0),
    .en(1'b1),
    .din(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net),
    .clk(clk_net),
    .ce(ce_net),
    .dout(convert2_dout_net)
  );
  sysgen_reinterpret_af1a0b71e1 reinterpret1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(convert2_dout_net),
    .output_port(reinterpret1_output_port_net)
  );
  sysgen_reinterpret_af1a0b71e1 reinterpret2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(convert_dout_net),
    .output_port(reinterpret2_output_port_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/fft1
module channelizer_fft1 (
  input [1-1:0] ready_out,
  input valid_in,
  input [32-1:0] data_in,
  input last_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output ready_in,
  output valid_out,
  output [32-1:0] data_out,
  output last_out
);
  wire ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  wire [1-1:0] ready_out_net;
  wire fir_compiler_7_2_1_m_axis_data_tvalid_net;
  wire [32-1:0] mux_y_net;
  wire fir_compiler_7_2_1_m_axis_data_tlast_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [16-1:0] reinterpret1_output_port_net;
  wire [16-1:0] reinterpret_output_port_net;
  wire [24-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net;
  wire [24-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net;
  wire [1-1:0] ifft_op_net;
  wire ifft_fast_fourier_transform_8_1_s_axis_config_tready_net;
  wire ifft_fast_fourier_transform_8_1_event_frame_started_net;
  wire ifft_fast_fourier_transform_8_1_event_tlast_unexpected_net;
  wire ifft_fast_fourier_transform_8_1_event_tlast_missing_net;
  wire ifft_fast_fourier_transform_8_1_event_data_in_channel_halt_net;
  wire ifft_fast_fourier_transform_8_1_event_status_channel_halt_net;
  wire ifft_fast_fourier_transform_8_1_event_data_out_channel_halt_net;
  wire inverter_op_net;
  assign ready_in = ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  assign valid_out = ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  assign data_out = concat_y_net;
  assign last_out = ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  assign ready_out_net = ready_out;
  assign fir_compiler_7_2_1_m_axis_data_tvalid_net = valid_in;
  assign mux_y_net = data_in;
  assign fir_compiler_7_2_1_m_axis_data_tlast_net = last_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x22 subsystem_x4 (
    .in1(mux_y_net),
    .imag(reinterpret1_output_port_net),
    .real_x0(reinterpret_output_port_net)
  );
  channelizer_subsystem1_x23 subsystem1 (
    .imag(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net),
    .real_x0(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(concat_y_net)
  );
  sysgen_constant_fa8d4b3e6d ifft (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(ifft_op_net)
  );
  xlfast_fourier_transform_3eb527a91efd8e0d74be600ebe174c57 ifft_fast_fourier_transform_8_1 (
    .s_axis_config_tdata_fwd_inv(ifft_op_net),
    .s_axis_config_tvalid(ifft_fast_fourier_transform_8_1_s_axis_config_tready_net),
    .s_axis_data_tdata_xn_im_0(reinterpret1_output_port_net),
    .s_axis_data_tdata_xn_re_0(reinterpret_output_port_net),
    .s_axis_data_tvalid(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .s_axis_data_tlast(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .m_axis_data_tready(ready_out_net),
    .rst(inverter_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .s_axis_config_tready(ifft_fast_fourier_transform_8_1_s_axis_config_tready_net),
    .s_axis_data_tready(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .m_axis_data_tdata_xn_im_0(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_im_0_net),
    .m_axis_data_tdata_xn_re_0(ifft_fast_fourier_transform_8_1_m_axis_data_tdata_xn_re_0_net),
    .m_axis_data_tvalid(ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net),
    .m_axis_data_tlast(ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net),
    .event_frame_started(ifft_fast_fourier_transform_8_1_event_frame_started_net),
    .event_tlast_unexpected(ifft_fast_fourier_transform_8_1_event_tlast_unexpected_net),
    .event_tlast_missing(ifft_fast_fourier_transform_8_1_event_tlast_missing_net),
    .event_data_in_channel_halt(ifft_fast_fourier_transform_8_1_event_data_in_channel_halt_net),
    .event_status_channel_halt(ifft_fast_fourier_transform_8_1_event_status_channel_halt_net),
    .event_data_out_channel_halt(ifft_fast_fourier_transform_8_1_event_data_out_channel_halt_net)
  );
  sysgen_inverter_dea83a2b38 inverter (
    .clr(1'b0),
    .ip(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem
module channelizer_subsystem_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x0;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x1;
  assign out2 = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x0 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x1)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net),
    .d1(delay_q_net_x0),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem1
module channelizer_subsystem1_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem2
module channelizer_subsystem2_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem3
module channelizer_subsystem3_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem4
module channelizer_subsystem4_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem5
module channelizer_subsystem5_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] mux_y_net;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem6
module channelizer_subsystem6_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1/Subsystem7
module channelizer_subsystem7_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem1
module channelizer_subsystem1_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x8;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x8 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x20 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x24 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x27 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x25 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x25 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x25 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x25 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x24 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem
module channelizer_subsystem_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem1
module channelizer_subsystem1_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem2
module channelizer_subsystem2_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem3
module channelizer_subsystem3_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem4
module channelizer_subsystem4_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem5
module channelizer_subsystem5_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem6
module channelizer_subsystem6_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2/Subsystem7
module channelizer_subsystem7_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] mux_y_net;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem2
module channelizer_subsystem2_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x24 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x25 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x25 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x24 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x24 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x24 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x23 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x23 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem
module channelizer_subsystem_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem1
module channelizer_subsystem1_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem2
module channelizer_subsystem2_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem3
module channelizer_subsystem3_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem4
module channelizer_subsystem4_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem5
module channelizer_subsystem5_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem6
module channelizer_subsystem6_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3/Subsystem7
module channelizer_subsystem7_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem3
module channelizer_subsystem3_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x23 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x26 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x23 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x20 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x21 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x20 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x19 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x19 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem
module channelizer_subsystem_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem1
module channelizer_subsystem1_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem2
module channelizer_subsystem2_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem3
module channelizer_subsystem3_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem4
module channelizer_subsystem4_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem5
module channelizer_subsystem5_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem6
module channelizer_subsystem6_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4/Subsystem7
module channelizer_subsystem7_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem4
module channelizer_subsystem4_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x17 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x19 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x21 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x18 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x18 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x19 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x18 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x18 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem
module channelizer_subsystem_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem1
module channelizer_subsystem1_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem2
module channelizer_subsystem2_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem3
module channelizer_subsystem3_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem4
module channelizer_subsystem4_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem5
module channelizer_subsystem5_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem6
module channelizer_subsystem6_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5/Subsystem7
module channelizer_subsystem7_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem5
module channelizer_subsystem5_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x16 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x18 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x20 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x19 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x19 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x23 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x22 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x22 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem
module channelizer_subsystem_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem1
module channelizer_subsystem1_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem2
module channelizer_subsystem2_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem3
module channelizer_subsystem3_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem4
module channelizer_subsystem4_x23 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem5
module channelizer_subsystem5_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem6
module channelizer_subsystem6_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6/Subsystem7
module channelizer_subsystem7_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem6
module channelizer_subsystem6_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x19 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x21 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x24 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x22 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x23 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x21 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x20 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x21 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem
module channelizer_subsystem_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] concat_y_net;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign concat_y_net = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(concat_y_net),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem1
module channelizer_subsystem1_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem2
module channelizer_subsystem2_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem3
module channelizer_subsystem3_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem4
module channelizer_subsystem4_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem5
module channelizer_subsystem5_x22 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem6
module channelizer_subsystem6_x24 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7/Subsystem7
module channelizer_subsystem7_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net;
  assign out2 = delay_q_net;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x0),
    .d1(delay_q_net_x1),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem7
module channelizer_subsystem7_x20 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] concat_y_net;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign concat_y_net = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x18 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(concat_y_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x20 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x22 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x21 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x22 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x22 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x24 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x31 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem
module channelizer_subsystem_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem1
module channelizer_subsystem1_x35 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem2
module channelizer_subsystem2_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem3
module channelizer_subsystem3_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem4
module channelizer_subsystem4_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem5
module channelizer_subsystem5_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem6
module channelizer_subsystem6_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8/Subsystem7
module channelizer_subsystem7_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem/Subsystem8
module channelizer_subsystem8_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x31 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x35 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x33 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x32 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x32 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x32 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x32 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x30 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem
module channelizer_subsystem_x21 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x14;
  wire [32-1:0] delay_q_net_x11;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] concat_y_net;
  wire [32-1:0] delay_q_net_x15;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x12;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x9;
  wire [32-1:0] delay_q_net_x10;
  wire [32-1:0] delay_q_net_x13;
  assign fw_out = delay_q_net_x14;
  assign bw_out = delay_q_net_x11;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign concat_y_net = fw_in;
  assign delay_q_net_x15 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem1_x22 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x12),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x1),
    .bw_out(delay_q_net_x0)
  );
  channelizer_subsystem2_x26 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net),
    .bw_out(delay_q_net_x2)
  );
  channelizer_subsystem3_x23 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x4),
    .bw_out(delay_q_net_x3)
  );
  channelizer_subsystem4_x20 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x6),
    .bw_out(delay_q_net_x5)
  );
  channelizer_subsystem5_x18 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x9),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x8),
    .bw_out(delay_q_net_x7)
  );
  channelizer_subsystem6_x21 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x13),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x10),
    .bw_out(delay_q_net_x9)
  );
  channelizer_subsystem7_x20 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(concat_y_net),
    .bw_in(delay_q_net_x0),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x12),
    .bw_out(delay_q_net_x11)
  );
  channelizer_subsystem8_x2 subsystem8 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x10),
    .bw_in(delay_q_net_x15),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x14),
    .bw_out(delay_q_net_x13)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem
module channelizer_subsystem_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x0;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x1;
  assign out2 = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x0 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x1)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net),
    .d1(delay_q_net_x0),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem1
module channelizer_subsystem1_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem2
module channelizer_subsystem2_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem3
module channelizer_subsystem3_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem4
module channelizer_subsystem4_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem5
module channelizer_subsystem5_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem6
module channelizer_subsystem6_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1/Subsystem7
module channelizer_subsystem7_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem1
module channelizer_subsystem1_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x8;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x8 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x30 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x32 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x32 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x31 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x30 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x31 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x31 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x32 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem
module channelizer_subsystem_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem1
module channelizer_subsystem1_x37 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem2
module channelizer_subsystem2_x35 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem3
module channelizer_subsystem3_x35 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem4
module channelizer_subsystem4_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem5
module channelizer_subsystem5_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem6
module channelizer_subsystem6_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2/Subsystem7
module channelizer_subsystem7_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem2
module channelizer_subsystem2_x36 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x33 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x37 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x35 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x35 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x34 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x34 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x34 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x34 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem
module channelizer_subsystem_x32 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem1
module channelizer_subsystem1_x36 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem2
module channelizer_subsystem2_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem3
module channelizer_subsystem3_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem4
module channelizer_subsystem4_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem5
module channelizer_subsystem5_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem6
module channelizer_subsystem6_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3/Subsystem7
module channelizer_subsystem7_x33 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem3
module channelizer_subsystem3_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x32 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x36 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x34 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x33 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x33 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x33 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x33 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x33 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem
module channelizer_subsystem_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem1
module channelizer_subsystem1_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem2
module channelizer_subsystem2_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem3
module channelizer_subsystem3_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem4
module channelizer_subsystem4_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem5
module channelizer_subsystem5_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem6
module channelizer_subsystem6_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4/Subsystem7
module channelizer_subsystem7_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem4
module channelizer_subsystem4_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x27 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x29 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x29 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x27 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x27 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x28 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x28 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x26 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem
module channelizer_subsystem_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem1
module channelizer_subsystem1_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem2
module channelizer_subsystem2_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem3
module channelizer_subsystem3_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem4
module channelizer_subsystem4_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem5
module channelizer_subsystem5_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem6
module channelizer_subsystem6_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5/Subsystem7
module channelizer_subsystem7_x25 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem5
module channelizer_subsystem5_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x25 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x27 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x28 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x26 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x26 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x26 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x27 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x25 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem
module channelizer_subsystem_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem1
module channelizer_subsystem1_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem2
module channelizer_subsystem2_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem3
module channelizer_subsystem3_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem4
module channelizer_subsystem4_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem5
module channelizer_subsystem5_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem6
module channelizer_subsystem6_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6/Subsystem7
module channelizer_subsystem7_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem6
module channelizer_subsystem6_x26 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x26 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x28 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x31 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x30 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x29 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x30 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x30 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x29 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem
module channelizer_subsystem_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem1
module channelizer_subsystem1_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem2
module channelizer_subsystem2_x30 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem3
module channelizer_subsystem3_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem4
module channelizer_subsystem4_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem5
module channelizer_subsystem5_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem6
module channelizer_subsystem6_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7/Subsystem7
module channelizer_subsystem7_x27 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net;
  assign out2 = delay_q_net;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x0),
    .d1(delay_q_net_x1),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem7
module channelizer_subsystem7_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x2;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  assign fw_out = delay_q_net;
  assign bw_out = delay_q_net_x2;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x29 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem1_x30 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem2_x30 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem3_x28 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem4_x28 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem5_x29 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem6_x29 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
  channelizer_subsystem7_x27 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net),
    .out2(delay_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem
module channelizer_subsystem_x28 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem1
module channelizer_subsystem1_x31 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem2
module channelizer_subsystem2_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem3
module channelizer_subsystem3_x29 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem4
module channelizer_subsystem4_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem5
module channelizer_subsystem5_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem6
module channelizer_subsystem6_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8/Subsystem7
module channelizer_subsystem7_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1/Subsystem8
module channelizer_subsystem8_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x28 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x31 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x17 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x29 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x6 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x5 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x6 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x6 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem1
module channelizer_subsystem1_x34 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x16;
  wire [32-1:0] delay_q_net_x13;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x3;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x14;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x9;
  wire [32-1:0] delay_q_net_x10;
  wire [32-1:0] delay_q_net_x11;
  wire [32-1:0] delay_q_net_x12;
  wire [32-1:0] delay_q_net_x15;
  assign fw_out = delay_q_net_x16;
  assign bw_out = delay_q_net_x13;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x3 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem1_x33 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x14),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x2),
    .bw_out(delay_q_net_x1)
  );
  channelizer_subsystem2_x36 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x4),
    .bw_out(delay_q_net)
  );
  channelizer_subsystem3_x34 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x6),
    .bw_out(delay_q_net_x5)
  );
  channelizer_subsystem4_x31 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x9),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x8),
    .bw_out(delay_q_net_x7)
  );
  channelizer_subsystem5_x27 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x11),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x10),
    .bw_out(delay_q_net_x9)
  );
  channelizer_subsystem6_x26 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x10),
    .bw_in(delay_q_net_x15),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x12),
    .bw_out(delay_q_net_x11)
  );
  channelizer_subsystem7_x28 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x14),
    .bw_out(delay_q_net_x13)
  );
  channelizer_subsystem8_x1 subsystem8 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x12),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x16),
    .bw_out(delay_q_net_x15)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem
module channelizer_subsystem_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x0;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x1;
  assign out2 = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x0 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x1)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net),
    .d1(delay_q_net_x0),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem1
module channelizer_subsystem1_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem2
module channelizer_subsystem2_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem3
module channelizer_subsystem3_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem4
module channelizer_subsystem4_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem5
module channelizer_subsystem5_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem6
module channelizer_subsystem6_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1/Subsystem7
module channelizer_subsystem7_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem1
module channelizer_subsystem1_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x8;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x8 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x4 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x4 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x5 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x4 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x4 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x4 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x5 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x5 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem
module channelizer_subsystem_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem1
module channelizer_subsystem1_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem2
module channelizer_subsystem2_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem3
module channelizer_subsystem3_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem4
module channelizer_subsystem4_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem5
module channelizer_subsystem5_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem6
module channelizer_subsystem6_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2/Subsystem7
module channelizer_subsystem7_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem2
module channelizer_subsystem2_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x3 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x3 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x3 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x5 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x5 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x8 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x8 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x8 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem
module channelizer_subsystem_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem1
module channelizer_subsystem1_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem2
module channelizer_subsystem2_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] mux_y_net;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem3
module channelizer_subsystem3_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem4
module channelizer_subsystem4_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem5
module channelizer_subsystem5_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem6
module channelizer_subsystem6_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3/Subsystem7
module channelizer_subsystem7_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem3
module channelizer_subsystem3_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x7 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x7 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x8 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x7 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x7 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x6 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x7 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x7 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem
module channelizer_subsystem_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem1
module channelizer_subsystem1_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem2
module channelizer_subsystem2_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem3
module channelizer_subsystem3_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem4
module channelizer_subsystem4_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem5
module channelizer_subsystem5_x7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem6
module channelizer_subsystem6_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4/Subsystem7
module channelizer_subsystem7_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem4
module channelizer_subsystem4_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x6 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x6 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x7 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x6 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x3 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x7 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x2 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x1 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem
module channelizer_subsystem_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem1
module channelizer_subsystem1_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem2
module channelizer_subsystem2_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem3
module channelizer_subsystem3_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem4
module channelizer_subsystem4_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem5
module channelizer_subsystem5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem6
module channelizer_subsystem6_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5/Subsystem7
module channelizer_subsystem7 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem5
module channelizer_subsystem5_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x0 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x0 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x0 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x0 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x0 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x1 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem
module channelizer_subsystem (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem1
module channelizer_subsystem1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem2
module channelizer_subsystem2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem3
module channelizer_subsystem3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem4
module channelizer_subsystem4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem5
module channelizer_subsystem5_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem6
module channelizer_subsystem6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6/Subsystem7
module channelizer_subsystem7_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem6
module channelizer_subsystem6_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x0 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x3 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem
module channelizer_subsystem_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem1
module channelizer_subsystem1_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem2
module channelizer_subsystem2_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem3
module channelizer_subsystem3_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem4
module channelizer_subsystem4_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem5
module channelizer_subsystem5_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem6
module channelizer_subsystem6_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7/Subsystem7
module channelizer_subsystem7_x4 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net;
  assign out2 = delay_q_net;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x0),
    .d1(delay_q_net_x1),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem7
module channelizer_subsystem7_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x2;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  assign fw_out = delay_q_net;
  assign bw_out = delay_q_net_x2;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x2 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem1_x2 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem2_x2 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem3_x3 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem4_x2 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem5_x3 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem6_x4 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
  channelizer_subsystem7_x4 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net),
    .out2(delay_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem
module channelizer_subsystem_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem1
module channelizer_subsystem1_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem2
module channelizer_subsystem2_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem3
module channelizer_subsystem3_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem4
module channelizer_subsystem4_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem5
module channelizer_subsystem5_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem6
module channelizer_subsystem6_x3 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8/Subsystem7
module channelizer_subsystem7_x2 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2/Subsystem8
module channelizer_subsystem8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x1 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x1 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x1 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x2 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x1 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x2 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x3 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x2 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem2
module channelizer_subsystem2_x6 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x16;
  wire [32-1:0] delay_q_net_x13;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x3;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x14;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x9;
  wire [32-1:0] delay_q_net_x10;
  wire [32-1:0] delay_q_net_x11;
  wire [32-1:0] delay_q_net_x12;
  wire [32-1:0] delay_q_net_x15;
  assign fw_out = delay_q_net_x16;
  assign bw_out = delay_q_net_x13;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x3 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem1_x5 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x14),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x2),
    .bw_out(delay_q_net_x1)
  );
  channelizer_subsystem2_x4 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x4),
    .bw_out(delay_q_net)
  );
  channelizer_subsystem3_x8 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x6),
    .bw_out(delay_q_net_x5)
  );
  channelizer_subsystem4_x8 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x9),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x8),
    .bw_out(delay_q_net_x7)
  );
  channelizer_subsystem5_x1 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x11),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x10),
    .bw_out(delay_q_net_x9)
  );
  channelizer_subsystem6_x0 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x10),
    .bw_in(delay_q_net_x15),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x12),
    .bw_out(delay_q_net_x11)
  );
  channelizer_subsystem7_x0 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x14),
    .bw_out(delay_q_net_x13)
  );
  channelizer_subsystem8 subsystem8 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x12),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x16),
    .bw_out(delay_q_net_x15)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem
module channelizer_subsystem_x5 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x0;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x1;
  assign out2 = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x0 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x1)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net),
    .d1(delay_q_net_x0),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem1
module channelizer_subsystem1_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem2
module channelizer_subsystem2_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem3
module channelizer_subsystem3_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem4
module channelizer_subsystem4_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem5
module channelizer_subsystem5_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem6
module channelizer_subsystem6_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1/Subsystem7
module channelizer_subsystem7_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem1
module channelizer_subsystem1_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x8;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign delay_q_net_x8 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x5 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x14 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x16 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x15 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x14 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x14 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x15 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x15 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem
module channelizer_subsystem_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem1
module channelizer_subsystem1_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem2
module channelizer_subsystem2_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem3
module channelizer_subsystem3_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem4
module channelizer_subsystem4_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem5
module channelizer_subsystem5_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem6
module channelizer_subsystem6_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2/Subsystem7
module channelizer_subsystem7_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem2
module channelizer_subsystem2_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x12 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x12 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x14 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x14 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x13 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x13 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x14 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x14 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem
module channelizer_subsystem_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem1
module channelizer_subsystem1_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem2
module channelizer_subsystem2_x19 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem3
module channelizer_subsystem3_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem4
module channelizer_subsystem4_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem5
module channelizer_subsystem5_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem6
module channelizer_subsystem6_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3/Subsystem7
module channelizer_subsystem7_x17 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem3
module channelizer_subsystem3_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x13 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x13 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x19 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x17 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x17 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x17 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x17 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x17 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem
module channelizer_subsystem_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem1
module channelizer_subsystem1_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem2
module channelizer_subsystem2_x18 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem3
module channelizer_subsystem3_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem4
module channelizer_subsystem4_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem5
module channelizer_subsystem5_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem6
module channelizer_subsystem6_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4/Subsystem7
module channelizer_subsystem7_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem4
module channelizer_subsystem4_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x15 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x15 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x18 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x16 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x15 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x16 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x16 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x16 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem
module channelizer_subsystem_x14 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem1
module channelizer_subsystem1_x16 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem2
module channelizer_subsystem2_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem3
module channelizer_subsystem3_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem4
module channelizer_subsystem4_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem5
module channelizer_subsystem5_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem6
module channelizer_subsystem6_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5/Subsystem7
module channelizer_subsystem7_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem5
module channelizer_subsystem5_x15 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x14 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x16 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x12 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x11 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x11 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x10 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x11 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x11 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem
module channelizer_subsystem_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem1
module channelizer_subsystem1_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem2
module channelizer_subsystem2_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem3
module channelizer_subsystem3_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem4
module channelizer_subsystem4_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem5
module channelizer_subsystem5_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem6
module channelizer_subsystem6_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6/Subsystem7
module channelizer_subsystem7_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem6
module channelizer_subsystem6_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x1;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  assign fw_out = delay_q_net_x8;
  assign bw_out = delay_q_net_x1;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x9 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem1_x9 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem2_x10 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem3_x9 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem4_x9 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem5_x9 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem6_x9 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem7_x10 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem
module channelizer_subsystem_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem1
module channelizer_subsystem1_x8 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem2
module channelizer_subsystem2_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem3
module channelizer_subsystem3_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem4
module channelizer_subsystem4_x10 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem5
module channelizer_subsystem5_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem6
module channelizer_subsystem6_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7/Subsystem7
module channelizer_subsystem7_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net;
  assign out2 = delay_q_net;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x0),
    .d1(delay_q_net_x1),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem7
module channelizer_subsystem7_x9 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x2;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net_x1;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  assign fw_out = delay_q_net;
  assign bw_out = delay_q_net_x2;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign delay_q_net_x1 = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x8 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem1_x8 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem2_x9 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem3_x10 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem4_x10 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem5_x12 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
  channelizer_subsystem6_x13 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x8),
    .out2(delay_q_net_x8)
  );
  channelizer_subsystem7_x13 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x8),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net),
    .out2(delay_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem
module channelizer_subsystem_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem1
module channelizer_subsystem1_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem2
module channelizer_subsystem2_x13 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem3
module channelizer_subsystem3_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem4
module channelizer_subsystem4_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem5
module channelizer_subsystem5_x11 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem6
module channelizer_subsystem6_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net_x0;
  assign out2 = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x1 = fw_in;
  assign delay_q_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net_x0)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x1),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8/Subsystem7
module channelizer_subsystem7_x12 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] out1,
  output [32-1:0] out2
);
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] concat_y_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] mux_y_net;
  assign out1 = delay_q_net;
  assign out2 = delay_q_net;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign concat_y_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xldelay #(
    .latency(1),
    .reg_retiming(0),
    .reset(0),
    .width(32)
  )
  delay (
    .rst(1'b1),
    .d(mux_y_net),
    .en(logical1_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x0),
    .d1(concat_y_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3/Subsystem8
module channelizer_subsystem8_x0 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x0;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] concat_y_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  assign fw_out = delay_q_net_x7;
  assign bw_out = delay_q_net_x0;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net = fw_in;
  assign concat_y_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x11 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x0),
    .out2(delay_q_net_x0)
  );
  channelizer_subsystem1_x11 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x2),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x1),
    .out2(delay_q_net_x1)
  );
  channelizer_subsystem2_x13 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x1),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x2),
    .out2(delay_q_net_x2)
  );
  channelizer_subsystem3_x12 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x3),
    .out2(delay_q_net_x3)
  );
  channelizer_subsystem4_x12 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x4),
    .out2(delay_q_net_x4)
  );
  channelizer_subsystem5_x11 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x5),
    .out2(delay_q_net_x5)
  );
  channelizer_subsystem6_x12 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x7),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x6),
    .out2(delay_q_net_x6)
  );
  channelizer_subsystem7_x12 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x6),
    .bw_in(concat_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .out1(delay_q_net_x7),
    .out2(delay_q_net_x7)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse/Subsystem3
module channelizer_subsystem3_x1 (
  input [1-1:0] en_in,
  input [1-1:0] dir_in,
  input [32-1:0] fw_in,
  input [32-1:0] bw_in,
  input clk_1,
  input ce_1,
  output [32-1:0] fw_out,
  output [32-1:0] bw_out
);
  wire [32-1:0] delay_q_net_x15;
  wire [32-1:0] delay_q_net_x12;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] concat_y_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x13;
  wire [32-1:0] delay_q_net;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [32-1:0] delay_q_net_x7;
  wire [32-1:0] delay_q_net_x8;
  wire [32-1:0] delay_q_net_x9;
  wire [32-1:0] delay_q_net_x10;
  wire [32-1:0] delay_q_net_x11;
  wire [32-1:0] delay_q_net_x14;
  assign fw_out = delay_q_net_x15;
  assign bw_out = delay_q_net_x12;
  assign logical1_y_net = en_in;
  assign assert_dout_net = dir_in;
  assign delay_q_net_x0 = fw_in;
  assign concat_y_net = bw_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem1_x17 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x13),
    .bw_in(delay_q_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x2),
    .bw_out(delay_q_net_x1)
  );
  channelizer_subsystem2_x15 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x4),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x3),
    .bw_out(delay_q_net)
  );
  channelizer_subsystem3_x13 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x3),
    .bw_in(delay_q_net_x6),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x5),
    .bw_out(delay_q_net_x4)
  );
  channelizer_subsystem4_x16 subsystem4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x5),
    .bw_in(delay_q_net_x8),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x7),
    .bw_out(delay_q_net_x6)
  );
  channelizer_subsystem5_x15 subsystem5 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x7),
    .bw_in(delay_q_net_x10),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x9),
    .bw_out(delay_q_net_x8)
  );
  channelizer_subsystem6_x10 subsystem6 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x9),
    .bw_in(delay_q_net_x14),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x11),
    .bw_out(delay_q_net_x10)
  );
  channelizer_subsystem7_x9 subsystem7 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x13),
    .bw_out(delay_q_net_x12)
  );
  channelizer_subsystem8_x0 subsystem8 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x11),
    .bw_in(concat_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x15),
    .bw_out(delay_q_net_x14)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/frame_reverse
module channelizer_frame_reverse (
  input ready_out,
  input valid_in,
  input [32-1:0] data_in,
  input last_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output [32-1:0] data_out
);
  wire [32-1:0] mux_y_net;
  wire ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  wire fir_compiler_7_2_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire fir_compiler_7_2_1_m_axis_data_tlast_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [32-1:0] delay_q_net_x0;
  wire [32-1:0] delay_q_net;
  wire [1-1:0] logical1_y_net;
  wire [1-1:0] assert_dout_net;
  wire [32-1:0] delay_q_net_x1;
  wire [32-1:0] delay_q_net_x2;
  wire [32-1:0] delay_q_net_x3;
  wire [32-1:0] delay_q_net_x4;
  wire [32-1:0] delay_q_net_x5;
  wire [32-1:0] delay_q_net_x6;
  wire [1-1:0] inverter_op_net;
  wire [1-1:0] logical2_y_net;
  assign data_out = mux_y_net;
  assign ifft_fast_fourier_transform_8_1_s_axis_data_tready_net = ready_out;
  assign fir_compiler_7_2_1_m_axis_data_tvalid_net = valid_in;
  assign concat_y_net = data_in;
  assign fir_compiler_7_2_1_m_axis_data_tlast_net = last_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x21 subsystem_x4 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(concat_y_net),
    .bw_in(delay_q_net_x1),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x0),
    .bw_out(delay_q_net)
  );
  channelizer_subsystem1_x34 subsystem1 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x0),
    .bw_in(delay_q_net_x3),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x2),
    .bw_out(delay_q_net_x1)
  );
  channelizer_subsystem2_x6 subsystem2 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x2),
    .bw_in(delay_q_net_x5),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x4),
    .bw_out(delay_q_net_x3)
  );
  channelizer_subsystem3_x1 subsystem3 (
    .en_in(logical1_y_net),
    .dir_in(assert_dout_net),
    .fw_in(delay_q_net_x4),
    .bw_in(concat_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .fw_out(delay_q_net_x6),
    .bw_out(delay_q_net_x5)
  );
  xlpassthrough #(
    .din_width(1),
    .dout_width(1)
  )
  assert (
    .din(inverter_op_net),
    .dout(assert_dout_net)
  );
  sysgen_inverter_9a61a206ed inverter (
    .clr(1'b0),
    .ip(assert_dout_net),
    .en(logical2_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
  sysgen_logical_f9d74a72d1 logical1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .d1(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .y(logical1_y_net)
  );
  sysgen_logical_20edb24841 logical2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .d1(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .d2(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .y(logical2_y_net)
  );
  sysgen_mux_c5d8f79c53 mux (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .sel(assert_dout_net),
    .d0(delay_q_net_x6),
    .d1(delay_q_net),
    .y(mux_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem
module channelizer_subsystem_x10 (
  input [32-1:0] in1,
  input clk_1,
  input ce_1,
  output [18-1:0] imag,
  output [18-1:0] real_x0
);
  wire [18-1:0] convert_dout_net;
  wire [18-1:0] convert1_dout_net;
  wire [32-1:0] data_in_net;
  wire clk_net;
  wire ce_net;
  wire [16-1:0] reinterpret3_output_port_net;
  wire [16-1:0] reinterpret_output_port_net;
  wire [16-1:0] lower_y_net;
  wire [16-1:0] upper_y_net;
  assign imag = convert_dout_net;
  assign real_x0 = convert1_dout_net;
  assign data_in_net = in1;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(0),
    .din_width(16),
    .dout_arith(2),
    .dout_bin_pt(0),
    .dout_width(18),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlTruncate)
  )
  convert (
    .clr(1'b0),
    .en(1'b1),
    .din(reinterpret3_output_port_net),
    .clk(clk_net),
    .ce(ce_net),
    .dout(convert_dout_net)
  );
  channelizer_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(0),
    .din_width(16),
    .dout_arith(2),
    .dout_bin_pt(0),
    .dout_width(18),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlTruncate)
  )
  convert1 (
    .clr(1'b0),
    .en(1'b1),
    .din(reinterpret_output_port_net),
    .clk(clk_net),
    .ce(ce_net),
    .dout(convert1_dout_net)
  );
  sysgen_reinterpret_ad93f43143 reinterpret (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(lower_y_net),
    .output_port(reinterpret_output_port_net)
  );
  sysgen_reinterpret_ad93f43143 reinterpret3 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(upper_y_net),
    .output_port(reinterpret3_output_port_net)
  );
  channelizer_xlslice #(
    .new_lsb(0),
    .new_msb(15),
    .x_width(32),
    .y_width(16)
  )
  lower (
    .x(data_in_net),
    .y(lower_y_net)
  );
  channelizer_xlslice #(
    .new_lsb(16),
    .new_msb(31),
    .x_width(32),
    .y_width(16)
  )
  upper (
    .x(data_in_net),
    .y(upper_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem1
module channelizer_subsystem1_x10 (
  input [34-1:0] imag,
  input [34-1:0] real_x0,
  output [32-1:0] out1
);
  wire [32-1:0] concat_y_net;
  wire [34-1:0] fir_compiler_7_2_1_m_axis_data_tdata_path1_net;
  wire [34-1:0] fir_compiler_7_2_1_m_axis_data_tdata_path0_net;
  wire [16-1:0] slice1_y_net;
  wire [16-1:0] slice_y_net;
  wire [34-1:0] reinterpret1_output_port_net;
  wire [34-1:0] reinterpret2_output_port_net;
  assign out1 = concat_y_net;
  assign fir_compiler_7_2_1_m_axis_data_tdata_path1_net = imag;
  assign fir_compiler_7_2_1_m_axis_data_tdata_path0_net = real_x0;
  sysgen_concat_c4ee67c59a concat (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .in0(slice1_y_net),
    .in1(slice_y_net),
    .y(concat_y_net)
  );
  sysgen_reinterpret_4bd3487388 reinterpret1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(fir_compiler_7_2_1_m_axis_data_tdata_path0_net),
    .output_port(reinterpret1_output_port_net)
  );
  sysgen_reinterpret_4bd3487388 reinterpret2 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .input_port(fir_compiler_7_2_1_m_axis_data_tdata_path1_net),
    .output_port(reinterpret2_output_port_net)
  );
  channelizer_xlslice #(
    .new_lsb(15),
    .new_msb(30),
    .x_width(34),
    .y_width(16)
  )
  slice (
    .x(reinterpret1_output_port_net),
    .y(slice_y_net)
  );
  channelizer_xlslice #(
    .new_lsb(15),
    .new_msb(30),
    .x_width(34),
    .y_width(16)
  )
  slice1 (
    .x(reinterpret2_output_port_net),
    .y(slice1_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem2
module channelizer_subsystem2_x11 (
  input ready_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output [1-1:0] valid_out,
  output [1-1:0] last_out,
  output [7-1:0] data_out
);
  wire [1-1:0] inverter_op_net;
  wire [1-1:0] relational_op_net;
  wire [7-1:0] counter_op_net;
  wire fir_compiler_7_2_1_s_axis_config_tready_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [7-1:0] constant_op_net;
  wire [1-1:0] constant1_op_net;
  wire [1-1:0] delay_q_net;
  assign valid_out = inverter_op_net;
  assign last_out = relational_op_net;
  assign data_out = counter_op_net;
  assign fir_compiler_7_2_1_s_axis_config_tready_net = ready_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_471810e732 constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  sysgen_constant_fa8d4b3e6d constant1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant1_op_net)
  );
  channelizer_xlcounter_free #(
    .core_name0("channelizer_c_counter_binary_v12_0_i0"),
    .op_arith(`xlUnsigned),
    .op_width(7)
  )
  counter (
    .clr(1'b0),
    .rst(logical_y_net),
    .en(fir_compiler_7_2_1_s_axis_config_tready_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  sysgen_delay_52cccd8896 delay (
    .clr(1'b0),
    .d(constant1_op_net),
    .rst(logical_y_net),
    .en(relational_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_inverter_dea83a2b38 inverter (
    .clr(1'b0),
    .ip(delay_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
  sysgen_relational_61af23dbad relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(constant_op_net),
    .b(counter_op_net),
    .op(relational_op_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/poly_phase_filter
module channelizer_poly_phase_filter (
  input ready_out,
  input [1-1:0] valid_in,
  input [32-1:0] data_in,
  input [1-1:0] last_in,
  input [1-1:0] reset_in,
  input clk_1,
  input ce_1,
  output ready_in,
  output valid_out,
  output [32-1:0] data_out,
  output last_out
);
  wire fir_compiler_7_2_1_s_axis_data_tready_net;
  wire fir_compiler_7_2_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire fir_compiler_7_2_1_m_axis_data_tlast_net;
  wire ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  wire [1-1:0] valid_in_net;
  wire [32-1:0] data_in_net;
  wire [1-1:0] last_in_net;
  wire [1-1:0] logical_y_net;
  wire clk_net;
  wire ce_net;
  wire [18-1:0] convert_dout_net;
  wire [18-1:0] convert1_dout_net;
  wire [34-1:0] fir_compiler_7_2_1_m_axis_data_tdata_path1_net;
  wire [34-1:0] fir_compiler_7_2_1_m_axis_data_tdata_path0_net;
  wire [1-1:0] inverter_op_net_x0;
  wire [1-1:0] relational_op_net;
  wire [7-1:0] counter_op_net;
  wire fir_compiler_7_2_1_s_axis_config_tready_net;
  wire fir_compiler_7_2_1_event_s_config_tlast_missing_net;
  wire fir_compiler_7_2_1_event_s_config_tlast_unexpected_net;
  wire inverter_op_net;
  assign ready_in = fir_compiler_7_2_1_s_axis_data_tready_net;
  assign valid_out = fir_compiler_7_2_1_m_axis_data_tvalid_net;
  assign data_out = concat_y_net;
  assign last_out = fir_compiler_7_2_1_m_axis_data_tlast_net;
  assign ifft_fast_fourier_transform_8_1_s_axis_data_tready_net = ready_out;
  assign valid_in_net = valid_in;
  assign data_in_net = data_in;
  assign last_in_net = last_in;
  assign logical_y_net = reset_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_subsystem_x10 subsystem_x4 (
    .in1(data_in_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .imag(convert_dout_net),
    .real_x0(convert1_dout_net)
  );
  channelizer_subsystem1_x10 subsystem1 (
    .imag(fir_compiler_7_2_1_m_axis_data_tdata_path1_net),
    .real_x0(fir_compiler_7_2_1_m_axis_data_tdata_path0_net),
    .out1(concat_y_net)
  );
  channelizer_subsystem2_x11 subsystem2 (
    .ready_in(fir_compiler_7_2_1_s_axis_config_tready_net),
    .reset_in(logical_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .valid_out(inverter_op_net_x0),
    .last_out(relational_op_net),
    .data_out(counter_op_net)
  );
  xlfir_compiler_52b7c57832347085ca61d3be319bb07e fir_compiler_7_2_1 (
    .s_axis_data_tvalid(valid_in_net),
    .s_axis_data_tlast(last_in_net),
    .s_axis_data_tdata_path1(convert_dout_net),
    .s_axis_data_tdata_path0(convert1_dout_net),
    .s_axis_config_tvalid(inverter_op_net_x0),
    .s_axis_config_tlast(relational_op_net),
    .s_axis_config_tdata_fsel(counter_op_net),
    .m_axis_data_tready(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .rst(inverter_op_net),
    .src_clk(clk_net),
    .src_ce(ce_net),
    .clk(clk_net),
    .ce(ce_net),
    .s_axis_data_tready(fir_compiler_7_2_1_s_axis_data_tready_net),
    .s_axis_config_tready(fir_compiler_7_2_1_s_axis_config_tready_net),
    .m_axis_data_tvalid(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .m_axis_data_tlast(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .m_axis_data_tdata_path1(fir_compiler_7_2_1_m_axis_data_tdata_path1_net),
    .m_axis_data_tdata_path0(fir_compiler_7_2_1_m_axis_data_tdata_path0_net),
    .event_s_config_tlast_missing(fir_compiler_7_2_1_event_s_config_tlast_missing_net),
    .event_s_config_tlast_unexpected(fir_compiler_7_2_1_event_s_config_tlast_unexpected_net)
  );
  sysgen_inverter_dea83a2b38 inverter (
    .clr(1'b0),
    .ip(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(inverter_op_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer/reset_register
module channelizer_reset_register (
  input [1-1:0] set_stb,
  input [8-1:0] set_addr,
  input clk_1,
  input ce_1,
  output [1-1:0] reset_out
);
  wire [1-1:0] delay_q_net;
  wire [1-1:0] set_stb_in_net;
  wire [8-1:0] set_addr_in_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] constant_op_net;
  wire [2-1:0] counter_op_net;
  wire [1-1:0] relational1_op_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] relational_op_net;
  wire [8-1:0] address_op_net;
  wire [2-1:0] address1_op_net;
  assign reset_out = delay_q_net;
  assign set_stb_in_net = set_stb;
  assign set_addr_in_net = set_addr;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  sysgen_constant_fa8d4b3e6d constant (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(constant_op_net)
  );
  channelizer_xlcounter_free #(
    .core_name0("channelizer_c_counter_binary_v12_0_i1"),
    .op_arith(`xlUnsigned),
    .op_width(2)
  )
  counter (
    .clr(1'b0),
    .rst(relational1_op_net),
    .en(delay_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(counter_op_net)
  );
  sysgen_delay_52cccd8896 delay (
    .clr(1'b0),
    .d(constant_op_net),
    .rst(relational1_op_net),
    .en(logical_y_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(delay_q_net)
  );
  sysgen_logical_f9d74a72d1 logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(set_stb_in_net),
    .d1(relational_op_net),
    .y(logical_y_net)
  );
  sysgen_relational_fc1426e2d9 relational (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(set_addr_in_net),
    .b(address_op_net),
    .op(relational_op_net)
  );
  sysgen_relational_9133ff9c4b relational1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .a(counter_op_net),
    .b(address1_op_net),
    .op(relational1_op_net)
  );
  sysgen_constant_07b701207a address (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(address_op_net)
  );
  sysgen_constant_118900d9b9 address1 (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .op(address1_op_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/channelizer
module channelizer_channelizer (
  input [1-1:0] ready_out,
  input [1-1:0] valid_in,
  input [32-1:0] data_in,
  input [1-1:0] last_in,
  input [1-1:0] reset_in,
  input [1-1:0] set_stb_in,
  input [8-1:0] set_addr_in,
  input clk_1,
  input ce_1,
  output ready_in,
  output valid_out,
  output [32-1:0] data_out,
  output last_out,
  output [1-1:0] reset_out
);
  wire fir_compiler_7_2_1_s_axis_data_tready_net;
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] ready_out_net;
  wire [1-1:0] valid_in_net;
  wire [32-1:0] data_in_net;
  wire [1-1:0] last_in_net;
  wire [1-1:0] reset_in_net;
  wire [1-1:0] set_stb_in_net;
  wire [8-1:0] set_addr_in_net;
  wire clk_net;
  wire ce_net;
  wire ifft_fast_fourier_transform_8_1_s_axis_data_tready_net;
  wire fir_compiler_7_2_1_m_axis_data_tvalid_net;
  wire [32-1:0] mux_y_net;
  wire fir_compiler_7_2_1_m_axis_data_tlast_net;
  wire [32-1:0] concat_y_net_x0;
  wire [1-1:0] delay_q_net;
  assign ready_in = fir_compiler_7_2_1_s_axis_data_tready_net;
  assign valid_out = ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  assign data_out = concat_y_net;
  assign last_out = ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  assign reset_out = logical_y_net;
  assign ready_out_net = ready_out;
  assign valid_in_net = valid_in;
  assign data_in_net = data_in;
  assign last_in_net = last_in;
  assign reset_in_net = reset_in;
  assign set_stb_in_net = set_stb_in;
  assign set_addr_in_net = set_addr_in;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_fft1 fft1 (
    .ready_out(ready_out_net),
    .valid_in(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .data_in(mux_y_net),
    .last_in(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .reset_in(logical_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .ready_in(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .valid_out(ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net),
    .data_out(concat_y_net),
    .last_out(ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net)
  );
  channelizer_frame_reverse frame_reverse (
    .ready_out(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .valid_in(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .data_in(concat_y_net_x0),
    .last_in(fir_compiler_7_2_1_m_axis_data_tlast_net),
    .reset_in(logical_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .data_out(mux_y_net)
  );
  channelizer_poly_phase_filter poly_phase_filter (
    .ready_out(ifft_fast_fourier_transform_8_1_s_axis_data_tready_net),
    .valid_in(valid_in_net),
    .data_in(data_in_net),
    .last_in(last_in_net),
    .reset_in(logical_y_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .ready_in(fir_compiler_7_2_1_s_axis_data_tready_net),
    .valid_out(fir_compiler_7_2_1_m_axis_data_tvalid_net),
    .data_out(concat_y_net_x0),
    .last_out(fir_compiler_7_2_1_m_axis_data_tlast_net)
  );
  channelizer_reset_register reset_register (
    .set_stb(set_stb_in_net),
    .set_addr(set_addr_in_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .reset_out(delay_q_net)
  );
  sysgen_logical_8b7810a2aa logical (
    .clk(1'b0),
    .ce(1'b0),
    .clr(1'b0),
    .d0(delay_q_net),
    .d1(reset_in_net),
    .y(logical_y_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/implementation_interface_in
module channelizer_implementation_interface_in (
  input ready_out,
  input [32-1:0] data_in,
  input [1-1:0] last_in,
  input [1-1:0] reset_in,
  input [8-1:0] set_addr_in,
  input [1-1:0] set_stb_in,
  input [1-1:0] valid_in
);
  wire fir_compiler_7_2_1_s_axis_data_tready_net;
  wire [32-1:0] data_in_net;
  wire [1-1:0] last_in_net;
  wire [1-1:0] reset_in_net;
  wire [8-1:0] set_addr_in_net;
  wire [1-1:0] set_stb_in_net;
  wire [1-1:0] valid_in_net;
  assign fir_compiler_7_2_1_s_axis_data_tready_net = ready_out;
  assign data_in_net = data_in;
  assign last_in_net = last_in;
  assign reset_in_net = reset_in;
  assign set_addr_in_net = set_addr_in;
  assign set_stb_in_net = set_stb_in;
  assign valid_in_net = valid_in;
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer/implementation_interface_out
module channelizer_implementation_interface_out (
  input valid_in,
  input [32-1:0] data_in,
  input last_in,
  input [1-1:0] reset_in,
  input [1-1:0] set_strb_in,
  input [8-1:0] set_addr_in,
  input [1-1:0] ready_out
);
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  wire [32-1:0] concat_y_net;
  wire ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  wire [1-1:0] logical_y_net;
  wire [1-1:0] set_stb_in_net;
  wire [8-1:0] set_addr_in_net;
  wire [1-1:0] ready_out_net;
  assign ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net = valid_in;
  assign concat_y_net = data_in;
  assign ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net = last_in;
  assign logical_y_net = reset_in;
  assign set_stb_in_net = set_strb_in;
  assign set_addr_in_net = set_addr_in;
  assign ready_out_net = ready_out;
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block channelizer_struct
module channelizer_struct (
  input [32-1:0] data_in,
  input [1-1:0] last_in,
  input [1-1:0] reset_in,
  input [8-1:0] set_addr_in,
  input [32-1:0] set_data_in,
  input [1-1:0] set_stb_in,
  input [1-1:0] valid_in,
  input [1-1:0] ready_out,
  input clk_1,
  input ce_1,
  output [1-1:0] ready_in,
  output [32-1:0] data_out,
  output [1-1:0] last_out,
  output [1-1:0] valid_out
);
  wire [32-1:0] data_in_net;
  wire [1-1:0] last_in_net;
  wire [1-1:0] fir_compiler_7_2_1_s_axis_data_tready_net;
  wire [1-1:0] reset_in_net;
  wire [8-1:0] set_addr_in_net;
  wire [32-1:0] set_data_in_net;
  wire [1-1:0] set_stb_in_net;
  wire [1-1:0] valid_in_net;
  wire [32-1:0] concat_y_net;
  wire [1-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  wire [1-1:0] ready_out_net;
  wire [1-1:0] ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  wire clk_net;
  wire ce_net;
  wire [1-1:0] logical_y_net;
  assign data_in_net = data_in;
  assign last_in_net = last_in;
  assign ready_in = fir_compiler_7_2_1_s_axis_data_tready_net;
  assign reset_in_net = reset_in;
  assign set_addr_in_net = set_addr_in;
  assign set_data_in_net = set_data_in;
  assign set_stb_in_net = set_stb_in;
  assign valid_in_net = valid_in;
  assign data_out = concat_y_net;
  assign last_out = ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net;
  assign ready_out_net = ready_out;
  assign valid_out = ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  channelizer_channelizer channelizer_x0 (
    .ready_out(ready_out_net),
    .valid_in(valid_in_net),
    .data_in(data_in_net),
    .last_in(last_in_net),
    .reset_in(reset_in_net),
    .set_stb_in(set_stb_in_net),
    .set_addr_in(set_addr_in_net),
    .clk_1(clk_net),
    .ce_1(ce_net),
    .ready_in(fir_compiler_7_2_1_s_axis_data_tready_net),
    .valid_out(ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net),
    .data_out(concat_y_net),
    .last_out(ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net),
    .reset_out(logical_y_net)
  );
  channelizer_implementation_interface_in implementation_interface_in (
    .ready_out(fir_compiler_7_2_1_s_axis_data_tready_net),
    .data_in(data_in_net),
    .last_in(last_in_net),
    .reset_in(reset_in_net),
    .set_addr_in(set_addr_in_net),
    .set_stb_in(set_stb_in_net),
    .valid_in(valid_in_net)
  );
  channelizer_implementation_interface_out implementation_interface_out (
    .valid_in(ifft_fast_fourier_transform_8_1_m_axis_data_tvalid_net),
    .data_in(concat_y_net),
    .last_in(ifft_fast_fourier_transform_8_1_m_axis_data_tlast_net),
    .reset_in(logical_y_net),
    .set_strb_in(set_stb_in_net),
    .set_addr_in(set_addr_in_net),
    .ready_out(ready_out_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module channelizer_default_clock_driver (
  input channelizer_sysclk,
  input channelizer_sysce,
  input channelizer_sysclr,
  output channelizer_clk1,
  output channelizer_ce1
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver (
    .sysclk(channelizer_sysclk),
    .sysce(channelizer_sysce),
    .sysclr(channelizer_sysclr),
    .clk(channelizer_clk1),
    .ce(channelizer_ce1)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "channelizer,sysgen_core_2015_4,{,compilation=HDL Netlist,block_icon_display=Default,family=kintex7,part=xc7k410t,speed=-2,package=ffg900,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=5,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=5120,assert=1,concat=2,constant=6,convert=4,counter=2,delay=258,fir_compiler_v7_2=1,inv=4,logical=9,mux=257,reinterpret=18,relational=3,slice=16,xfft_v9_0=1,}" *)
module channelizer (
  input [32-1:0] data_in,
  input [1-1:0] last_in,
  input [1-1:0] reset_in,
  input [8-1:0] set_addr_in,
  input [32-1:0] set_data_in,
  input [1-1:0] set_stb_in,
  input [1-1:0] valid_in,
  input [1-1:0] ready_out,
  input clk,
  output [1-1:0] ready_in,
  output [32-1:0] data_out,
  output [1-1:0] last_out,
  output [1-1:0] valid_out
);
  wire clk_1_net;
  wire ce_1_net;
  channelizer_default_clock_driver channelizer_default_clock_driver (
    .channelizer_sysclk(clk),
    .channelizer_sysce(1'b1),
    .channelizer_sysclr(1'b0),
    .channelizer_clk1(clk_1_net),
    .channelizer_ce1(ce_1_net)
  );
  channelizer_struct channelizer_struct (
    .data_in(data_in),
    .last_in(last_in),
    .reset_in(reset_in),
    .set_addr_in(set_addr_in),
    .set_data_in(set_data_in),
    .set_stb_in(set_stb_in),
    .valid_in(valid_in),
    .ready_out(ready_out),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .ready_in(ready_in),
    .data_out(data_out),
    .last_out(last_out),
    .valid_out(valid_out)
  );
endmodule
