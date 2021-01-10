module difficulty_map(
  clk,
  en,
  addr,
  difficulty
);

  input wire clk;
  input wire en;
  input wire [3:0] addr;

`ifdef ICE40

  output wire [15:0] difficulty;

  SB_RAM40_4K ram256x16_diffmap (
      .RDATA(difficulty),
      .RADDR({4'b1000, addr}),
      .RCLK(clk),
      .RCLKE(1),
      .RE(1),
      .WADDR(0),
      .WCLK(0),
      .WCLKE(0),
      .WDATA(0),
      .WE(0),
      .MASK(0)
  );

  defparam ram256x16_diffmap.READ_MODE = 0;  // 0 = 256x16 
  defparam ram256x16_diffmap.WRITE_MODE = 0; // 0 = 256x16

  defparam ram256x16_diffmap.INIT_0 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_1 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_2 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_3 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_4 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_5 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_6 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_7 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_8 =
      {
        16'b0000_0000_0000_0000, // 0x0
        16'b1000_0000_0000_0000, // 0x1
        16'b1100_0000_0000_0000, // 0x2
        16'b1110_0000_0000_0000, // 0x3
        16'b1111_0000_0000_0000, // 0x4
        16'b1111_1000_0000_0000, // 0x5
        16'b1111_1100_0000_0000, // 0x6
        16'b1111_1110_0000_0000, // 0x7
        16'b1111_1111_0000_0000, // 0x8
        16'b1111_1111_1000_0000, // 0x9
        16'b1111_1111_1100_0000, // 0xA
        16'b1111_1111_1110_0000, // 0xB
        16'b1111_1111_1111_0000, // 0xC
        16'b1111_1111_1111_1000, // 0xD
        16'b1111_1111_1111_1100, // 0xE
        16'b1111_1111_1111_1110  // 0xF
      };
  defparam ram256x16_diffmap.INIT_9 =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_A =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_B =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_C =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_D =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_E =
      256'h0000000000000000000000000000000000000000000000000000000000000000;
  defparam ram256x16_diffmap.INIT_F =
      256'h0000000000000000000000000000000000000000000000000000000000000000;


`else

  // TODO MachXO3 apply attribute syn_romstyle???

  output reg [15:0] difficulty;
  
  always @(posedge clk)
    begin
      if (en)
        case (addr)
          4'h0: difficulty <= 16'b0000_0000_0000_0000;
          4'h1: difficulty <= 16'b1000_0000_0000_0000;
          4'h2: difficulty <= 16'b1100_0000_0000_0000;
          4'h3: difficulty <= 16'b1110_0000_0000_0000;
          4'h4: difficulty <= 16'b1111_0000_0000_0000;
          4'h5: difficulty <= 16'b1111_1000_0000_0000;
          4'h6: difficulty <= 16'b1111_1100_0000_0000;
          4'h7: difficulty <= 16'b1111_1110_0000_0000;
          4'h8: difficulty <= 16'b1111_1111_0000_0000;
          4'h9: difficulty <= 16'b1111_1111_1000_0000;
          4'hA: difficulty <= 16'b1111_1111_1100_0000;
          4'hB: difficulty <= 16'b1111_1111_1110_0000;
          4'hC: difficulty <= 16'b1111_1111_1111_0000;
          4'hD: difficulty <= 16'b1111_1111_1111_1000;
          4'hE: difficulty <= 16'b1111_1111_1111_1100;
          4'hF: difficulty <= 16'b1111_1111_1111_1110;
        endcase
    end

`endif

endmodule
