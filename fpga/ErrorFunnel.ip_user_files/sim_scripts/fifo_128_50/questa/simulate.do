onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib fifo_128_50_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_128_50.udo}

run -all

quit -force
