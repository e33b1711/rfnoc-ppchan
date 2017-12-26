include $(RFNOC_PPCHAN_DIR)/ip/channelizer_c_counter_binary_v12_0_i0/Makefile.inc
include $(RFNOC_PPCHAN_DIR)/ip/channelizer_c_counter_binary_v12_0_i1/Makefile.inc
include $(RFNOC_PPCHAN_DIR)/ip/channelizer_fir_compiler_v7_2_i0/Makefile.inc
include $(RFNOC_PPCHAN_DIR)/ip/channelizer_xfft_v9_0_i0/Makefile.inc


DESIGN_SRCS += $(abspath \
$(A1_SRCS) \
$(A2_SRCS) \
$(A3_SRCS) \
$(A4_SRCS) \
)


