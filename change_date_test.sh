#!/bin/bash
date="2016-01-01 00:00:01"
echo "date to set: $date"
date -s '($date) +"%Y-%m-%d %T"'
