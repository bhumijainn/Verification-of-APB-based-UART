module uart_assertions (
  Pclk,
  Presetn,
  Paddr,
  Pwdata,
  Pwrite,
  Penable,
  Psel,
  RXD,
  Prdata,
  Pready,
  Pslverr,
  IRQ,
  TXD,
  baud_o
);

  input Pclk, Presetn, Pwrite, Penable, Psel, RXD, Pready, Pslverr, IRQ, TXD, baud_o;
  input [31:0] Paddr, Pwdata, Prdata;

  property prty_presetn;
    @(posedge Pclk) !Presetn |=> TXD == 1'b1 && Pready == 1'b0;
  endproperty : prty_presetn

  property prty_ready;
    @(posedge Pclk) disable iff(!Presetn) Psel && Pwrite ##1 $rose(Penable) |=> ##1 $rose(Pready);
  endproperty : prty_ready

  property prty_IRQ_x6;
      @(posedge Pclk) disable iff(!Presetn) Prdata != 32'hc6 ##1 Prdata == 32'hc6 |-> ##[0:1] IRQ;
  endproperty : prty_IRQ_x6

  property prty_IRQ_x4;
      @(posedge Pclk) disable iff(!Presetn) Prdata != 32'hc4 ##1 Prdata == 32'hc4 |-> ##[0:1] IRQ;
  endproperty : prty_IRQ_x4

  property prty_IRQ_xc;
      @(posedge Pclk) disable iff(!Presetn) Prdata != 32'hcc ##1 Prdata == 32'hcc |-> ##[0:1] IRQ;
  endproperty : prty_IRQ_xc

  property prty_IRQ_x2;
      @(posedge Pclk) disable iff(!Presetn) Prdata != 32'hc2 ##1 Prdata == 32'hc2 |-> ##[0:1] IRQ;
  endproperty : prty_IRQ_x2

  PRESETN: assert property(prty_presetn);
  PREADY: assert property(prty_ready);
  PRTY_IRQ_x6: assert property(prty_IRQ_x6);
  PRTY_IRQ_x4: assert property(prty_IRQ_x4);
  PRTY_IRQ_xc: assert property(prty_IRQ_xc);
  PRTY_IRQ_x2: assert property(prty_IRQ_x2);

endmodule : uart_assertions 
