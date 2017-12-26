#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A1_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i0/channelizer_c_counter_binary_v12_0_i0.xci

A1_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i0/, \
channelizer_c_counter_binary_v12_0_i0.xci.out \
synth/channelizer_c_counter_binary_v12_0_i0.vhd \
) 

$(A1_SRCS) $(A1_OUTS) : $(RFNOC_PPCHAN_DIR)/ip/channelizer_c_counter_binary_v12_0_i0/channelizer_c_counter_binary_v12_0_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i0,$(ARCH),$(PART_ID),$(RFNOC_PPCHAN_DIR)/ip,$(IP_BUILD_DIR),0)
