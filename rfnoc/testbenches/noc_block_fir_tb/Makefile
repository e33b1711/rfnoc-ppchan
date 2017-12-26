

# 
# Copyright 2017 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

#-------------------------------------------------
# Top-of-Makefile
#-------------------------------------------------
# Define BASE_DIR to point to the "top" dir
BASE_DIR = $(FPGA_TOP_DIR)/usrp3/top
# Include viv_sim_preample after defining BASE_DIR
include $(BASE_DIR)/../tools/make/viv_sim_preamble.mak

#-------------------------------------------------
# IP Specific
#-------------------------------------------------
# If simulation contains IP, define the IP_DIR and point
# it to the base level IP directory
LIB_IP_DIR = /home/ak/ootmods/rfnoc-ppchan/rfnoc/ip
$(info $$LIB_IP_DIR is [${LIB_IP_DIR}])

# Include makefiles and sources for all IP components
# *after* defining the LIB_IP_DIR

#include $(LIB_IP_DIR)/channelizer_dist_mem_gen_v8_0_i0/Makefile.inc
include $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i0/Makefile.inc
include $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i1/Makefile.inc
#include $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i2/Makefile.inc
#include $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i3/Makefile.inc
include $(LIB_IP_DIR)/channelizer_fir_compiler_v7_2_i0/Makefile.inc
include $(LIB_IP_DIR)/channelizer_xfft_v9_0_i0/Makefile.inc
#include $(LIB_IP_DIR)/channelizer_fifo_generator_v13_0_i0/Makefile.inc



DESIGN_SRCS += $(abspath \
$(A2_SRCS) \
$(A3_SRCS) \
$(A6_SRCS) \
$(A7_SRCS) \
)


#-------------------------------------------------
# Testbench Specific
#-------------------------------------------------
# Define only one toplevel module
SIM_TOP = noc_block_fir_tb

# Add test bench, user design under test, and
# additional user created files
SIM_SRCS = \
$(abspath noc_block_fir_tb.sv) \
$(abspath ../../fpga-src/noc_block_fir.v) \
$(abspath vhdl/channelizer.vhd) \
$(abspath vhdl/channelizer_entity_declarations.vhd) \
$(abspath vhdl/conv_pkg.vhd) \
$(abspath vhdl/single_reg_w_init.vhd) \
$(abspath vhdl/srl17e.vhd) \
$(abspath vhdl/synth_reg.vhd) \
$(abspath vhdl/synth_reg_reg.vhd) \
$(abspath vhdl/synth_reg_w_init.vhd) \
$(abspath vhdl/xlclockdriver_rd.vhd) \



MODELSIM_USER_DO =

#-------------------------------------------------
# Bottom-of-Makefile
#-------------------------------------------------
# Include all simulator specific makefiles here
# Each should define a unique target to simulate
# e.g. xsim, vsim, etc and a common "clean" target
include $(BASE_DIR)/../tools/make/viv_simulator.mak
