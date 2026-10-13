module uart_tb_top;

  import uvm_pkg::*;
  import uart_pkg::*;

  logic clock_1 = 0;
  logic clock_2 = 0;

  always #10 clock_1 = ~clock_1;
  always #5 clock_2 = ~clock_2;

  uart_if in1 (clock_1);
  uart_if in2 (clock_2);

  wire TXD, RXD;

  uart_16550 DUV1 (
      in1.clk,
      in1.Presetn,
      in1.Paddr,
      in1.Pwdata,
      in1.Prdata,
      in1.Pwrite,
      in1.Penable,
      in1.Psel,
      in1.Pready,
      in1.Pslverr,
      in1.IRQ,
      TXD,
      RXD,
      in1.baud_o
  );

  uart_16550 DUV2 (
      in2.clk,
      in2.Presetn,
      in2.Paddr,
      in2.Pwdata,
      in2.Prdata,
      in2.Pwrite,
      in2.Penable,
      in2.Psel,
      in2.Pready,
      in2.Pslverr,
      in2.IRQ,
      RXD,
      TXD,
      in2.baud_o
  );

  uart_assertions DUV_ASS1 (
    in1.clk,
    in1.Presetn,
    in1.Paddr,
    in1.Pwdata,
    in1.Pwrite,
    in1.Penable,
    in1.Psel,
    RXD,
    in1.Prdata,
    in1.Pready,
    in1.Pslverr,
    in1.IRQ,
    TXD,
    in1.baud_o
  );

  uart_assertions DUV_ASS2 (
    in2.clk,
    in2.Presetn,
    in2.Paddr,
    in2.Pwdata,
    in2.Pwrite,
    in2.Penable,
    in2.Psel,
    TXD,
    in2.Prdata,
    in2.Pready,
    in2.Pslverr,
    in2.IRQ,
    RXD,
    in2.baud_o
  );

  initial begin
    uvm_config_db#(virtual uart_if)::set(null, "uvm_test_top", "vif1", in1);
    uvm_config_db#(virtual uart_if)::set(null, "uvm_test_top", "vif2", in2);
    run_test;
  end

endmodule : uart_tb_top
