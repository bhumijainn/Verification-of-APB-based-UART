class uart_sequence extends uvm_sequence #(uart_trans);

  `uvm_object_utils(uart_sequence)

  extern function new(string name = "uart_sequence");

endclass : uart_sequence

function uart_sequence::new(string name = "uart_sequence");
  super.new(name);
endfunction : new

class full_duplex_seq1 extends uart_sequence;

  `uvm_object_utils(full_duplex_seq1)

  extern function new(string name = "full_duplex_seq1");
  extern task body;

endclass : full_duplex_seq1

function full_duplex_seq1::new(string name = "full_duplex_seq1");
  super.new(name);
endfunction : new

task full_duplex_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class full_duplex_seq2 extends uart_sequence;

  `uvm_object_utils(full_duplex_seq2)

  extern function new(string name = "full_duplex_seq2");
  extern task body;

endclass : full_duplex_seq2

function full_duplex_seq2::new(string name = "full_duplex_seq2");
  super.new(name);
endfunction : new

task full_duplex_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class half_duplex_seq1 extends uart_sequence;

  `uvm_object_utils(half_duplex_seq1)

  extern function new(string name = "half_duplex_seq1");
  extern task body;

endclass : half_duplex_seq1

function half_duplex_seq1::new(string name = "half_duplex_seq1");
  super.new(name);
endfunction : new

task half_duplex_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h01;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);
endtask : body

class half_duplex_seq2 extends uart_sequence;

  `uvm_object_utils(half_duplex_seq2)

  extern function new(string name = "half_duplex_seq2");
  extern task body;

endclass : half_duplex_seq2

function half_duplex_seq2::new(string name = "half_duplex_seq2");
  super.new(name);
endfunction : new

task half_duplex_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class loop_back_seq1 extends uart_sequence;

  `uvm_object_utils(loop_back_seq1)

  extern function new(string name = "loop_back_seq1");
  extern task body;

endclass : loop_back_seq1

function loop_back_seq1::new(string name = "loop_back_seq1");
  super.new(name);
endfunction : new

task loop_back_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // MCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h10;
    Pwrite == 1'h1;
    Pwdata == 32'h10;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class loop_back_seq2 extends uart_sequence;

  `uvm_object_utils(loop_back_seq2)

  extern function new(string name = "loop_back_seq2");
  extern task body;

endclass : loop_back_seq2

function loop_back_seq2::new(string name = "loop_back_seq2");
  super.new(name);
endfunction : new

task loop_back_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // MCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h10;
    Pwrite == 1'h1;
    Pwdata == 32'h10;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class parity_seq1 extends uart_sequence;

  `uvm_object_utils(parity_seq1)

  extern function new(string name = "parity_seq1");
  extern task body;

endclass : parity_seq1

function parity_seq1::new(string name = "parity_seq1");
  super.new(name);
endfunction : new

task parity_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h0b;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class parity_seq2 extends uart_sequence;

  `uvm_object_utils(parity_seq2)

  extern function new(string name = "parity_seq2");
  extern task body;

endclass : parity_seq2

function parity_seq2::new(string name = "parity_seq2");
  super.new(name);
endfunction : new

task parity_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h1b;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class break_error_seq1 extends uart_sequence;

  `uvm_object_utils(break_error_seq1)

  extern function new(string name = "break_error_seq1");
  extern task body;

endclass : break_error_seq1

function break_error_seq1::new(string name = "break_error_seq1");
  super.new(name);
endfunction : new

task break_error_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h43;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class break_error_seq2 extends uart_sequence;

  `uvm_object_utils(break_error_seq2)

  extern function new(string name = "break_error_seq2");
  extern task body;

endclass : break_error_seq2

function break_error_seq2::new(string name = "break_error_seq2");
  super.new(name);
endfunction : new

task break_error_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h43;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h05;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1 : 255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class overrun_error_seq1 extends uart_sequence;

  `uvm_object_utils(overrun_error_seq1)

  extern function new(string name = "overrun_error_seq1");
  extern task body;

endclass : overrun_error_seq1

function overrun_error_seq1::new(string name = "overrun_error_seq1");
  super.new(name);
endfunction : new

task overrun_error_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h06;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h04;
  });
  finish_item(req);

  // THR
  repeat (17) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h1;
    });
    finish_item(req);
  end

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class overrun_error_seq2 extends uart_sequence;

  `uvm_object_utils(overrun_error_seq2)

  extern function new(string name = "overrun_error_seq2");
  extern task body;

endclass : overrun_error_seq2

function overrun_error_seq2::new(string name = "overrun_error_seq2");
  super.new(name);
endfunction : new

task overrun_error_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h06;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h04;
  });
  finish_item(req);

  // THR
  repeat (17) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h1;
    });
    finish_item(req);
  end

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class framing_error_seq1 extends uart_sequence;

  `uvm_object_utils(framing_error_seq1)

  extern function new(string name = "framing_error_seq1");
  extern task body;

endclass : framing_error_seq1

function framing_error_seq1::new(string name = "framing_error_seq1");
  super.new(name);
endfunction : new

task framing_error_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h04;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata == 32'h5;
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class framing_error_seq2 extends uart_sequence;

  `uvm_object_utils(framing_error_seq2)

  extern function new(string name = "framing_error_seq2");
  extern task body;

endclass : framing_error_seq2

function framing_error_seq2::new(string name = "framing_error_seq2");
  super.new(name);
endfunction : new

task framing_error_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h00;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h04;
  });
  finish_item(req);

  // THR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h00;
    Pwrite == 1'h1;
    Pwdata inside {[1:255]};
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class thr_empty_seq1 extends uart_sequence;

  `uvm_object_utils(thr_empty_seq1)

  extern function new(string name = "thr_empty_seq1");
  extern task body;

endclass : thr_empty_seq1

function thr_empty_seq1::new(string name = "thr_empty_seq1");
  super.new(name);
endfunction : new

task thr_empty_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h06;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h02;
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class thr_empty_seq2 extends uart_sequence;

  `uvm_object_utils(thr_empty_seq2)

  extern function new(string name = "thr_empty_seq2");
  extern task body;

endclass : thr_empty_seq2

function thr_empty_seq2::new(string name = "thr_empty_seq2");
  super.new(name);
endfunction : new

task thr_empty_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h06;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h02;
  });
  finish_item(req);

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class time_out_error_seq1 extends uart_sequence;

  `uvm_object_utils(time_out_error_seq1)

  extern function new(string name = "time_out_error_seq1");
  extern task body;

endclass : time_out_error_seq1

function time_out_error_seq1::new(string name = "time_out_error_seq1");
  super.new(name);
endfunction : new

task time_out_error_seq1::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd27;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'h86;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h00;
  });
  finish_item(req);

  // THR
  repeat (17) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h1;
    });
    finish_item(req);
  end

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body

class time_out_error_seq2 extends uart_sequence;

  `uvm_object_utils(time_out_error_seq2)

  extern function new(string name = "time_out_error_seq2");
  extern task body;

endclass : time_out_error_seq2

function time_out_error_seq2::new(string name = "time_out_error_seq2");
  super.new(name);
endfunction : new

task time_out_error_seq2::body;
  req = uart_trans::type_id::create("req");
  // DIV1(MSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h20;
    Pwrite == 1'h1;
    Pwdata == 32'h0;
  });
  finish_item(req);

  // DIV2(LSB)
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h1c;
    Pwrite == 1'h1;
    Pwdata == 32'd54;
  });
  finish_item(req);

  // Normal Mode LCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h0c;
    Pwrite == 1'h1;
    Pwdata == 32'h03;
  });
  finish_item(req);

  // FCR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h1;
    Pwdata == 32'hc6;
  });
  finish_item(req);

  // IER
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h04;
    Pwrite == 1'h1;
    Pwdata == 32'h00;
  });
  finish_item(req);

  // THR
  repeat (17) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h1;
    });
    finish_item(req);
  end

  // IIR
  start_item(req);
  assert (req.randomize with {
    Paddr == 32'h08;
    Pwrite == 1'h0;
    Pwdata == 32'h00;
  });
  finish_item(req);

  get_response(req);

  if (req.IIR[3:0] == 4'h4) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h00;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end

  if (req.IIR[3:0] == 4'h6) begin
    start_item(req);
    assert (req.randomize with {
      Paddr == 32'h14;
      Pwrite == 1'h0;
      Pwdata == 0;
    });
    finish_item(req);
  end
endtask : body
