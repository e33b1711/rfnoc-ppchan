#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim noc_block_fir_tb_behav -key {Behavioral:sim_1:Functional:noc_block_fir_tb} -tclbatch noc_block_fir_tb.tcl -log simulate.log
