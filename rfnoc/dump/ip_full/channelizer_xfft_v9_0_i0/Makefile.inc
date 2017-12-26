#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A7_SRCS = $(IP_BUILD_DIR)/channelizer_xfft_v9_0_i0/channelizer_xfft_v9_0_i0.xci

A7_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_xfft_v9_0_i0/, \
channelizer_xfft_v9_0_i0.xci.out \
synth/channelizer_xfft_v9_0_i0.vhd \
) 

$(A7_SRCS) $(A7_OUTS) : $(LIB_IP_DIR)/channelizer_xfft_v9_0_i0/channelizer_xfft_v9_0_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_xfft_v9_0_i0,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)
