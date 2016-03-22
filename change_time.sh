#!/bin/bash

str=$(./sx-3000-ip-generation.tcl)
echo $str
rack_num=`echo "$str" | grep rack_num | sed 's/^rack_num=//'`
imb_num=`echo "$str" | grep imb_num | sed 's/^imb_num=//'`

#rack=$(echo $str | cut -d ":" -f 1)
echo $rack_num
echo $imb_num
