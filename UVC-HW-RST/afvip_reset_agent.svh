// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_reset_agent
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: An agent encapsulates a Sequencer, Driver and Monitor into a single entity by instantiating and connecting the components together via interfaces.
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class afvip_reset_agent extends uvm_agent;

  `uvm_component_utils(afvip_reset_agent)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction //new()

  afvip_reset_driver          drv_reset;
  afvip_reset_monitor         mon_reset;
  afvip_reset_sequencer      seq_reset;

  virtual function void build_phase(uvm_phase phase);
    if(get_is_active())
    begin
      seq_reset = afvip_reset_sequencer::type_id::create ("seq_reset", this);
      drv_reset = afvip_reset_driver::type_id::create ("drv_reset", this);
    end
  mon_reset = afvip_reset_monitor::type_id::create ("mon_reset", this);
  endfunction

  virtual function void connect_phase (uvm_phase phase);
  if(get_is_active())
  drv_reset.seq_item_port.connect (seq_reset.seq_item_export);
  endfunction

endclass //req_ack_agent extends uvm_agent