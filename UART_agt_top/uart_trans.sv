class uart_trans extends uvm_sequence_item;

  `uvm_object_utils(uart_trans)

  // APB Signals
  logic Presetn;
  rand logic [31:0] Paddr, Pwdata;
  rand logic Pwrite;
  logic [31:0] Prdata;
  logic Penable, Psel, Pready, Pslverr, baud_o, IRQ;

  // UART Registers
  logic [7:0] RBR[$], THR[$], IER, IIR, FCR, LCR, MCR, LSR, MSR;
  logic [15:0] DIV;

  extern function new(string name = "uart_trans");
  extern function void do_print(uvm_printer printer);

endclass : uart_trans

function uart_trans::new(string name = "uart_trans");
  super.new(name);
endfunction : new

function void uart_trans::do_print(uvm_printer printer);
  super.do_print(printer);
  printer.print_field("PRESETN", this.Presetn, $bits(this.Presetn), UVM_BIN);
  printer.print_field("PADDR", this.Paddr, $bits(this.Paddr), UVM_HEX);
  printer.print_field("PWDATA", this.Pwdata, $bits(this.Pwdata), UVM_HEX);
  printer.print_field("PRDATA", this.Prdata, $bits(this.Prdata), UVM_HEX);
  printer.print_field("PWRITE", this.Pwrite, $bits(this.Pwrite), UVM_HEX);
  printer.print_field("PENABLE", this.Penable, $bits(this.Penable), UVM_BIN);
  printer.print_field("PSEL", this.Psel, $bits(this.Psel), UVM_HEX);
  printer.print_field("PREADY", this.Pready, $bits(this.Pready), UVM_HEX);
  printer.print_field("PSLVERR", this.Pslverr, $bits(this.Pslverr), UVM_HEX);
  printer.print_field("BAUD_O", this.baud_o, $bits(this.baud_o), UVM_HEX);
  printer.print_field("IRQ", this.IRQ, $bits(this.IRQ), UVM_HEX);
  foreach(THR[i]) begin
    printer.print_field($sformatf("THR[%0d]", i), this.THR[i], $bits(this.THR[i]), UVM_HEX);
  end
  foreach(RBR[i]) begin
    printer.print_field($sformatf("RBR[%0d]", i), this.RBR[i], $bits(this.RBR[i]), UVM_HEX);
  end
  printer.print_field("IER", this.IER, $bits(this.IER), UVM_HEX);
  printer.print_field("IIR", this.IIR, $bits(this.IIR), UVM_HEX);
  printer.print_field("FCR", this.FCR, $bits(this.FCR), UVM_HEX);
  printer.print_field("LCR", this.LCR, $bits(this.LCR), UVM_HEX);
  printer.print_field("MCR", this.MCR, $bits(this.MCR), UVM_HEX);
  printer.print_field("LSR", this.LSR, $bits(this.LSR), UVM_HEX);
  printer.print_field("MSR", this.MSR, $bits(this.MSR), UVM_HEX);
  printer.print_field("DIV1", this.DIV[15:8], $bits(this.DIV[15:8]), UVM_HEX);
  printer.print_field("DIV2", this.DIV[7:0], $bits(this.DIV[7:0]), UVM_HEX);
endfunction : do_print
