#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A2_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i1/channelizer_c_counter_binary_v12_0_i1.xci

A2_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i1/, \
channelizer_c_counter_binary_v12_0_i1.xci.out \
synth/channelizer_c_counter_binary_v12_0_i1.vhd \
) 

$(A2_SRCS) $(A2_OUTS) : $(RFNOC_PPCHAN_DIR)/ip/channelizer_c_counter_binary_v12_0_i1/channelizer_c_counter_binary_v12_0_i1.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i1,$(ARCH),$(PART_ID),$(RFNOC_PPCHAN_DIR)/ip,$(IP_BUILD_DIR),0)
