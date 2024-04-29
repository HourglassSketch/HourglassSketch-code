onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ram_16384_4_opt

do {wave.do}

view wave
view structure
view signals

do {ram_16384_4.udo}

run -all

quit -force
