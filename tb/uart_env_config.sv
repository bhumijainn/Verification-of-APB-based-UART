class uart_env_config extends uvm_object;

  `uvm_object_utils(uart_env_config)

  bit has_v_sequencer, has_uart_agent, has_sb;
  uart_agt_config agt_cfg[2];

  extern function new(string name = "uart_env_config");

endclass : uart_env_config

function uart_env_config::new(string name = "uart_env_config");
  super.new(name);
endfunction : new
