#Makefile for UVM Testbench

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = Questa

FSDB_PATH=/home/cad/eda/SYNOPSYS/VERDI_2022/verdi/T-2022.06-SP1/share/PLI/VCS/LINUX64


RTL= ../rtl/*
work= work #library name
SVTB1= ../tb/uart_tb_top.sv ../tb/uart_assertions.sv
INC = +incdir+../tb +incdir+../test +incdir+../uart_agt_top
SVTB2 = ../test/uart_pkg.sv
VSIMOPT= -vopt -voptargs=+acc 
VSIMCOV= -coverage -sva 
VSIMBATCH1= -c -do  " log -r /* ;coverage save -onexit uart_cov1;run -all; exit"
VSIMBATCH2= -c -do  " log -r /* ;coverage save -onexit uart_cov2;run -all; exit"
VSIMBATCH3= -c -do  " log -r /* ;coverage save -onexit uart_cov3;run -all; exit"
VSIMBATCH4= -c -do  " log -r /* ;coverage save -onexit uart_cov4;run -all; exit"
VSIMBATCH5= -c -do  " log -r /* ;coverage save -onexit uart_cov5;run -all; exit"
VSIMBATCH6= -c -do  " log -r /* ;coverage save -onexit uart_cov6;run -all; exit"
VSIMBATCH7= -c -do  " log -r /* ;coverage save -onexit uart_cov7;run -all; exit"
VSIMBATCH8= -c -do  " log -r /* ;coverage save -onexit uart_cov8;run -all; exit"
VSIMBATCH9= -c -do  " log -r /* ;coverage save -onexit uart_cov9;run -all; exit"


help:
	@echo "============================================================================================================="
	@echo "! USAGE          --  make target                                                                            !"
	@echo "! clean          =>  clean the earlier log and intermediate files.                                          !"
	@echo "! sv_cmp         =>  Create library and compile the code.                                                   !"
	@echo "! run_test1      =>  clean, compile & run the simulation for full_duplex_test in batch mode.                !" 
	@echo "! run_test2      =>  clean, compile & run the simulation for half_duplex_test in batch mode.                !" 
	@echo "! run_test3      =>  clean, compile & run the simulation for loop_back_test in batch mode.                  !"
	@echo "! run_test4      =>  clean, compile & run the simulation for parity_test in batch mode.                     !" 
	@echo "! run_test5      =>  clean, compile & run the simulation for break_error_test in batch mode.                !" 
	@echo "! run_test6      =>  clean, compile & run the simulation for overrun_error_test in batch mode.              !" 
	@echo "! run_test7      =>  clean, compile & run the simulation for framing_error_test in batch mode.              !"
	@echo "! run_test8      =>  clean, compile & run the simulation for thr_empty_test in batch mode.                  !" 
	@echo "! run_test9      =>  clean, compile & run the simulation for time_out_error_test in batch mode.             !" 
	@echo "! view_wave1     =>  To view the waveform of full_duplex_test.                                              !" 
	@echo "! view_wave2     =>  To view the waveform of half_duplex_test.                                              !" 
	@echo "! view_wave3     =>  To view the waveform of loop_back_test.                                                !" 
	@echo "! view_wave4     =>  To view the waveform of parity_test.                                                   !" 
	@echo "! view_wave5     =>  To view the waveform of break_error_test.                                              !" 
	@echo "! view_wave6     =>  To view the waveform of overrun_error_test.                                            !" 
	@echo "! view_wave7     =>  To view the waveform of framing_error_test.                                            !" 
	@echo "! view_wave8     =>  To view the waveform of thr_empty_test.                                                !" 
	@echo "! view_wave9     =>  To view the waveform of time_out_error_test.                                           !" 
	@echo "! regress        =>  clean, compile and run all testcases in batch mode.                                    !"
	@echo "! report         =>  To merge coverage reports for all testcases and  convert to html format.               !"
	@echo "! cov            =>  To open merged coverage report in html format.                                         !"
	@echo "============================================================================================================="

clean 	   : clean_$(SIMULATOR)
sv_cmp     : sv_cmp_$(SIMULATOR)
run_test1  : run_test1_$(SIMULATOR)
run_test2  : run_test2_$(SIMULATOR)
run_test3  : run_test3_$(SIMULATOR)
run_test4  : run_test4_$(SIMULATOR)
run_test5  : run_test5_$(SIMULATOR)
run_test6  : run_test6_$(SIMULATOR)
run_test7  : run_test7_$(SIMULATOR)
run_test8  : run_test8_$(SIMULATOR)
run_test9  : run_test9_$(SIMULATOR)
view_wave1 : view_wave1_$(SIMULATOR)
view_wave2 : view_wave2_$(SIMULATOR)
view_wave3 : view_wave3_$(SIMULATOR)
view_wave4 : view_wave4_$(SIMULATOR)
view_wave5 : view_wave5_$(SIMULATOR)
view_wave6 : view_wave6_$(SIMULATOR)
view_wave7 : view_wave7_$(SIMULATOR)
view_wave8 : view_wave8_$(SIMULATOR)
view_wave9 : view_wave9_$(SIMULATOR)
regress    : regress_$(SIMULATOR)
report     : report_$(SIMULATOR)
cov        : cov_$(SIMULATOR)

# ----------------------------- Start of Definitions for Mentor's Questa Specific Targets -------------------------------#

sv_cmp_Questa:
	vlib $(work)
	vmap work $(work)
	vlog -work $(work) $(RTL) $(INC) $(SVTB2) $(SVTB1) 	
	
run_test1_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH1)  -wlf wave_file1.wlf -l test1.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=full_duplex_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov1
	
run_test2_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH2)  -wlf wave_file2.wlf -l test2.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=half_duplex_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov2
	
run_test3_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH3)  -wlf wave_file3.wlf -l test3.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=loop_back_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov3
	
run_test4_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH4)  -wlf wave_file4.wlf -l test4.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=parity_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov4

run_test5_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH5)  -wlf wave_file5.wlf -l test5.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=break_error_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov5
	
run_test6_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH6)  -wlf wave_file6.wlf -l test6.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=overrun_error_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov6
	
run_test7_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH7)  -wlf wave_file7.wlf -l test7.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=framing_error_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov7
	
run_test8_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH8)  -wlf wave_file8.wlf -l test8.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=thr_empty_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov8

run_test9_Questa: clean sv_cmp
	vsim -cvgperinstance $(VSIMOPT) $(VSIMCOV) $(VSIMBATCH9)  -wlf wave_file9.wlf -l test9.log  -sv_seed random  work.uart_tb_top +UVM_VERBOSITY=UVM_MEDIUM +UVM_TESTNAME=time_out_error_test
	vcover report  -cvg  -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov9
	
view_wave1_Questa:
	vsim -view wave_file1.wlf
	
view_wave2_Questa:
	vsim -view wave_file2.wlf
	
view_wave3_Questa:
	vsim -view wave_file3.wlf
	
view_wave4_Questa:
	vsim -view wave_file4.wlf

view_wave5_Questa:
	vsim -view wave_file5.wlf
	
view_wave6_Questa:
	vsim -view wave_file6.wlf
	
view_wave7_Questa:
	vsim -view wave_file7.wlf
	
view_wave8_Questa:
	vsim -view wave_file8.wlf

view_wave9_Questa:
	vsim -view wave_file9.wlf

report_Questa:
	vcover merge uart_cov uart_cov1 uart_cov2 uart_cov3 uart_cov4 uart_cov5 uart_cov6 uart_cov7 uart_cov8 uart_cov9
	vcover report -cvg -details -nocompactcrossbins -codeAll -assert -directive -html uart_cov

regress_Questa: clean_Questa run_test1_Questa run_test2_Questa run_test3_Questa run_test4_Questa run_test5_Questa run_test6_Questa run_test7_Questa run_test8_Questa run_test9_Questa report_Questa cov_Questa

cov_Questa:
	firefox covhtmlreport/index.html& 
	
clean_Questa:
	rm -rf transcript* *log* fcover* covhtml* uart_cov* *.wlf modelsim.ini work
	clear

# ----------------------------- End of Definitions for Mentor's Questa Specific Targets -------------------------------#

# ----------------------------- Start of Definitions for Synopsys's VCS Specific Targets -------------------------------#

sv_cmp_VCS:
	vcs -l vcs.log -timescale=1ns/1ps -sverilog -ntb_opts uvm -debug_access+all -full64 -kdb -cm assert -lca -P $(FSDB_PATH)/novas.tab $(FSDB_PATH)/pli.a $(RTL) $(INC) $(SVTB2) $(SVTB1)
		      
run_test_VCS:	clean  sv_cmp_VCS
	./simv -a vcs.log +fsdbfile+wave1.fsdb -cm_dir ./uart_cov1 +ntb_random_seed_automatic +UVM_VERBOSITY=UVM_NONE +UVM_TESTNAME=full_duplex_test
	urg -dir uart_cov1.vdb -format both -report urgReport1
	
run_test1_VCS:	
	./simv -a vcs.log +fsdbfile+wave2.fsdb -cm_dir ./uart_cov2 +ntb_random_seed_automatic +UVM_TESTNAME=half_duplex_test 
	urg -dir uart_cov2.vdb -format both -report urgReport2
	
run_test2_VCS:	
	./simv -a vcs.log +fsdbfile+wave3.fsdb -cm_dir ./uart_cov3 +ntb_random_seed_automatic +UVM_TESTNAME=ram_odd_addr_test 
	urg -dir uart_cov3.vdb -format both -report urgReport3
	
run_test3_VCS:	
	./simv -a vcs.log +fsdbfile+wave4.fsdb -cm_dir ./uart_cov4 +ntb_random_seed_automatic +UVM_TESTNAME=ram_even_addr_test 
	urg -dir uart_cov4.vdb -format both -report urgReport4
	
view_wave1_VCS: 
	verdi -ssf wave1.fsdb
	
view_wave2_VCS: 
	verdi -ssf wave2.fsdb

view_wave3_VCS: 
	verdi -ssf wave3.fsdb

view_wave4_VCS: 
	verdi -ssf wave4.fsdb		
	
report_VCS:
	urg -dir uart_cov1.vdb uart_cov2.vdb uart_cov3.vdb uart_cov4.vdb -dbname merged_dir/merged_test -format both -report urgReport

regress_VCS: clean_VCS sv_cmp_VCS run_test_VCS run_test1_VCS run_test2_VCS run_test3_VCS report_VCS

cov_VCS:
	verdi -cov -covdir merged_dir.vdb

clean_VCS:
	rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h urgReport* *.fsdb novas* verdi*
	clear

# ----------------------------- END of Definitions for Synopsys's VCS Specific Targets -------------------------------#
