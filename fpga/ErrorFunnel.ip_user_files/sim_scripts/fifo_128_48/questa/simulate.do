onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fifo_128_48_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_128_48.udo}

run -all

quit -force
