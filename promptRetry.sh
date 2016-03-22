#!/bin/bash

message=$1

/usr/bin/wish <<EOT

proc getFocus {} { 
	focus -force .
	raise .
	after 5000 getFocus
}

    tk_setPalette #de9ade
    wm withdraw .
    wm state . normal

#    label .ed1 -text "TMS CONNECTION\n" -width 40 -height 5
    label .ed2 -text "$message" -width 45 -height 5
    frame .f
    button .f.bretry -text "Retry" -command { exit 1 } -height 3 -width 18;
#    button .f.bno -text "$b_no" -command { exit 1 } -height 3 -width 18;
    grid .f.bretry  -sticky news
    pack .ed2 .f -side top
    wm geometry . 340x240+160+120
    wm title . "TMS CONNECTION"
    getFocus
EOT
