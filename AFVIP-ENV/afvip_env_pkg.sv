// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_env_pkg
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: Package for the enviroment and scoreboard
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
package afvip_env_pkg;

  import uvm_pkg::*;
  import afvip_apb_pkg::*;
  import afvip_reset_pkg::*;
  import afvip_intrr_pkg::*;
  
  `include "uvm_macros.svh"
  `include "afvip_scoreboard.svh"
  `include "afvip_environment.svh"
  `include "afvip_virtual_sequencer.svh"
    
endpackage