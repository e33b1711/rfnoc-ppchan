#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 56d406700ff747b6b2f654f85b26f27f -m64 --debug all --relax --mt 8 -d "WORKING_DIR="/home/ak/ootmods/rfnoc-ppchan/rfnoc/testbenches/noc_block_fir_tb"" -L xil_defaultlib -L xbip_utils_v3_0_5 -L c_reg_fd_v12_0_1 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_1 -L xbip_dsp48_addsub_v3_0_1 -L xbip_addsub_v3_0_1 -L c_addsub_v12_0_8 -L c_gate_bit_v12_0_1 -L xbip_counter_v3_0_1 -L c_counter_binary_v12_0_8 -L axi_utils_v2_0_1 -L fir_compiler_v7_2_5 -L c_mux_bit_v12_0_1 -L c_shift_ram_v12_0_8 -L xbip_bram18k_v3_0_1 -L mult_gen_v12_0_10 -L cmpy_v6_0_10 -L floating_point_v7_0_11 -L xfft_v9_0_9 -L unisims_ver -L unimacro_ver -L secureip --snapshot noc_block_fir_tb_behav xil_defaultlib.noc_block_fir_tb xil_defaultlib.glbl -log elaborate.log -timescale 1ns/1ns
