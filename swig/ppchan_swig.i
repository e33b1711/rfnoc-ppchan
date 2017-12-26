/* -*- c++ -*- */

#define PPCHAN_API
#define ETTUS_API

%include "gnuradio.i"/*			*/// the common stuff

//load generated python docstrings
%include "ppchan_swig_doc.i"
//Header from gr-ettus
%include "ettus/device3.h"
%include "ettus/rfnoc_block.h"
%include "ettus/rfnoc_block_impl.h"

%{
#include "ettus/device3.h"
#include "ettus/rfnoc_block_impl.h"
#include "ppchan/chan128.h"
#include "ppchan/chan256.h"
%}

%include "ppchan/chan128.h"
GR_SWIG_BLOCK_MAGIC2(ppchan, chan128);
%include "ppchan/chan256.h"
GR_SWIG_BLOCK_MAGIC2(ppchan, chan256);

