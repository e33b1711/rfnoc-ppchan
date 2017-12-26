#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A3_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i1/channelizer_c_counter_binary_v12_0_i1.xci

A3_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i1/, \
channelizer_c_counter_binary_v12_0_i1.xci.out \
synth/channelizer_c_counter_binary_v12_0_i1.vhd \
) 

$(A3_SRCS) $(A3_OUTS) : $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i1/channelizer_c_counter_binary_v12_0_i1.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i1,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
