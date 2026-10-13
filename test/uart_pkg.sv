package uart_pkg;

  import uvm_pkg::*;

  `include "uvm_macros.svh"

  // Config
  `include "uart_agt_config.sv"
  `include "uart_env_config.sv"

  // Trans
  `include "uart_trans.sv"

  // Inside Agent
  `include "uart_sequencer.sv"
  `include "uart_sequence.sv"
  `include "uart_driver.sv"
  `include "uart_monitor.sv"

  // Inside Agent Top
  `include "uart_agent.sv"

  // Inside ENV
  `include "v_sequencer.sv"
  `include "v_sequence.sv"
  `include "uart_sb.sv"
  `include "uart_agt_top.sv"

  // Inside TEST
  `include "uart_env.sv"

  // Inside TOP
  `include "uart_test_lib.sv"

endpackage : uart_pkg
