$fn  = 50;
icon_size = 20;
height = 45;
width = 32;
wall_thickness = 2;
width_compensation = 1.4;
module icon(){
    translate([0,8,12]) rotate([-90,90,-90]){
        linear_extrude(height=3) text("", font="Webdings",size=icon_size, halign= "center", valign = "center");
        translate([0, 1, 0]) rotate([0,0,-13]) linear_extrude(height=3) text("/", font="Arial",size=icon_size, halign= "center", valign = "center");
    }
}

function text_offset(value) = (value / 2) - (icon_size / 2);

linear_extrude(height=height){
    square([wall_thickness, width]);
    square([width -1 , wall_thickness]);
    translate([29, 0]) square([wall_thickness,10]);
}

translate([-2, text_offset(width) , text_offset(height) - width_compensation]) icon();