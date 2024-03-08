// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_reset_item
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: It consist of data fields required for generating the stimulus.In order to generate the stimulus, the sequence items are randomized in sequences.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class afvip_reset_item extends uvm_sequence_item;

  bit rst_n;

  `uvm_object_utils_begin(afvip_reset_item)
    `uvm_field_int (rst_n,      UVM_DEFAULT)
  `uvm_object_utils_end
                     
  function new (string name = "afvip_reset_item");
    super.new(name);
  endfunction
endclass