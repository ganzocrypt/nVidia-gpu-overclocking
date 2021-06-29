#!/bin/bash

#IF Fans do not work use these two lines, than reboot
#sudo nvidia-xconfig --enable-all-gpus
#sudo nvidia-xconfig --cool-bits=28
 
# Script needs to run as sudo for nvidia-smi settings to take effect.
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
 
# Setting a terminal variable called memoryOffset

# Since all my cards are the same, I'm happy with using the same Memory Transfer Rate Offset
#memoryOffset1050="0"
memoryOffset1060="450"
memoryOffset1070="600" #400
memoryOffset1080="800"
#coreOffset1050="0"
coreOffset1060="0"
coreOffset1070="0" #200
coreOffset1080="200" #100

# Cards Power Watts
#power1050="95"
power1060="95"
power1070="115"
power1080="158" #170

# Cards fan %
fan1050="70"
fan1060="85"
fan1070="88"
fan1080="88"

# Enable nvidia-smi settings so they are persistent the whole time the system is on.
nvidia-smi -pm 1
# Set cards to COMPUTE mode
#echo "Set cards to COMPUTE mode"
#nvidia-smi -c 1

# Set the power limit for each card (note this value is in watts, not percent!
echo "power-limits 1060 - 80%"
nvidia-smi -i 1,2,5,8,9 -pl $power1060
echo "power-limits 1070 Ti - 80%"
nvidia-smi -i 3,4,7,10 -pl $power1070
echo "power-limits 1080 Ti - 75%"
nvidia-smi -i 6 -pl $power1080

echo "Memory, Core and Fans"
#nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1
#nvidia-settings -a [gpu:0]/GPUFanControlState=1
#nvidia-settings -a [fan:0]/GPUTargetFanSpeed=$fan1050

nvidia-settings -a [gpu:1]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[2]=$memoryOffset1060
nvidia-settings -a [gpu:1]/GPUMemoryTransferRateOffset[3]=$memoryOffset1060
nvidia-settings -a [gpu:1]/GPUGraphicsClockOffset[3]=$coreOffset1060
nvidia-settings -a [gpu:1]/GPUFanControlState=1
nvidia-settings -a [fan:1]/GPUTargetFanSpeed=$fan1060

nvidia-settings -a [gpu:2]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffset[2]=$memoryOffset1060
nvidia-settings -a [gpu:2]/GPUMemoryTransferRateOffset[3]=$memoryOffset1060
nvidia-settings -a [gpu:2]/GPUGraphicsClockOffset[3]=$coreOffset1060
nvidia-settings -a [gpu:2]/GPUFanControlState=1
nvidia-settings -a [fan:2]/GPUTargetFanSpeed=$fan1060

nvidia-settings -a [gpu:3]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffset[2]=$memoryOffset1070
nvidia-settings -a [gpu:3]/GPUMemoryTransferRateOffset[3]=$memoryOffset1070
nvidia-settings -a [gpu:3]/GPUGraphicsClockOffset[3]=$coreOffset1070
nvidia-settings -a [gpu:3]/GPUFanControlState=1
nvidia-settings -a [fan:3]/GPUTargetFanSpeed=$fan1070

nvidia-settings -a [gpu:4]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:4]/GPUMemoryTransferRateOffset[2]=$memoryOffset1070
nvidia-settings -a [gpu:4]/GPUMemoryTransferRateOffset[3]=$memoryOffset1070
nvidia-settings -a [gpu:4]/GPUGraphicsClockOffset[3]=$coreOffset1070
nvidia-settings -a [gpu:4]/GPUFanControlState=1
nvidia-settings -a [fan:4]/GPUTargetFanSpeed=$fan1070

nvidia-settings -a [gpu:5]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:5]/GPUMemoryTransferRateOffset[2]=$memoryOffset1060
nvidia-settings -a [gpu:5]/GPUMemoryTransferRateOffset[3]=$memoryOffset1060
nvidia-settings -a [gpu:5]/GPUGraphicsClockOffset[3]=$coreOffset1060
nvidia-settings -a [gpu:5]/GPUFanControlState=1
nvidia-settings -a [fan:5]/GPUTargetFanSpeed=$fan1060

nvidia-settings -a [gpu:6]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:6]/GPUMemoryTransferRateOffset[2]=$memoryOffset1080
nvidia-settings -a [gpu:6]/GPUMemoryTransferRateOffset[3]=$memoryOffset1080
nvidia-settings -a [gpu:6]/GPUGraphicsClockOffset[3]=$coreOffset1080
nvidia-settings -a [gpu:6]/GPUFanControlState=1
nvidia-settings -a [fan:6]/GPUTargetFanSpeed=$fan1080

nvidia-settings -a [gpu:7]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:7]/GPUMemoryTransferRateOffset[2]=$memoryOffset1070
nvidia-settings -a [gpu:7]/GPUMemoryTransferRateOffset[3]=$memoryOffset1070
nvidia-settings -a [gpu:7]/GPUGraphicsClockOffset[3]=$coreOffset1070
nvidia-settings -a [gpu:7]/GPUFanControlState=1
nvidia-settings -a [fan:7]/GPUTargetFanSpeed=$fan1070

nvidia-settings -a [gpu:8]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:8]/GPUMemoryTransferRateOffset[2]=$memoryOffset1060
nvidia-settings -a [gpu:8]/GPUMemoryTransferRateOffset[3]=$memoryOffset1060
nvidia-settings -a [gpu:8]/GPUGraphicsClockOffset[3]=$coreOffset1060
nvidia-settings -a [gpu:8]/GPUFanControlState=1
nvidia-settings -a [fan:8]/GPUTargetFanSpeed=$fan1060

nvidia-settings -a [gpu:9]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:9]/GPUMemoryTransferRateOffset[2]=$memoryOffset1060
nvidia-settings -a [gpu:9]/GPUMemoryTransferRateOffset[3]=$memoryOffset1060
nvidia-settings -a [gpu:9]/GPUGraphicsClockOffset[3]=$coreOffset1060
nvidia-settings -a [gpu:9]/GPUFanControlState=1
nvidia-settings -a [fan:9]/GPUTargetFanSpeed=$fan1060

nvidia-settings -a [gpu:10]/GpuPowerMizerMode=1
nvidia-settings -a [gpu:10]/GPUMemoryTransferRateOffset[2]=$memoryOffset1070
nvidia-settings -a [gpu:10]/GPUMemoryTransferRateOffset[3]=$memoryOffset1070
nvidia-settings -a [gpu:10]/GPUGraphicsClockOffset[3]=$coreOffset1070
nvidia-settings -a [gpu:10]/GPUFanControlState=1
nvidia-settings -a [fan:10]/GPUTargetFanSpeed=$fan1070


# Apply new clocks 1060
#sudo nvidia-smi -i 0,1,4,,7,8 -ac 4004,1961
# Apply new clocks 1070 Ti
#sudo nvidia-smi -i 2,3,6,9 -ac 4004,1911
# Apply new clocks 1080 Ti
#sudo nvidia-smi -i 5 -ac 5505,1936