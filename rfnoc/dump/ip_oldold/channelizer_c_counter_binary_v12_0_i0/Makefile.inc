#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A2_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i0/channelizer_c_counter_binary_v12_0_i0.xci

A2_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i0/, \
channelizer_c_counter_binary_v12_0_i0.xci.out \
synth/channelizer_c_counter_binary_v12_0_i0.vhd \
) 

$(A2_SRCS) $(A2_OUTS) : $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i0/channelizer_c_counter_binary_v12_0_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i0,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
