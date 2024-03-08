// ---------------------------------------------------------------------------------------------------------------------
// Module name: afvip_intrr_item
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: It consist of data fields required for generating the stimulus.In order to generate the stimulus, the sequence items are randomized in sequences.
// Date       : 28 August, 2023
// ---------------------------------------------------------------------------------------------------------------------
class  afvip_intrr_item extends uvm_sequence_item;

  bit unsigned interr;

  `uvm_object_utils_begin(afvip_intrr_item)
    `uvm_field_int (interr,      UVM_DEFAULT)
  `uvm_object_utils_end
                     
  function new (string name = "afvip_intrr_item");
    super.new(name);
  endfunction

endclass