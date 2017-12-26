-- Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_subsystem is
  port (
    in1 : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    imag : out std_logic_vector( 18-1 downto 0 );
    real : out std_logic_vector( 18-1 downto 0 )
  );
end channelizer_subsystem;
architecture structural of channelizer_subsystem is 
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal data_in_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal lower_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 16-1 downto 0 );
  signal upper_y_net : std_logic_vector( 16-1 downto 0 );
begin
  imag <= convert_dout_net;
  real <= convert1_dout_net;
  data_in_net <= in1;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert : entity xil_defaultlib.channelizer_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 0,
    din_width => 16,
    dout_arith => 2,
    dout_bin_pt => 0,
    dout_width => 18,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret3_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.channelizer_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 0,
    din_width => 16,
    dout_arith => 2,
    dout_bin_pt => 0,
    dout_width => 18,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_bdd8f18cc3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => lower_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_bdd8f18cc3 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => upper_y_net,
    output_port => reinterpret3_output_port_net
  );
  lower : entity xil_defaultlib.channelizer_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 15,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => data_in_net,
    y => lower_y_net
  );
  upper : entity xil_defaultlib.channelizer_xlslice 
  generic map (
    new_lsb => 16,
    new_msb => 31,
    x_width => 32,
    y_width => 16
  )
  port map (
    x => data_in_net,
    y => upper_y_net
  );
end structural;
-- Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_subsystem1 is
  port (
    imag : in std_logic_vector( 34-1 downto 0 );
    real : in std_logic_vector( 34-1 downto 0 );
    out1 : out std_logic_vector( 32-1 downto 0 )
  );
end channelizer_subsystem1;
architecture structural of channelizer_subsystem1 is 
  signal reinterpret2_output_port_net : std_logic_vector( 34-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tdata_path1_net : std_logic_vector( 34-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tdata_path0_net : std_logic_vector( 34-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 16-1 downto 0 );
  signal slice_y_net : std_logic_vector( 16-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 34-1 downto 0 );
begin
  out1 <= concat_y_net;
  fir_compiler_7_2_1_m_axis_data_tdata_path1_net <= imag;
  fir_compiler_7_2_1_m_axis_data_tdata_path0_net <= real;
  concat : entity xil_defaultlib.sysgen_concat_9880d5e3f1 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => slice1_y_net,
    in1 => slice_y_net,
    y => concat_y_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_2458d2460d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => fir_compiler_7_2_1_m_axis_data_tdata_path0_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_2458d2460d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => fir_compiler_7_2_1_m_axis_data_tdata_path1_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.channelizer_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 30,
    x_width => 34,
    y_width => 16
  )
  port map (
    x => reinterpret1_output_port_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.channelizer_xlslice 
  generic map (
    new_lsb => 15,
    new_msb => 30,
    x_width => 34,
    y_width => 16
  )
  port map (
    x => reinterpret2_output_port_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block channelizer/channelizer/poly_phase_filter/Subsystem2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_subsystem2 is
  port (
    ready_in : in std_logic;
    reset_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    valid_out : out std_logic_vector( 1-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 7-1 downto 0 )
  );
end channelizer_subsystem2;
architecture structural of channelizer_subsystem2 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 7-1 downto 0 );
  signal fir_compiler_7_2_1_s_axis_config_tready_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 7-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  valid_out <= inverter_op_net;
  last_out <= relational_op_net;
  data_out <= counter_op_net;
  fir_compiler_7_2_1_s_axis_config_tready_net <= ready_in;
  logical_y_net <= reset_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_4d018ceb56 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_642dc72dc5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  counter : entity xil_defaultlib.channelizer_xlcounter_free 
  generic map (
    core_name0 => "channelizer_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 7
  )
  port map (
    clr => '0',
    rst => logical_y_net,
    en(0) => fir_compiler_7_2_1_s_axis_config_tready_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay : entity xil_defaultlib.sysgen_delay_068588fce4 
  port map (
    clr => '0',
    d => constant1_op_net,
    rst => logical_y_net,
    en => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8a005d8288 
  port map (
    clr => '0',
    ip => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2d09704cbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
end structural;
-- Generated from Simulink block channelizer/channelizer/poly_phase_filter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_poly_phase_filter is
  port (
    ready_out : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    reset_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    ready_in : out std_logic;
    valid_out : out std_logic;
    data_out : out std_logic_vector( 32-1 downto 0 );
    last_out : out std_logic
  );
end channelizer_poly_phase_filter;
architecture structural of channelizer_poly_phase_filter is 
  signal ce_net : std_logic;
  signal convert_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tdata_path1_net : std_logic_vector( 34-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tdata_path0_net : std_logic_vector( 34-1 downto 0 );
  signal inverter_op_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 7-1 downto 0 );
  signal fir_compiler_7_2_1_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_1_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tlast_net : std_logic;
  signal ready_out_net : std_logic_vector( 1-1 downto 0 );
  signal valid_in_net : std_logic_vector( 1-1 downto 0 );
  signal data_in_net : std_logic_vector( 32-1 downto 0 );
  signal last_in_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal fir_compiler_7_2_1_s_axis_config_tready_net : std_logic;
  signal fir_compiler_7_2_1_event_s_data_tlast_missing_net : std_logic;
  signal fir_compiler_7_2_1_event_s_data_tlast_unexpected_net : std_logic;
  signal fir_compiler_7_2_1_event_s_config_tlast_missing_net : std_logic;
  signal fir_compiler_7_2_1_event_s_config_tlast_unexpected_net : std_logic;
  signal inverter_op_net : std_logic;
begin
  ready_in <= fir_compiler_7_2_1_s_axis_data_tready_net;
  valid_out <= fir_compiler_7_2_1_m_axis_data_tvalid_net;
  data_out <= concat_y_net;
  last_out <= fir_compiler_7_2_1_m_axis_data_tlast_net;
  ready_out_net <= ready_out;
  valid_in_net <= valid_in;
  data_in_net <= data_in;
  last_in_net <= last_in;
  logical_y_net <= reset_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  subsystem_x4 : entity xil_defaultlib.channelizer_subsystem 
  port map (
    in1 => data_in_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    imag => convert_dout_net,
    real => convert1_dout_net
  );
  subsystem1 : entity xil_defaultlib.channelizer_subsystem1 
  port map (
    imag => fir_compiler_7_2_1_m_axis_data_tdata_path1_net,
    real => fir_compiler_7_2_1_m_axis_data_tdata_path0_net,
    out1 => concat_y_net
  );
  subsystem2 : entity xil_defaultlib.channelizer_subsystem2 
  port map (
    ready_in => fir_compiler_7_2_1_s_axis_config_tready_net,
    reset_in => logical_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    valid_out => inverter_op_net_x0,
    last_out => relational_op_net,
    data_out => counter_op_net
  );
  fir_compiler_7_2_1 : entity xil_defaultlib.xlfir_compiler_06146507dc1137b466bea800c8b0de1d 
  port map (
    s_axis_data_tvalid => valid_in_net(0),
    s_axis_data_tlast => last_in_net(0),
    s_axis_data_tdata_path1 => convert_dout_net,
    s_axis_data_tdata_path0 => convert1_dout_net,
    s_axis_config_tvalid => inverter_op_net_x0(0),
    s_axis_config_tlast => relational_op_net(0),
    s_axis_config_tdata_fsel => counter_op_net,
    m_axis_data_tready => ready_out_net(0),
    rst => inverter_op_net,
    src_clk => clk_net,
    src_ce => ce_net,
    clk => clk_net,
    ce => ce_net,
    s_axis_data_tready => fir_compiler_7_2_1_s_axis_data_tready_net,
    s_axis_config_tready => fir_compiler_7_2_1_s_axis_config_tready_net,
    m_axis_data_tvalid => fir_compiler_7_2_1_m_axis_data_tvalid_net,
    m_axis_data_tlast => fir_compiler_7_2_1_m_axis_data_tlast_net,
    m_axis_data_tdata_path1 => fir_compiler_7_2_1_m_axis_data_tdata_path1_net,
    m_axis_data_tdata_path0 => fir_compiler_7_2_1_m_axis_data_tdata_path0_net,
    event_s_data_tlast_missing => fir_compiler_7_2_1_event_s_data_tlast_missing_net,
    event_s_data_tlast_unexpected => fir_compiler_7_2_1_event_s_data_tlast_unexpected_net,
    event_s_config_tlast_missing => fir_compiler_7_2_1_event_s_config_tlast_missing_net,
    event_s_config_tlast_unexpected => fir_compiler_7_2_1_event_s_config_tlast_unexpected_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_8a005d8288 
  port map (
    clr => '0',
    ip => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op(0) => inverter_op_net
  );
end structural;
-- Generated from Simulink block channelizer/channelizer/reset_register
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_reset_register is
  port (
    set_stb : in std_logic_vector( 1-1 downto 0 );
    set_addr : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    reset_out : out std_logic_vector( 1-1 downto 0 )
  );
end channelizer_reset_register;
architecture structural of channelizer_reset_register is 
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal set_stb_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_addr_in_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 2-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal address_op_net : std_logic_vector( 8-1 downto 0 );
  signal address1_op_net : std_logic_vector( 2-1 downto 0 );
begin
  reset_out <= delay_q_net;
  set_stb_in_net <= set_stb;
  set_addr_in_net <= set_addr;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_642dc72dc5 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.channelizer_xlcounter_free 
  generic map (
    core_name0 => "channelizer_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 2
  )
  port map (
    clr => '0',
    rst => relational1_op_net,
    en => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay : entity xil_defaultlib.sysgen_delay_068588fce4 
  port map (
    clr => '0',
    d => constant_op_net,
    rst => relational1_op_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  logical : entity xil_defaultlib.sysgen_logical_720ce09fd4 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => set_stb_in_net,
    d1 => relational_op_net,
    y => logical_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_cd0bc30257 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => set_addr_in_net,
    b => address_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_0475564a19 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => address1_op_net,
    op => relational1_op_net
  );
  address : entity xil_defaultlib.sysgen_constant_e3e82d3f8a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => address_op_net
  );
  address1 : entity xil_defaultlib.sysgen_constant_91dd771d5a 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => address1_op_net
  );
end structural;
-- Generated from Simulink block channelizer/channelizer
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_channelizer is
  port (
    ready_out : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    reset_in : in std_logic_vector( 1-1 downto 0 );
    set_stb_in : in std_logic_vector( 1-1 downto 0 );
    set_addr_in : in std_logic_vector( 8-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    ready_in : out std_logic;
    valid_out : out std_logic;
    data_out : out std_logic_vector( 32-1 downto 0 );
    last_out : out std_logic;
    reset_out : out std_logic_vector( 1-1 downto 0 )
  );
end channelizer_channelizer;
architecture structural of channelizer_channelizer is 
  signal fir_compiler_7_2_1_s_axis_data_tready_net : std_logic;
  signal fir_compiler_7_2_1_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tlast_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal ready_out_net : std_logic_vector( 1-1 downto 0 );
  signal valid_in_net : std_logic_vector( 1-1 downto 0 );
  signal data_in_net : std_logic_vector( 32-1 downto 0 );
  signal last_in_net : std_logic_vector( 1-1 downto 0 );
  signal reset_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_stb_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_addr_in_net : std_logic_vector( 8-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  ready_in <= fir_compiler_7_2_1_s_axis_data_tready_net;
  valid_out <= fir_compiler_7_2_1_m_axis_data_tvalid_net;
  data_out <= concat_y_net;
  last_out <= fir_compiler_7_2_1_m_axis_data_tlast_net;
  reset_out <= logical_y_net;
  ready_out_net <= ready_out;
  valid_in_net <= valid_in;
  data_in_net <= data_in;
  last_in_net <= last_in;
  reset_in_net <= reset_in;
  set_stb_in_net <= set_stb_in;
  set_addr_in_net <= set_addr_in;
  clk_net <= clk_1;
  ce_net <= ce_1;
  poly_phase_filter : entity xil_defaultlib.channelizer_poly_phase_filter 
  port map (
    ready_out => ready_out_net,
    valid_in => valid_in_net,
    data_in => data_in_net,
    last_in => last_in_net,
    reset_in => logical_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    ready_in => fir_compiler_7_2_1_s_axis_data_tready_net,
    valid_out => fir_compiler_7_2_1_m_axis_data_tvalid_net,
    data_out => concat_y_net,
    last_out => fir_compiler_7_2_1_m_axis_data_tlast_net
  );
  reset_register : entity xil_defaultlib.channelizer_reset_register 
  port map (
    set_stb => set_stb_in_net,
    set_addr => set_addr_in_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    reset_out => delay_q_net
  );
  logical : entity xil_defaultlib.sysgen_logical_9d32272420 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => delay_q_net,
    d1 => reset_in_net,
    y => logical_y_net
  );
end structural;
-- Generated from Simulink block channelizer/implementation_interface_in
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_implementation_interface_in is
  port (
    ready_out : in std_logic;
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    reset_in : in std_logic_vector( 1-1 downto 0 );
    set_addr_in : in std_logic_vector( 8-1 downto 0 );
    set_stb_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 )
  );
end channelizer_implementation_interface_in;
architecture structural of channelizer_implementation_interface_in is 
  signal fir_compiler_7_2_1_s_axis_data_tready_net : std_logic;
  signal data_in_net : std_logic_vector( 32-1 downto 0 );
  signal last_in_net : std_logic_vector( 1-1 downto 0 );
  signal reset_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_addr_in_net : std_logic_vector( 8-1 downto 0 );
  signal set_stb_in_net : std_logic_vector( 1-1 downto 0 );
  signal valid_in_net : std_logic_vector( 1-1 downto 0 );
begin
  fir_compiler_7_2_1_s_axis_data_tready_net <= ready_out;
  data_in_net <= data_in;
  last_in_net <= last_in;
  reset_in_net <= reset_in;
  set_addr_in_net <= set_addr_in;
  set_stb_in_net <= set_stb_in;
  valid_in_net <= valid_in;
end structural;
-- Generated from Simulink block channelizer/implementation_interface_out
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_implementation_interface_out is
  port (
    valid_in : in std_logic;
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic;
    reset_in : in std_logic_vector( 1-1 downto 0 );
    set_strb_in : in std_logic_vector( 1-1 downto 0 );
    set_addr_in : in std_logic_vector( 8-1 downto 0 );
    ready_out : in std_logic_vector( 1-1 downto 0 )
  );
end channelizer_implementation_interface_out;
architecture structural of channelizer_implementation_interface_out is 
  signal fir_compiler_7_2_1_m_axis_data_tvalid_net : std_logic;
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tlast_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal set_stb_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_addr_in_net : std_logic_vector( 8-1 downto 0 );
  signal ready_out_net : std_logic_vector( 1-1 downto 0 );
begin
  fir_compiler_7_2_1_m_axis_data_tvalid_net <= valid_in;
  concat_y_net <= data_in;
  fir_compiler_7_2_1_m_axis_data_tlast_net <= last_in;
  logical_y_net <= reset_in;
  set_stb_in_net <= set_strb_in;
  set_addr_in_net <= set_addr_in;
  ready_out_net <= ready_out;
end structural;
-- Generated from Simulink block channelizer_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_struct is
  port (
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    reset_in : in std_logic_vector( 1-1 downto 0 );
    set_addr_in : in std_logic_vector( 8-1 downto 0 );
    set_data_in : in std_logic_vector( 32-1 downto 0 );
    set_stb_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    ready_out : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    ready_in : out std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 32-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end channelizer_struct;
architecture structural of channelizer_struct is 
  signal data_in_net : std_logic_vector( 32-1 downto 0 );
  signal last_in_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_1_s_axis_data_tready_net : std_logic_vector( 1-1 downto 0 );
  signal reset_in_net : std_logic_vector( 1-1 downto 0 );
  signal set_addr_in_net : std_logic_vector( 8-1 downto 0 );
  signal set_data_in_net : std_logic_vector( 32-1 downto 0 );
  signal set_stb_in_net : std_logic_vector( 1-1 downto 0 );
  signal valid_in_net : std_logic_vector( 1-1 downto 0 );
  signal concat_y_net : std_logic_vector( 32-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tlast_net : std_logic_vector( 1-1 downto 0 );
  signal ready_out_net : std_logic_vector( 1-1 downto 0 );
  signal fir_compiler_7_2_1_m_axis_data_tvalid_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
begin
  data_in_net <= data_in;
  last_in_net <= last_in;
  ready_in <= fir_compiler_7_2_1_s_axis_data_tready_net;
  reset_in_net <= reset_in;
  set_addr_in_net <= set_addr_in;
  set_data_in_net <= set_data_in;
  set_stb_in_net <= set_stb_in;
  valid_in_net <= valid_in;
  data_out <= concat_y_net;
  last_out <= fir_compiler_7_2_1_m_axis_data_tlast_net;
  ready_out_net <= ready_out;
  valid_out <= fir_compiler_7_2_1_m_axis_data_tvalid_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  channelizer_x0 : entity xil_defaultlib.channelizer_channelizer 
  port map (
    ready_out => ready_out_net,
    valid_in => valid_in_net,
    data_in => data_in_net,
    last_in => last_in_net,
    reset_in => reset_in_net,
    set_stb_in => set_stb_in_net,
    set_addr_in => set_addr_in_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    ready_in => fir_compiler_7_2_1_s_axis_data_tready_net(0),
    valid_out => fir_compiler_7_2_1_m_axis_data_tvalid_net(0),
    data_out => concat_y_net,
    last_out => fir_compiler_7_2_1_m_axis_data_tlast_net(0),
    reset_out => logical_y_net
  );
  implementation_interface_in : entity xil_defaultlib.channelizer_implementation_interface_in 
  port map (
    ready_out => fir_compiler_7_2_1_s_axis_data_tready_net(0),
    data_in => data_in_net,
    last_in => last_in_net,
    reset_in => reset_in_net,
    set_addr_in => set_addr_in_net,
    set_stb_in => set_stb_in_net,
    valid_in => valid_in_net
  );
  implementation_interface_out : entity xil_defaultlib.channelizer_implementation_interface_out 
  port map (
    valid_in => fir_compiler_7_2_1_m_axis_data_tvalid_net(0),
    data_in => concat_y_net,
    last_in => fir_compiler_7_2_1_m_axis_data_tlast_net(0),
    reset_in => logical_y_net,
    set_strb_in => set_stb_in_net,
    set_addr_in => set_addr_in_net,
    ready_out => ready_out_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer_default_clock_driver is
  port (
    channelizer_sysclk : in std_logic;
    channelizer_sysce : in std_logic;
    channelizer_sysclr : in std_logic;
    channelizer_clk1 : out std_logic;
    channelizer_ce1 : out std_logic
  );
end channelizer_default_clock_driver;
architecture structural of channelizer_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => channelizer_sysclk,
    sysce => channelizer_sysce,
    sysclr => channelizer_sysclr,
    clk => channelizer_clk1,
    ce => channelizer_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity channelizer is
  port (
    data_in : in std_logic_vector( 32-1 downto 0 );
    last_in : in std_logic_vector( 1-1 downto 0 );
    reset_in : in std_logic_vector( 1-1 downto 0 );
    set_addr_in : in std_logic_vector( 8-1 downto 0 );
    set_data_in : in std_logic_vector( 32-1 downto 0 );
    set_stb_in : in std_logic_vector( 1-1 downto 0 );
    valid_in : in std_logic_vector( 1-1 downto 0 );
    ready_out : in std_logic_vector( 1-1 downto 0 );
    clk : in std_logic;
    ready_in : out std_logic_vector( 1-1 downto 0 );
    data_out : out std_logic_vector( 32-1 downto 0 );
    last_out : out std_logic_vector( 1-1 downto 0 );
    valid_out : out std_logic_vector( 1-1 downto 0 )
  );
end channelizer;
architecture structural of channelizer is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "channelizer,sysgen_core_2015_4,{,compilation=HDL Netlist,block_icon_display=Default,family=kintex7,part=xc7k410t,speed=-2,package=ffg900,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=5,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=5120,concat=1,constant=5,convert=2,counter=2,delay=2,fir_compiler_v7_2=1,inv=2,logical=7,reinterpret=14,relational=3,slice=14,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  channelizer_default_clock_driver : entity xil_defaultlib.channelizer_default_clock_driver 
  port map (
    channelizer_sysclk => clk,
    channelizer_sysce => '1',
    channelizer_sysclr => '0',
    channelizer_clk1 => clk_1_net,
    channelizer_ce1 => ce_1_net
  );
  channelizer_struct : entity xil_defaultlib.channelizer_struct 
  port map (
    data_in => data_in,
    last_in => last_in,
    reset_in => reset_in,
    set_addr_in => set_addr_in,
    set_data_in => set_data_in,
    set_stb_in => set_stb_in,
    valid_in => valid_in,
    ready_out => ready_out,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    ready_in => ready_in,
    data_out => data_out,
    last_out => last_out,
    valid_out => valid_out
  );
end structural;
