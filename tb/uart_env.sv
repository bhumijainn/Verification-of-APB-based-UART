class uart_env extends uvm_env;

  `uvm_component_utils(uart_env)

  uart_env_config env_cfg;

  v_sequencer vseqrh;
  uart_agt_top agt_toph;
  uart_sb sbh;

  extern function new(string name = "uart_env", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

endclass : uart_env

function uart_env::new(string name = "uart_env", uvm_component parent);
  super.new(name, parent);
endfunction : new

function void uart_env::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(uart_env_config)::get(this, "", "uart_env_config", env_cfg))
    `uvm_fatal("UART_ENV", "GET failed")

  if (env_cfg.has_v_sequencer) vseqrh = v_sequencer::type_id::create("vseqrh", this);
  if (env_cfg.has_uart_agent) begin
    uvm_config_db#(uart_env_config)::set(this, "agt_toph", "uart_env_config", env_cfg);
    agt_toph = uart_agt_top::type_id::create("agt_toph", this);
  end
  if (env_cfg.has_sb) sbh = uart_sb::type_id::create("sbh", this);
endfunction : build_phase

function void uart_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if (env_cfg.has_v_sequencer && env_cfg.has_uart_agent) begin
    foreach (vseqrh.seqrh[i]) begin
      vseqrh.seqrh[i] = agt_toph.agth[i].seqrh;
    end
  end
  if (env_cfg.has_sb && env_cfg.has_uart_agent) begin
    foreach (agt_toph.agth[i]) begin
      agt_toph.agth[i].monh.mon_analysis_port.connect(sbh.sb_tlm_port[i].analysis_export);
    end
  end
endfunction : connect_phase
