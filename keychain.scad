$fn=50;

difference(){
    minkowski(){
    cube([25,15,1]);
    cylinder(r=3, h=1);
    }
    translate([0,-1,1]) linear_extrude(3) text("", font="Webdings", size=22);
    translate([2,2,-1]) cylinder(r=3, h=7);
}

