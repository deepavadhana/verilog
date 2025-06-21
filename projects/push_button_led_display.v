module push_led (
    input  [4:0] sw,
    output [4:0] led
);
assign led = sw;
endmodule

//XDC FILE

set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS33 } [get_ports {led[0]}];
set_property -dict {PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports {led[1]}];
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports {led[2]}];
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33 } [get_ports {led[3]}];
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33 } [get_ports {led[4]}];

set_property -dict {PACKAGE_PIN M12 IOSTANDARD LVCMOS33 } [get_ports {sw[0]}];
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33 } [get_ports {sw[1]}];
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports {sw[2]}];
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports {sw[3]}];
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports {sw[4]}];
set_property -dict { PACKAGE_PIN M12 IOSTANDARD LVCMOS33   PULLDOWN true } [get_ports {sw[0]}];
set_property -dict { PACKAGE_PIN L13 IOSTANDARD LVCMOS33  PULLDOWN true } [get_ports {sw[1]}];
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33   PULLDONW true } [get_ports {sw[2]}];
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33   PULLDONW true } [get_ports {sw[3]}];
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33   PULLDONW true } [get_ports {sw[4]}];
