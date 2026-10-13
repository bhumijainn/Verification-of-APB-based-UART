class uart_agent extends uvm_agent;

  `uvm_component_utils(uart_agent)

  uart_agt_config agt_cfg;
  uart_sequencer seqrh;
  uart_driver drvh;
  uart_monitor monh;

  extern function new(string name = "uart_agent", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : uart_agent

function uart_agent::new(string name = "uart_agent", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void uart_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(uart_agt_config)::get(this, "", "uart_agt_config", agt_cfg))
    `uvm_fatal("UART_AGENT", "GET failed")

  monh = uart_monitor::type_id::create("monh", this);

  if (agt_cfg.is_active == UVM_ACTIVE) begin
    seqrh = uart_sequencer::type_id::create("seqrh", this);
    drvh  = uart_driver::type_id::create("drvh", this);
  end
endfunction : build_phase

function void uart_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (agt_cfg.is_active == UVM_ACTIVE) begin
    drvh.seq_item_port.connect(seqrh.seq_item_export);
  end
endfunction : connect_phase
