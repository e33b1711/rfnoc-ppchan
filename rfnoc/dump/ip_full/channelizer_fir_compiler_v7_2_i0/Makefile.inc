#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A6_SRCS = $(IP_BUILD_DIR)/channelizer_fir_compiler_v7_2_i0/channelizer_fir_compiler_v7_2_i0.xci

A6_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_fir_compiler_v7_2_i0/, \
channelizer_fir_compiler_v7_2_i0.xci.out \
synth/channelizer_fir_compiler_v7_2_i0.vhd \
) 

$(A6_SRCS) $(A6_OUTS) : $(LIB_IP_DIR)/channelizer_fir_compiler_v7_2_i0/channelizer_fir_compiler_v7_2_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_fir_compiler_v7_2_i0,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
