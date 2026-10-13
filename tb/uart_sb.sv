class uart_sb extends uvm_scoreboard;

  `uvm_component_utils(uart_sb)

  uvm_tlm_analysis_fifo #(uart_trans) sb_tlm_port[2];
  uart_trans th[2];

  int no_of_pass, no_of_fails;

  covergroup APB_0_cg;
    PRESETN: coverpoint th[0].Presetn {bins Presetn = {[0 : 1]};}
    PADDR: coverpoint th[0].Paddr {bins Paddr = {[0 : $]};}
    PWDATA: coverpoint th[0].Pwdata {bins Pwdata = {[0 : $]};}
    PWRITE: coverpoint th[0].Pwrite {bins Pwrite = {[0 : 1]};}
    PENABLE: coverpoint th[0].Penable {bins Pneable = {[0 : 1]};}
    PSEL: coverpoint th[0].Psel {bins Psel = {[0 : 1]};}
    PRDATA: coverpoint th[0].Prdata {bins Prdata = {[0 : $]};}
    PREADY: coverpoint th[0].Pready {bins Pready = {[0 : 1]};}
    PSLVERR: coverpoint th[0].Pslverr {bins Pslverr = {[0 : 1]};}
    IRQ: coverpoint th[0].IRQ {bins IRQ = {[0 : 1]};}
    BAUD_O: coverpoint th[0].baud_o {bins baud_o = {[0 : 1]};}
  endgroup : APB_0_cg

  covergroup APB_1_cg;
    PRESETN: coverpoint th[1].Presetn {bins Presetn = {[0 : 1]};}
    PADDR: coverpoint th[1].Paddr {bins Paddr = {[0 : $]};}
    PWDATA: coverpoint th[1].Pwdata {bins Pwdata = {[0 : $]};}
    PWRITE: coverpoint th[1].Pwrite {bins Pwrite = {[0 : 1]};}
    PENABLE: coverpoint th[1].Penable {bins Pneable = {[0 : 1]};}
    PSEL: coverpoint th[1].Psel {bins Psel = {[0 : 1]};}
    PRDATA: coverpoint th[1].Prdata {bins Prdata = {[0 : $]};}
    PREADY: coverpoint th[1].Pready {bins Pready = {[0 : 1]};}
    PSLVERR: coverpoint th[1].Pslverr {bins Pslverr = {[0 : 1]};}
    IRQ: coverpoint th[1].IRQ {bins IRQ = {[0 : 1]};}
    BAUD_O: coverpoint th[1].baud_o {bins baud_o = {[0 : 1]};}
  endgroup : APB_1_cg

  covergroup UART_0_REG_cg;
    DIV: coverpoint th[0].DIV {bins DIV = {16'd27};}
    LCR: coverpoint th[0].LCR {bins LCR[] = {8'h03, 8'h0b, 8'h43};}
    FCR: coverpoint th[0].FCR {bins FCR = {8'h06};}
    IER: coverpoint th[0].IER {bins IER[] = {8'h00, 8'h02, 8'h04, 8'h05};}
    THR: coverpoint th[0].THR[$] {bins THR = {[0 : $]};}
    RBR: coverpoint th[0].RBR[$] {bins RBR = {[0 : $]};}
    IIR: coverpoint th[0].IIR[3:0] {bins IIR[] = {4'h2, 4'h4, 4'h6, 4'hc};}
    MCR: coverpoint th[0].MCR {bins MCR = {8'h10};}
    LSR0: coverpoint th[0].LSR[0] {bins LSR0[] = {0, 1};}
    LSR1: coverpoint th[0].LSR[1] {bins LSR1[] = {0, 1};}
    LSR2: coverpoint th[0].LSR[2] {bins LSR2[] = {0, 1};}
    LSR4: coverpoint th[0].LSR[4] {bins LSR4[] = {0, 1};}
  endgroup : UART_0_REG_cg

  covergroup UART_1_REG_cg;
    DIV: coverpoint th[1].DIV {bins DIV = {16'd54};}
    LCR: coverpoint th[1].LCR {bins LCR[] = {8'h00, 8'h03, 8'h1b, 8'h43};}
    FCR: coverpoint th[1].FCR {bins FCR = {8'h06};}
    IER: coverpoint th[1].IER {bins IER[] = {8'h00, 8'h02, 8'h04, 8'h05};}
    THR: coverpoint th[1].THR[$] {bins THR = {[0 : $]};}
    RBR: coverpoint th[1].RBR[$] {bins RBR = {[0 : $]};}
    IIR: coverpoint th[1].IIR[3:0] {bins IIR[] = {4'h2, 4'h4, 4'h6, 4'hc};}
    MCR: coverpoint th[1].MCR {bins MCR = {8'h10};}
    LSR0: coverpoint th[1].LSR[0] {bins LSR0[] = {0, 1};}
    LSR1: coverpoint th[1].LSR[1] {bins LSR1[] = {0, 1};}
    LSR2: coverpoint th[1].LSR[2] {bins LSR2[] = {0, 1};}
    LSR3: coverpoint th[1].LSR[3] {bins LSR3[] = {0, 1};}
    LSR4: coverpoint th[1].LSR[4] {bins LSR4[] = {0, 1};}
  endgroup : UART_1_REG_cg
 
  extern function new(string name = "uart_sb", uvm_component parent);
  extern task collect_reset_data;
  extern task run_phase(uvm_phase phase);
  extern function void check_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);

endclass : uart_sb

function uart_sb::new(string name = "uart_sb", uvm_component parent);
  super.new(name, parent);
  foreach (sb_tlm_port[i]) begin
    sb_tlm_port[i] = new($sformatf("sb_tlm_port[%0d]", i), this);
  end
  APB_0_cg = new;
  UART_0_REG_cg = new;

  APB_1_cg = new;
  UART_1_REG_cg = new;
 endfunction : new

task uart_sb::collect_reset_data;
  fork
    begin
      sb_tlm_port[0].get(th[0]);
      APB_0_cg.sample;
    end
    begin
      sb_tlm_port[1].get(th[1]);
      APB_1_cg.sample;
    end
  join
endtask : collect_reset_data

task uart_sb::run_phase(uvm_phase phase);
  collect_reset_data;
  fork
    forever begin
      sb_tlm_port[0].get(th[0]);
      APB_0_cg.sample;
      UART_0_REG_cg.sample; 
    end
    forever begin
      sb_tlm_port[1].get(th[1]);
      APB_1_cg.sample;
      UART_1_REG_cg.sample; 
    end
  join
endtask : run_phase

function void uart_sb::check_phase(uvm_phase phase);
  `uvm_info("UART_SB", $sformatf("UART_MONITOR[0]\n%s", th[0].sprint), UVM_MEDIUM)
  `uvm_info("UART_SB", $sformatf("UART_MONITOR[1]\n%s", th[1].sprint), UVM_MEDIUM)

  // Full-Duplex, Half-Duplex & Loopback Test
  if((th[0].LCR == 8'h03 && th[0].FCR == 8'h06 && th[0].IER == 8'h05) || (th[1].LCR == 32'h03 && th[1].FCR == 8'h06 && th[1].IER == 8'h05)) begin
    if((th[0].IIR[3:0] == 4'h4 && th[0].THR == th[1].RBR) && (th[1].IIR[3:0] == 4'h4 && th[1].THR == th[0].RBR)) begin
      `uvm_info("UART_SB", "Full-Duplex test passed", UVM_MEDIUM)
      no_of_pass++;
    end else if((th[0].IIR[3:0] == 4'h4 && th[0].THR == th[1].RBR) || (th[1].IIR[3:0] == 4'h4 && th[1].THR == th[0].RBR)) begin
      `uvm_info("UART_SB", "Half-Duplex test passed", UVM_MEDIUM)
      no_of_pass++;
    end else if((th[0].MCR == 8'h10 && th[0].IIR[3:0] == 4'h4 && th[0].THR == th[0].RBR) || (th[1].MCR == 8'h10 && th[1].IIR[3:0] == 4'h4 && th[1].THR == th[1].RBR)) begin
      `uvm_info("UART_SB", "Loopback test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Full-Duplex/Half-Duplex/Loopback test failed")
      no_of_fails++;
    end
  end

  // Parity Error Test
  if (th[0].LCR[3] && th[1].LCR[3] && th[0].LCR[4] != th[1].LCR[4]) begin
    if (th[0].LSR[2] || th[1].LSR[2]) begin
      `uvm_info("UART_SB", "Parity error test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Parity error test failed")
      no_of_fails++;
    end
  end

  // Break Error Test
  if (th[0].LCR[6] || th[1].LCR[6]) begin
    if (th[0].LSR[4] || th[1].LSR[4]) begin
      `uvm_info("UART_SB", "Break error test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Break error test failed")
      no_of_fails++;
    end
  end

  // Overrun Error Test
  if((th[0].IER == 8'h4 && th[0].THR.size == 17) || (th[1].IER == 8'h4 && th[1].THR.size == 17)) begin
    if (th[0].LSR[1] || th[1].LSR[1]) begin
      `uvm_info("UART_SB", "Overrun error test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Overrun error test failed")
      no_of_fails++;
    end
  end

  // Framing Error Test
  if (th[0].LCR[1:0] != th[1].LCR[1:0]) begin
    if (th[0].LSR[3] || th[1].LSR[3]) begin
      `uvm_info("UART_SB", "Framing error test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Framing error test failed")
      no_of_fails++;
    end
  end

  // THR Empty Test
  if ((th[0].THR.size == 0 && th[0].IER[1]) || (th[1].THR.size == 0 && th[1].IER[1])) begin
    if (th[0].IIR[3:0] == 4'h2 || th[1].IIR[3:0] == 4'h2) begin
      `uvm_info("UART_SB", "THR empty test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "THR empty test failed")
      no_of_fails++;
    end
  end

  // Time-out Error Test
  if((th[0].IER == 8'h0 && th[0].THR.size == 17) || (th[1].IER == 8'h0 && th[1].THR.size == 17)) begin
    if (th[0].IIR[3:0] == 4'hc || th[1].IIR[3:0] == 4'hc) begin
      `uvm_info("UART_SB", "Time-out error test passed", UVM_MEDIUM)
      no_of_pass++;
    end else begin
      `uvm_error("UART_SB", "Time-out error test failed")
      no_of_fails++;
    end
  end
endfunction : check_phase

function void uart_sb::report_phase(uvm_phase phase);
  super.report_phase(phase);
  $display("\n------------ Scoreboard Report ------------");
  $display("Number of pass transactions\t: %0d", no_of_pass);
  $display("Number of fail transactions\t: %0d", no_of_fails);
  $display("-------------------------------------------");
endfunction : report_phase
