// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_reset_monitor
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: Is responsible for capturing signal activity from the design interface and translate it into transaction level data objects that can be sent to other components.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class afvip_reset_monitor extends uvm_monitor ;

  `uvm_component_utils (afvip_reset_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction //new()

  virtual afvip_reset_interface vif_reset;
  uvm_analysis_port #(afvip_reset_item) mon_analysis_port_reset;

  function void build_phase(uvm_phase phase); 
    super.build_phase (phase);
    mon_analysis_port_reset = new ("mon_analysis_port_reset", this);
    if(! uvm_config_db #(virtual afvip_reset_interface) :: get (this , "", "vif_reset", vif_reset)) begin
      `uvm_error (get_type_name (), "Not found")
    end
  endfunction

  task run_phase(uvm_phase phase);
    afvip_reset_item data_mon_reset = afvip_reset_item::type_id::create ("data_mon_reset", this);
    forever begin
      @(posedge vif_reset.rst_n);
      mon_analysis_port_reset.write(data_mon_reset);
      `uvm_info (get_type_name(), $sformatf ("The data from monitor was received!"), UVM_NONE)
    end
  endtask

endclass //req_ack_monitor extends uvm_monitor