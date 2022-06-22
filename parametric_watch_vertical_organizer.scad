total_boxes=7;
box_width=50;
box_length=25;
box_height=45;
border_radius=2;
separator_width=2;
separator_gap=10;
$fn=50;

cyl_r           = separator_width/2;
bar_width       = (box_width - separator_gap) / 2;
cutter_z_depth  = -1 * separator_width; 
cutter_z_offset = 2 * separator_width;
total_separator = (total_boxes == 1) ? 0 : total_boxes - 1;
total_length    = (box_length * total_boxes) + (separator_width * total_separator) - border_radius;
total_width     = box_width - (border_radius * 2);

module bar(y_position){
    hull(){
        translate([-10, y_position, cutter_z_depth]) cylinder(r=cyl_r, h=box_height + cutter_z_offset);
        translate([bar_width - separator_width, y_position, cutter_z_depth]) cylinder(r=cyl_r, h=box_height + cutter_z_offset);
    }
    hull(){
        translate([(bar_width + separator_gap) - separator_width, y_position, cutter_z_depth]) cylinder(r=cyl_r, h=box_height + cutter_z_offset);
        translate([box_width + 10, y_position, cutter_z_depth]) cylinder(r=cyl_r, h=box_height + cutter_z_offset);
    }
}


difference(){
minkowski(){
cube([total_width, total_length, box_height - 1]);
cylinder(r = border_radius, h = 1);
}
for(i = [0:1:total_boxes - 2]){
 blade_position = box_length + (i * box_length) + (i * separator_width);
 #bar(blade_position);
 
 }
}
