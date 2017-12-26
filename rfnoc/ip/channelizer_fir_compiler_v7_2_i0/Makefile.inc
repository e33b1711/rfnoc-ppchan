#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A3_SRCS = $(IP_BUILD_DIR)/channelizer_fir_compiler_v7_2_i0/channelizer_fir_compiler_v7_2_i0.xci

A3_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_fir_compiler_v7_2_i0/, \
channelizer_fir_compiler_v7_2_i0.xci.out \
synth/channelizer_fir_compiler_v7_2_i0.vhd \
) 

$(A3_SRCS) $(A3_OUTS) : $(RFNOC_PPCHAN_DIR)/ip/channelizer_fir_compiler_v7_2_i0/channelizer_fir_compiler_v7_2_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_fir_compiler_v7_2_i0,$(ARCH),$(PART_ID),$(RFNOC_PPCHAN_DIR)/ip,$(IP_BUILD_DIR),0)
