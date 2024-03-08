// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: project_top
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: All verification components, interfaces and DUT are instantiated in a top level module called testbench. 
//              It is a static container to hold everything required to be simulated and becomes the root node in the hierarchy.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ps
module project_top();

  import uvm_pkg::*;
  import afvip_test_pkg::*;
  import afvip_apb_pkg::*;
  import afvip_reset_pkg::*;
  import afvip_intrr_pkg::*;
  import afvip_env_pkg::*;
    
bit clk;
reg rst_n;
bit afvip_intr;
reg pslverr;
reg penable;
reg psel;
reg [0:15] paddr;
reg [0:31] pwdata;
reg [0:31] prdata;
reg pwrite;
reg pready;

  afvip_apb_interface intf1  (.clk(clk),
                              .rst_n(rst_n));
  afvip_intrr_interface intf_passive  ( .clk(clk),
                                        .rst_n(rst_n));
  afvip_reset_interface intf_reset (.clk(clk));
                                        

afvip_top #(.TP(0))alu_dut(
  .clk        (clk)       ,
  .rst_n      (rst_n)     ,
  .afvip_intr (afvip_intr),
  .psel       (psel)      ,
  .penable    (penable)   ,
  .paddr      (paddr)     ,
  .pwrite     (pwrite)    ,
  .pwdata     (pwdata)    ,
  .pready     (pready)    ,
  .prdata     (prdata)    ,
  .pslverr    (pslverr)   );


initial begin
  forever
  #5 clk = ~clk; 
end

initial begin
  uvm_config_db#(virtual afvip_apb_interface) :: set (uvm_root::get(), "*.agent_apb.*", "vif" ,intf1 );
  uvm_config_db#(virtual afvip_intrr_interface) :: set (uvm_root::get(), "*.agent_passive.*", "vif" ,intf_passive );
  uvm_config_db#(virtual afvip_reset_interface) :: set (uvm_root::get(), "*.agent_reset.*", "vif_reset" ,intf_reset );


//run_test("afvip_test_register_write_all_with_1");
//run_test("afvip_test_register_write_all_with_F");
//run_test("afvip_test_register_write_all_with_random");
//run_test("afvip_test_overflow");
//run_test("afvip_test_reset_all");
run_test("afvip_test_reset_half");
//run_test("afvip_test_opcode_functionally");
//run_test("afvip_test_error_opcode");
//run_test("afvip_test_read_all_without_write");
//run_test("afvip_test_read_all_write_all");
//run_test("afvip_test_write_one_read_all");
//run_test("afvip_test_read_1_after_every_register_write");
//run_test("afvip_test_data_same_destionation");
//run_test("afvip_test_write_read_addres");
//run_test("afvip_test_addres_error");
//run_test("afvip_test_back_to_back_tranzaction");
//run_test("afvip_test_delay_tranzaction");
//run_test("afvip_test_instruction_register_field_0");
//run_test("afvip_test_instruction_register_field_with_not0");
//run_test("afvip_test_instruction_data_fields_random");
//run_test("afvip_test_instruction_data_fields_read");
//run_test("afvip_test_write_read_all_addres");
//run_test("afvip_test_write_shift_by_1");
//run_test("afvip_test_write_shift_by_0");

//run_test("afvip_test_opcode_urandom");
//run_test("afvip_full_test_without_error");
//run_test("afvip_full_test_with_error");





end

assign intf_passive.afvip_intr = afvip_intr;
assign rst_n             = intf_reset.rst_n;
assign intf1.prdata                 = prdata;
assign intf1.pready                 = pready;
assign intf1.pslverr                = pslverr;
assign pwrite                       = intf1.pwrite;
assign penable                      = intf1.penable;
assign psel                         = intf1.psel;
assign paddr                        = intf1.paddr;
assign pwdata                       = intf1.pwdata;

`include "afvip_assertion.svh"

endmodule