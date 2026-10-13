class uart_agt_config extends uvm_object;

  `uvm_object_utils(uart_agt_config)

  virtual uart_if vif;
  uvm_active_passive_enum is_active;

  extern function new(string name = "uart_agt_config");

endclass : uart_agt_config

function uart_agt_config::new(string name = "uart_agt_config");
  super.new(name);
endfunction : new
