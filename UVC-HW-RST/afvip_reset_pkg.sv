// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_reset_pkg
// HDL        : System Verilog
// Author     : Paulovici Vlad-Marian
// Description: Package for reset
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
package afvip_reset_pkg;

  import uvm_pkg::*;

  `include "uvm_macros.svh"
  `include "afvip_reset_item.svh"
  `include "afvip_reset_driver.svh"
  `include "afvip_reset_monitor.svh"
  `include "afvip_reset_sequencer.svh"
  `include "afvip_reset_agent.svh"
  `include "afvip_reset_sequence.svh"
    
endpackage