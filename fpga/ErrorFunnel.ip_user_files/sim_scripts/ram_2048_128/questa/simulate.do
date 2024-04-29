onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ram_2048_128_opt

do {wave.do}

view wave
view structure
view signals

do {ram_2048_128.udo}

run -all

quit -force
