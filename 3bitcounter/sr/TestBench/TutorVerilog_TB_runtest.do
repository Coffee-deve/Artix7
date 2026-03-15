setactivelib -work
#Compiling UUT module design files
comp -include $dsn\src\TutorVerilog.v
comp -include "$dsn\src\TestBench\TutorVerilog_TB.v"
asim +access +r TutorVerilog_tb

wave
wave -noreg CLK		
#ex2 : change the signal from synchronous RST to asynchronous CLR	
#wave -noreg RST	
wave -noreg CE
wave -noreg CLR	
wave -noreg DIR
wave -noreg LOAD
wave -noreg DATA   
wave -noreg SEL
wave -noreg OE
wave -noreg Q 
wave -noreg LE
wave -noreg L_DAT

run 6000 ns

#End simulation macro
