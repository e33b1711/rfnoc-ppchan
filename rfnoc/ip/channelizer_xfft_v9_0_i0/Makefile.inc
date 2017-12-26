#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A4_SRCS = $(IP_BUILD_DIR)/channelizer_xfft_v9_0_i0/channelizer_xfft_v9_0_i0.xci

A4_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_xfft_v9_0_i0/, \
channelizer_xfft_v9_0_i0.xci.out \
synth/channelizer_xfft_v9_0_i0.vhd \
) 

$(A4_SRCS) $(A4_OUTS) : $(RFNOC_PPCHAN_DIR)/ip/channelizer_xfft_v9_0_i0/channelizer_xfft_v9_0_i0.xci
	$(call BUILD_VIVADO_IP,channelizer_xfft_v9_0_i0,$(ARCH),$(PART_ID),$(RFNOC_PPCHAN_DIR)/ip,$(IP_BUILD_DIR),0)
