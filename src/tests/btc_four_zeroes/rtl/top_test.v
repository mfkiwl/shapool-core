module top_test
(
  clk_in,
  reset_n_in,
  // Global data
  sck0_in,
  sdi0_in,
  cs0_n_in,
  // Daisy data
  sck1_in,
  sdi1_in,
  sdo1_out,
  cs1_n_in,
  // READY flags
  ready_n_od_out,
  // Indicator LED
  status_led_n_out
);

    // Making pool smaller to test / fit on HX8K
    `define SHAPOOL_NO_NONCE_OFFSET // Required for POOL_SIZE = 1

    parameter POOL_SIZE       = 1;
    parameter POOL_SIZE_LOG2  = 0;
    parameter BASE_TARGET     = 4; // Max. ~112 with 2 cores, 256 with 1 core

    // 12 MHz ~ 30 MHz
    parameter PLL_DIVR = 4'b0000;
    parameter PLL_DIVF = 7'b1001111;
    parameter PLL_DIVQ = 3'b101;

    // Multiply input clock signal using SB_PLL40_CORE
    wire g_clk;

    SB_PLL40_CORE #(
        .FEEDBACK_PATH("SIMPLE"),
        .DIVR(PLL_DIVR),
        .DIVF(PLL_DIVF),
        .DIVQ(PLL_DIVQ),
        .FILTER_RANGE(3'b001)
    )
    pll (
        .LOCK(pll_locked),
        .RESETB(1'b1),
        .BYPASS(1'b0),
        .REFERENCECLK(clk_in),
        //.PLLOUTCORE(g_clk)
        .PLLOUTGLOBAL(g_clk)
    );

    // Inputs and Outputs

    input wire clk_in;

    input wire reset_n_in;

    input wire sck0_in;
    input wire sdi0_in;
    input wire cs0_n_in;

    input wire sck1_in;
    input wire sdi1_in;
    output wire sdo1_out;
    input wire cs1_n_in;

    output wire ready_n_od_out;

    output wire status_led_n_out;

    top #(
      .POOL_SIZE(POOL_SIZE),
      .POOL_SIZE_LOG2(POOL_SIZE_LOG2),
      .BASE_TARGET(BASE_TARGET)
    )
    u (
      g_clk,
      reset_n_in,
      // Global data
      sck0_in,
      sdi0_in,
      cs0_n_in,
      // Daisy data
      sck1_in,
      sdi1_in,
      sdo1_out,
      cs1_n_in,
      // Success flags
      ready_n_od_out,
      // Indicators
      status_led_n_out
    );

endmodule
