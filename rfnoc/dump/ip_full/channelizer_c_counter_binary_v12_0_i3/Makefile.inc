#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A5_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i3/channelizer_c_counter_binary_v12_0_i3.xci

A5_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i3/, \
channelizer_c_counter_binary_v12_0_i3.xci.out \
synth/channelizer_c_counter_binary_v12_0_i3.vhd \
) 

$(A5_SRCS) $(A5_OUTS) : $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i3/channelizer_c_counter_binary_v12_0_i3.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i3,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
