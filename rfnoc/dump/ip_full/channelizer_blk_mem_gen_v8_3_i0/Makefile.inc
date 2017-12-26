#
# Copyright 2015 Ettus Research
#

include $(TOOLS_DIR)/make/viv_ip_builder.mak

A1_SRCS = $(IP_BUILD_DIR)/channelizer_blk_mem_gen_v8_3_i0/channelizer_blk_mem_gen_v8_3_i0.xci \
$(IP_BUILD_DIR)/channelizer_blk_mem_gen_v8_3_i0_vivado.coe \

$(info $$A1_SRCS is [${A1_SRCS}])

A1_OUTS = $(addprefix $(IP_BUILD_DIR)/channelizer_blk_mem_gen_v8_3_i0/, \
channelizer_blk_mem_gen_v8_3_i0.xci.out \
synth/channelizer_blk_mem_gen_v8_3_i0.vhd \
) 

$(A1_SRCS) $(A1_OUTS) : $(LIB_IP_DIR)/channelizer_blk_mem_gen_v8_3_i0/channelizer_blk_mem_gen_v8_3_i0.xci $(LIB_IP_DIR)/channelizer_blk_mem_gen_v8_3_i0_vivado.coe
	$(call BUILD_VIVADO_IP,channelizer_blk_mem_gen_v8_3_i0,$(ARCH),$(PART_ID),$(LIB_IP_DIR),$(IP_BUILD_DIR),0)



