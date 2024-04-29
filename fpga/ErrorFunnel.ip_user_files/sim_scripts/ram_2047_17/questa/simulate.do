onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ram_2047_17_opt

do {wave.do}

view wave
view structure
view signals

do {ram_2047_17.udo}

run -all

quit -force
