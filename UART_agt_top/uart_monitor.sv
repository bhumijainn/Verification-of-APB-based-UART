class uart_monitor extends uvm_monitor;

  `uvm_component_utils(uart_monitor)

  uvm_analysis_port #(uart_trans) mon_analysis_port;

  virtual uart_if.MON_MP vif;

  uart_trans th;

  uart_agt_config agt_cfg;

  extern function new(string name = "uart_monitor", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task collect_reset_from_duv;
  extern task collect_data_from_duv;

endclass : uart_monitor

function uart_monitor::new(string name = "uart_monitor", uvm_component parent);
  super.new(name, parent);
  mon_analysis_port = new("mon_analysis_port", this);
endfunction : new

function void uart_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(uart_agt_config)::get(this, "", "uart_agt_config", agt_cfg))
    `uvm_fatal("UART_MONITOR", "GET failed")
  th = uart_trans::type_id::create("th");
endfunction : build_phase

function void uart_monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  vif = agt_cfg.vif;
endfunction : connect_phase

task uart_monitor::run_phase(uvm_phase phase);
  collect_reset_from_duv;
  forever begin
    collect_data_from_duv;
  end
endtask : run_phase

task uart_monitor::collect_reset_from_duv;
  repeat (2) @(vif.mon_cb);
  th.Presetn = vif.mon_cb.Presetn;
  mon_analysis_port.write(th);
  // `uvm_info("UART_MONITOR", $sformatf("\n%s", th.sprint), UVM_MEDIUM)
  @(vif.mon_cb);
endtask : collect_reset_from_duv

task uart_monitor::collect_data_from_duv;
  while (vif.mon_cb.Pready !== 1'b1) @(vif.mon_cb);
  th.Presetn = vif.mon_cb.Presetn;
  th.Paddr = vif.mon_cb.Paddr;
  th.Psel = vif.mon_cb.Psel;
  th.Pwrite = vif.mon_cb.Pwrite;
  th.Penable = vif.mon_cb.Penable;
  th.Pwdata = vif.mon_cb.Pwdata;
  th.Prdata = vif.mon_cb.Prdata;
  th.Pready = vif.mon_cb.Pready;
  th.Pslverr = vif.mon_cb.Pslverr;
  th.IRQ = vif.mon_cb.IRQ;
  th.baud_o = vif.mon_cb.baud_o;
  if (th.Paddr == 32'h8 && th.Pwrite == 1'b0) begin
    while (vif.mon_cb.IRQ !== 1'b1) @(vif.mon_cb);
    th.IRQ = vif.mon_cb.IRQ;
    th.Prdata = vif.mon_cb.Prdata;
    th.IIR = th.Prdata;
  end
  @(vif.mon_cb);
  if (th.Pwrite == 1'b1) begin
    if (th.Paddr == 32'h00) th.THR.push_back(th.Pwdata);
    if (th.Paddr == 32'h04) th.IER = th.Pwdata;
    if (th.Paddr == 32'h08) th.FCR = th.Pwdata;
    if (th.Paddr == 32'h0c) th.LCR = th.Pwdata;
    if (th.Paddr == 32'h10) th.MCR = th.Pwdata;
    if (th.Paddr == 32'h1c) th.DIV[15:0] = th.Pwdata;
    if (th.Paddr == 32'h20) th.DIV[7:0] = th.Pwdata;
  end
  if (th.IRQ == 1'b1) begin
    if (th.Paddr == 32'h00) th.RBR.push_back(th.Prdata);
    if (th.Paddr == 32'h14) th.LSR = th.Prdata;
    if (th.Paddr == 32'h18) th.MSR = th.Prdata;
  end
  mon_analysis_port.write(th);
  //`uvm_info("UART_MONITOR", $sformatf("\n%s", th.sprint), UVM_MEDIUM)
endtask : collect_data_from_duv
