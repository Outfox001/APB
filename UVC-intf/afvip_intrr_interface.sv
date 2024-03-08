// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_intrr_interface
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: It is a way to encapsulate signals into a block. All related signals are grouped together to form an interface block so that the same interface.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
interface afvip_intrr_interface(
  input clk,
  input rst_n
  );

  import uvm_pkg::*;
  bit afvip_intr;

  clocking cb_afvip_interrupt @(posedge clk);
    input afvip_intr;
  endclocking

endinterface