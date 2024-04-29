onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ram_4096_27_opt

do {wave.do}

view wave
view structure
view signals

do {ram_4096_27.udo}

run -all

quit -force
