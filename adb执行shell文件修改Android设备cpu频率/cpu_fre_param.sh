#! /system/bin/sh

cd /sys/devices/system/cpu/cpu0/cpufreq
echo userspace > scaling_governor
cat scaling_governor
echo "$1" > scaling_max_freq
cat scaling_cur_freq
cd /sys/devices/system/cpu/cpu1/cpufreq
echo userspace > scaling_governor
cat scaling_governor 
echo "$1" > scaling_max_freq
cat scaling_cur_freq
cd /sys/devices/system/cpu/cpu2/cpufreq
echo userspace > scaling_governor
cat scaling_governor 
echo "$1" > scaling_max_freq
cat scaling_cur_freq
cd /sys/devices/system/cpu/cpu3/cpufreq
echo userspace > scaling_governor
cat scaling_governor
echo "$1" > scaling_max_freq
cat scaling_cur_freq
