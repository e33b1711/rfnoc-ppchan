#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A8_SRCS = $(IP_BUILD_DIR)/channelizer_fifo_generator_v13_0_i0/channelizer_fifo_generator_v13_0_i0.xci

A8_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_fifo_generator_v13_0_i0/, \
channelizer_fifo_generator_v13_0_i0.xci.out \
synth/channelizer_fifo_generator_v13_0_i0.vhd \
) 

$(A8_SRCS) $(A6_OUTS) : $(LIB_IP_DIR)/channelizer_fifo_generator_v13_0_i0/channelizer_fifo_generator_v13_0_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_fifo_generator_v13_0_i0,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
