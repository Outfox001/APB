// ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Module name: afvip_environment
// HDL        : UVM
// Author     : Paulovici Vlad-Marian
// Description: UVM environment have multiple agents for different interfaces, a common scoreboard, a functional coverage collector
// Date       : 28 August, 2023
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class afvip_environment extends uvm_env;

  `uvm_component_utils(afvip_environment)
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction 
  
  afvip_apb_agent               agent_apb;
  afvip_scoreboard              scoreboard_test1;
  afvip_intrr_agent             agent_passive;
  afvip_reset_agent             agent_reset;
  afvip_apb_coverage            coverage;
  afvip_intrr_coverage          coverageintrr;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);
    agent_apb           =           afvip_apb_agent::type_id::create("agent_apb", this);
    coverage            =           afvip_apb_coverage::type_id::create("coverage", this); 
    coverageintrr       =           afvip_intrr_coverage::type_id::create("coverageintrr", this);         
    
    uvm_config_db #(uvm_active_passive_enum)::set(this, "agent_passive", "is_active", UVM_PASSIVE);
    agent_passive   =               afvip_intrr_agent::type_id::create("agent_passive", this);
    agent_reset         =           afvip_reset_agent::type_id::create("agent_reset", this);
    scoreboard_test1    =           afvip_scoreboard::type_id::create("scoreboard_test1", this);
  endfunction

  virtual function void connect_phase (uvm_phase phase);
  super.connect_phase(phase);
    agent_apb.mon0.mon_analysis_port.connect (scoreboard_test1.ap_imp);
    agent_reset.mon_reset.mon_analysis_port_reset.connect (scoreboard_test1.ap_imp_reset);
    agent_passive.mon_passive.mon_analysis_port_passive.connect (scoreboard_test1.ap_imp_interrupt);
    agent_apb.mon0.mon_analysis_port.connect (coverage.analysis_export);
    agent_passive.mon_passive.mon_analysis_port_passive.connect (coverageintrr.analysis_export);
  endfunction
    
endclass 