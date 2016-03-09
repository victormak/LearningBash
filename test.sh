#!/bin/bash
serialNum=$1

serialNumLenght=${#serialNum}
lastTwoDigts=${serialNum:(serialNumLength-2):(serialNumLenght-1)}
if [ ${lastTwoDigts} -eq 00 ]; then
	lastTwoDigts=100
fi
ipPrefix='192.168.1.'
targetSOMIp=$ipPrefix${lastTwoDigts}
targetPPCIp=$ipPrefix$(($lastTwoDigts+100))
echo $targetSOMIp
echo $targetPPCIp
