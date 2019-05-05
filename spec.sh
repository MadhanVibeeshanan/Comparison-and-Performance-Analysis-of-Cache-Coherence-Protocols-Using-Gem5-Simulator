#!/bin/bash
#
# run.sh
 
#gem5 location
gem5Directory='/home/manish/gem5'    

# SPEC2017 benchmark location
Spec17Directory='/home/manish/Spec2017'           
 
# Number of input arguments.
Num_Args=$# 

#The number ofarguments must be equal to 2
if [[ "$Num_Args" != 2 ]]; then 
    echo "run.sh"
    echo "USAGE: run.sh <BENCHMARK> <OUTPUT_DIR>"
    exit
fi
 
# Benchmark name
BENCHMARK=$1 

# Directory to place run output.
OUTPUT_DIR=$2                
 

#Benchmarks 
IMAGICK_CODE=638.imagick_s
EXCHANGE2_CODE=648.exchange2_s
POVRAY_CODE=511.povray_r
LBM_CODE=619.lbm_s
LEELA_CODE=641.leela_s


BENCHMARK_CODE="none"
 
if [[ "$BENCHMARK" == "imagick" ]]; then
    BENCHMARK_CODE=$IMAGICK_CODE
fi
if [[ "$BENCHMARK" == "exchange2" ]]; then
    BENCHMARK_CODE=$EXCHANGE2_CODE
fi
if [[ "$BENCHMARK" == "povray" ]]; then
    BENCHMARK_CODE=$POVRAY_CODE
fi
if [[ "$BENCHMARK" == "lbm" ]]; then
    BENCHMARK_CODE=$LBM_CODE
fi
if [[ "$BENCHMARK" == "leela" ]]; then
    BENCHMARK_CODE=$LEELA_CODE
fi
if [[ "$BENCHMARK_CODE" == "none" ]]; then
    echo "$BENCHMARK does not match!!"
    exit 1
fi
 
if [[ !(-d "$OUTPUT_DIR") ]]; then
    echo "No such output directory: $OUTPUT_DIR "
    exit 1
fi
 
RUN_DIR=$Spec17Directory/benchspec/CPU/$BENCHMARK_CODE/run/run_base_test\_mytest-m64.0000 
Output=$OUTPUT_DIR/$BENCHMARK/logFile.log                                                                   

 
#Gem5 begins
echo ""
echo "Run Directory: $RUN_DIR" | tee -a $Output
cd $RUN_DIR
 

# Command to run Gem5

# Please feel free to change the parameter values of --l1d_size, --l1i_size --l2_size, --mem-size, --cacheline_size (cache line size is the block size).
# --maxinsts must be given or the simulation runs for ever.
# --outdir is used to get the output file (stats.txt) to the desired location.
# --benchmark specifies which benchmark of Spec 2017 must be used.
# --ruby is used to specify that ruby model should be used.
# --caches is used to tell the simulator to use caches.

$gem5Directory/build/X86/gem5.opt --outdir=$OUTPUT_DIR/$BENCHMARK $gem5Directory/configs/example/se.py --benchmark=$BENCHMARK  --num-cpus=4 --ruby --caches --l1d_size=32kB --l1i_size=32kB --l2_size=256kB --cacheline_size=64 --mem-size=512MB --maxinsts=100000 | tee -a $Output