class uart_test_lib extends uvm_test;

  `uvm_component_utils(uart_test_lib)

  uart_env_config env_cfg;
  uart_agt_config agt_cfg[2];

  bit has_v_sequencer = 1;
  bit has_uart_agent = 1;
  bit has_sb = 1;

  uart_env envh;

  extern function new(string name = "uart_test_lib", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);

endclass : uart_test_lib

function uart_test_lib::new(string name = "uart_test_lib", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void uart_test_lib::build_phase(uvm_phase phase);
  super.build_phase(phase);
  env_cfg = uart_env_config::type_id::create("env_cfg");
  foreach (agt_cfg[i]) begin
    agt_cfg[i] = uart_agt_config::type_id::create($sformatf("agt_cfg[%0d]", i));
    if (!uvm_config_db#(virtual uart_if)::get(this, "", $sformatf("vif%0d", i + 1), agt_cfg[i].vif))
      `uvm_fatal("UART_TEST", "GET failed")
    agt_cfg[i].is_active = UVM_ACTIVE;
    env_cfg.agt_cfg[i]   = agt_cfg[i];
  end
  env_cfg.has_v_sequencer = has_v_sequencer;
  env_cfg.has_uart_agent = has_uart_agent;
  env_cfg.has_sb = has_sb;

  uvm_config_db#(uart_env_config)::set(this, "envh", "uart_env_config", env_cfg);

  envh = uart_env::type_id::create("envh", this);
endfunction : build_phase

function void uart_test_lib::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology;
endfunction : end_of_elaboration_phase

class full_duplex_test extends uart_test_lib;

  `uvm_component_utils(full_duplex_test)

  full_duplex_v_seq vseqh;

  extern function new(string name = "full_duplex_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : full_duplex_test

function full_duplex_test::new(string name = "full_duplex_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task full_duplex_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = full_duplex_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
   #40;
  phase.drop_objection(this);
endtask : run_phase

class half_duplex_test extends uart_test_lib;

  `uvm_component_utils(half_duplex_test)

  half_duplex_v_seq vseqh;

  extern function new(string name = "half_duplex_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : half_duplex_test

function half_duplex_test::new(string name = "half_duplex_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task half_duplex_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = half_duplex_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class loop_back_test extends uart_test_lib;

  `uvm_component_utils(loop_back_test)

  loop_back_v_seq vseqh;

  extern function new(string name = "loop_back_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : loop_back_test

function loop_back_test::new(string name = "loop_back_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task loop_back_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = loop_back_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class parity_test extends uart_test_lib;

  `uvm_component_utils(parity_test)

  parity_v_seq vseqh;

  extern function new(string name = "parity_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : parity_test

function parity_test::new(string name = "parity_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task parity_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = parity_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class break_error_test extends uart_test_lib;

  `uvm_component_utils(break_error_test)

  break_error_v_seq vseqh;

  extern function new(string name = "break_error_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : break_error_test

function break_error_test::new(string name = "break_error_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task break_error_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = break_error_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class overrun_error_test extends uart_test_lib;

  `uvm_component_utils(overrun_error_test)

  overrun_error_v_seq vseqh;

  extern function new(string name = "overrun_error_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : overrun_error_test

function overrun_error_test::new(string name = "overrun_error_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task overrun_error_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = overrun_error_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class framing_error_test extends uart_test_lib;

  `uvm_component_utils(framing_error_test)

  framing_error_v_seq vseqh;

  extern function new(string name = "framing_error_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : framing_error_test

function framing_error_test::new(string name = "framing_error_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task framing_error_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = framing_error_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class thr_empty_test extends uart_test_lib;

  `uvm_component_utils(thr_empty_test)

  thr_empty_v_seq vseqh;

  extern function new(string name = "thr_empty_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : thr_empty_test

function thr_empty_test::new(string name = "thr_empty_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task thr_empty_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = thr_empty_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase

class time_out_error_test extends uart_test_lib;

  `uvm_component_utils(time_out_error_test)

  time_out_error_v_seq vseqh;

  extern function new(string name = "time_out_error_test", uvm_component parent);
  extern task run_phase(uvm_phase phase);

endclass : time_out_error_test

function time_out_error_test::new(string name = "time_out_error_test", uvm_component parent);
  super.new(name, parent);
endfunction : new

task time_out_error_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqh = time_out_error_v_seq::type_id::create("vseqh");
  vseqh.start(envh.vseqrh);
  #40;
  phase.drop_objection(this);
endtask : run_phase
