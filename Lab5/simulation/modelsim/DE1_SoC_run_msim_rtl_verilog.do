transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/Shared\ drives/EE\ 371/Lab5/Lab5 {G:/Shared drives/EE 371/Lab5/Lab5/pt2_fir.v}

