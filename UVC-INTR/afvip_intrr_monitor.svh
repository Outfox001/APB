// ---------------------------------------------------------------------------------------------------------------------
// Module name: afvip_intrr_monitor
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: Is responsible for capturing signal activity from the design interface and translate it into transaction level data objects that can be sent to other components
// Date       : 28 August, 2023
// ---------------------------------------------------------------------------------------------------------------------
class afvip_intrr_monitor extends uvm_monitor ;

  `uvm_component_utils (afvip_intrr_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction //new()

  virtual afvip_intrr_interface vif;
  uvm_analysis_port #(afvip_intrr_item) mon_analysis_port_passive;

  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
    mon_analysis_port_passive = new ("mon_analysis_port_passive", this);
    if(! uvm_config_db #(virtual afvip_intrr_interface) :: get (this , "", "vif", vif)) begin
      `uvm_error (get_type_name (), "Not found")
    end
  endfunction

  task run_phase(uvm_phase phase);
    afvip_intrr_item data_mon_passive = afvip_intrr_item::type_id::create ("data_mon_passive", this);
    @(posedge vif.rst_n);
    forever begin
      @(posedge vif.cb_afvip_interrupt.afvip_intr);
      data_mon_passive.interr = vif.cb_afvip_interrupt.afvip_intr;
      mon_analysis_port_passive.write(data_mon_passive);
    end
  endtask

endclass //req_ack_monitor extends uvm_monitor