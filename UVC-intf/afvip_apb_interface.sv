// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_apb_interface
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: It is a way to encapsulate signals into a block. All related signals are grouped together to form an interface block so that the same interface.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
interface afvip_apb_interface(
  input clk,
  input rst_n
  );

 import uvm_pkg::*;
  wire                    psel    ;
  wire                    penable ; 
  wire     [15:0]         paddr   ;
  wire                    pwrite  ;
  wire     [31:0]         pwdata  ;
  wire                    pready  ;
  wire     [31:0]         prdata  ;
  wire                    pslverr ;

  clocking cb_master @(posedge clk);
    output       psel    ;
    output       penable ; 
    output       paddr   ;
    output       pwrite  ;
    output       pwdata  ;
    input        pready  ;
    input        prdata  ;
    input        pslverr ;
  endclocking 

  clocking cb_monitor @(posedge clk);
    input   psel    ;
    input   penable ; 
    input   paddr   ;
    input   pwrite  ;
    input   pwdata  ;
    input   pready  ;
    input   prdata  ;
    input   pslverr ;
  endclocking 

endinterface