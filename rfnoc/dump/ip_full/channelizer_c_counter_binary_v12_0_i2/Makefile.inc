#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A4_SRCS = $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i2/channelizer_c_counter_binary_v12_0_i2.xci

A4_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_c_counter_binary_v12_0_i2/, \
channelizer_c_counter_binary_v12_0_i2.xci.out \
synth/channelizer_c_counter_binary_v12_0_i2.vhd \
) 

$(A4_SRCS) $(A4_OUTS) : $(LIB_IP_DIR)/channelizer_c_counter_binary_v12_0_i2/channelizer_c_counter_binary_v12_0_i2.xci
	$(call BUILD_VIVADO_IP,channelizer_c_counter_binary_v12_0_i2,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
