#!/usr/bin/env wish

proc getFocus {} { 
	focus -force .
	raise .
	after 5000 getFocus
}

tk_setPalette #de9ade
wm withdraw .
wm state . normal

set rack_num "1"
set imb_num "1"

frame .ftitle
label .ftitle.ed0 -text "SX-3000 IP Generation" -width 40 -height 2
grid .ftitle.ed0 -sticky news

frame .f1
label .f1.ed1 -text "Rack Number (1~19)" -width 40 -height 2
grid .f1.ed1 -sticky news

frame .f2
listbox .f2.lb1 -height 5 -exportselection 0 -selectbackground #ffffff
.f2.lb1 insert end "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19"
scrollbar .f2.sb1 -command [list .f2.lb1 yview ]
.f2.lb1 configure -yscrollcommand [list .f2.sb1 set]
bind .f2.lb1 <<ListboxSelect>> { setRackLabel [%W curselection] }
grid .f2.lb1 .f2.sb1 -sticky news

frame .f3
label .f3.ed2 -text "IMB Number (1~5)" -width 40 -height 2
grid .f3.ed2 -sticky news

frame .f4
listbox .f4.lb2 -height 5 -exportselection 0 -selectbackground #ffffff 
.f4.lb2 insert end "1" "2" "3" "4" "5"
scrollbar .f4.sb2 -command [list .f4.lb2 yview ]
.f4.lb2 configure -yscrollcommand [list .f4.sb2 set]
bind .f4.lb2 <<ListboxSelect>> { setIMBLabel [%W curselection] }
grid .f4.lb2 .f4.sb2 -sticky news

label .ed3 -text "Rack Number Chosen: $rack_num" -width 40 -height 2
label .ed4 -text "IMB  Number Chosen: $imb_num" -width 40 -height 2

proc setRackLabel { idx } {
	global rack_num
	set rack_num [.f2.lb1 get $idx]
	.ed3 configure -text "Rack Number Chosen: $rack_num"
}

proc setIMBLabel { idx } {
	global imb_num
	set imb_num [.f4.lb2 get $idx]
	.ed4 configure -text "IMB Number Chosen: $imb_num"
}

frame .f
button .f.byes -text "Confirm" -command { 
  set result [ expr ($rack_num-1)*5+$imb_num ] 
  puts "rack_num=$rack_num"
  puts "imb_num=$imb_num"
  #puts "$rack_num:$imb_num"
  exit 0 } -height 2 -width 18;
grid .f.byes -sticky news

pack .ftitle .f1 .f2 .f3 .f4 .ed3 .ed4 .f -side top
wm geometry . 640x480+0+0
wm title . "CONFIRMATION"

getFocus
