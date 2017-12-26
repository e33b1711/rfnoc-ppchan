RFNOC_OOT_SRCS += $(addprefix $(RFNOC_PPCHAN_DIR)/fpga-src/, \
noc_block_chan256.v \
noc_block_chan128.v \
hdl_channelizer/channelizer.v \
hdl_channelizer/convert_type.v \
hdl_channelizer/channelizer_entity_declarations.v \
hdl_channelizer/conv_pkg.v \
hdl_channelizer/synth_reg_w_init.v \
hdl_channelizer/synth_reg.v \
hdl_channelizer/xlclockdriver_rd.v \
)
