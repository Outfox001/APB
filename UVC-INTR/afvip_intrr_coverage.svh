// ---------------------------------------------------------------------------------------------------------------------
// Module name: afvip_intrr_coverage
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: It is a user-defined metric that measures how much of the design specification that are captured in the test plan has been exercised.
// Date       : 28 August, 2023
// ---------------------------------------------------------------------------------------------------------------------
class afvip_intrr_coverage extends uvm_subscriber #(afvip_intrr_item);  // taken from monitor

  `uvm_component_utils(afvip_intrr_coverage)

  function new(string name="afvip_intrr_coverage",uvm_component parent);
    super.new(name,parent);
    dut_cov_intr =new();
  endfunction
  
  afvip_intrr_item cov_proj_item_intr     ;
  real  cov_interrupt           ;
  
  // ________________ COVERGROUP FOR PSLVERR ______________________
  covergroup dut_cov_intr;
  INTERRUPT: coverpoint cov_proj_item_intr.interr {
    bins interval2 = {1};
  }
  endgroup

  function void write(afvip_intrr_item t);
    cov_proj_item_intr = t;
    dut_cov_intr.sample();
  endfunction

  // ________________ Extract Phase ______________________

  function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    cov_interrupt=dut_cov_intr.get_coverage();
  endfunction


  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info(get_type_name(),$sformatf("Coverage for INTERRUPT is %f",cov_interrupt),UVM_MEDIUM)
  endfunction 

endclass : afvip_intrr_coverage