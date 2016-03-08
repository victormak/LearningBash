#!/bin/bash

serialNum=$1

#TODO: serial number verification


serialNumLength=${#serialNum}
lastTwoDigts=${serialNum:(serialNumLength-2):(serialNumLength-1)}
ipPrefix='192.168.1.'
targetSOMIp=$ipPrefix${lastTwoDigts}
targetPPCIp=$ipPrefix$(($lastTwoDigts+100))
echo $targetSOMIp
echo $targetPPCIp