#!/usr/bin/wish
proc getFocus {} { 
         focus -force .
         raise .
         after 5000 getFocus
 }
 
         tk_setPalette #de9ade
         wm withdraw .
         wm state . normal
 
         label .ed1 -text "Please Choose" -width 40 -height 5
         frame .f
         button .f.byes -text "Shutdown" -command { exit 1 } -height 3 -width 18;
         button .f.bno -text "Back" -command { exit 0 } -height 3 -width 18;
         grid .f.byes .f.bno -sticky news
         pack .ed1 .f -side top
         wm geometry . 340x240+160+120
         wm title . "CONFIRMATION"
 
         getFocus

