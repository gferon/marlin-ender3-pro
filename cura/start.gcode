; Ender 3 Custom Start G-code
M140 S{material_bed_temperature_layer_0} ; Start preheating the bed
M104 S{material_print_temperature_layer_0} TO ; Start preheating the hot-end
M190 S{material_bed_temperature_layer_0} ; Heat bed
M109 S{material_print_temperature_layer_0} TO ; Heat hot-end
G28 ; Home all axes
G29 ; Auto-level Z-axis with bed leveling sensor
G1 Z0.5 ; De-active bed leveling sensor
G92
G1 Z5
G29 A ; Enable UBL
G29 L0 ; Load UBL Slot #1
G92 E0 ; Reset Extruder
G1 Z2.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X0.1 Y20 Z0.3 F5000.0 ; Move to start position
G1 X0.1 Y200.0 Z0.3 F1500.0 E15 ; Draw the first line
G1 X0.4 Y200.0 Z0.3 F5000.0 ; Move to side a little
G1 X0.4 Y20 Z0.3 F1500.0 E30 ; Draw the second line
G92 E0 ; Reset Extruder
G1 Z2.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X5 Y20 Z0.3 F5000.0 ; Move over to prevent blob squish
