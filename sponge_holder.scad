$fn = 50;
sponge_width = 74;
sponge_depth = 23;
sponge_height = 95;

extra_space = 5;
divider_gap = 10;
wall_thickness = 2;
holder_height = 15;
screw_hole_radius = 2.5;

width = sponge_width + extra_space;
height = sponge_height + extra_space;
depth = sponge_depth + extra_space;
wall = wall_thickness * 2; 
twist_angle = 45;
subwall_length = floor((width - divider_gap) / 2); 

module leaf(){
   linear_extrude(depth, twist=twist_angle) square([subwall_length , wall_thickness]);
}

module sidecover(){
    holder_radius = holder_height / 2;
    union(){
        cube([subwall_length - holder_radius , holder_height, wall_thickness]);
        translate([subwall_length - holder_radius, holder_radius, 0]) cylinder(r=holder_radius, h =wall_thickness);
    }
}

module holder() {
    ystart = (height / 2) - holder_height;
    translate([0,ystart, 0]) cube([wall_thickness, holder_height, depth + wall_thickness]);
    translate([width - wall_thickness,ystart, 0]) cube([wall_thickness, holder_height, depth + wall_thickness]);
    translate([0, ystart, depth+wall_thickness]) union(){
        sidecover();
        translate([width, 0,0]) mirror([1,0,0]) sidecover(); 
    }
}
difference(){
    union(){
        leaf();
        translate([width, 0]) mirror([1,0]) leaf();
        cube([width, height/2, wall_thickness]);
        holder();
    }
    translate([width /2, height / 3, -1])cylinder(r=screw_hole_radius, h=wall_thickness + 2);
}
