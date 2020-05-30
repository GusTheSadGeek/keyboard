use <keys.scad>;
use <main.scad>;


//include <values.scad>;



module thumbs_new() {
z=108;
difference(){
    rotate([0,0,45]) cube([z,z,5], center=true);
    translate([0,82,0]) cube([100,100,10], center=true);
    translate([0,-95,0]) cube([100,100,10], center=true);


    translate([key_spacing_x,3+key_spacing_y,1]) key_stamp(w=1);
    translate([0,3+key_spacing_y,1]) key_stamp(w=1);
    translate([-key_spacing_x,3+key_spacing_y,1]) key_stamp(w=1);

    translate([key_spacing_x/-2,3,1]) key_stamp(w=1);
    translate([key_spacing_x/2,3,1]) key_stamp(w=1);

    translate([0,3-key_spacing_y,1]) key_stamp(w=1);


    translate([50,11,1]) rotate([0,0,-45]) key_stamp(w=1);       // return
    translate([38.5,-9.5,1]) rotate([0,0,-33]) key_stamp(w=1);
    translate([28,-29,1]) rotate([0,0,-15]) key_stamp(w=1);

    translate([-50,11,1]) rotate([0,0,45]) key_stamp(w=1);
    translate([-38.5,-9.5,1]) rotate([0,0,33]) key_stamp(w=1);
    translate([-28,-29,1]) rotate([0,0,15]) key_stamp(w=1);

    }
}

module centre(padding=0){
    radius=200;

    union(){
        k=$kk;
        if (padding==1){
            translate([0,0,radius]){
                rotate([0,0,0]) rotate([16.5,0,0]) translate([0,0,-radius]) key($kk=k);
            }
        }
        translate([0,0,radius]){
            rotate([0,0,0]) rotate([11.0,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([-9.525,0,radius]){
            rotate([0,0,0]) rotate([5.5,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([9.525,0,radius]){
            rotate([0,0,0]) rotate([5.5,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([-19.05,0,radius]){
            rotate([0,0,0]) rotate([0.0,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([0,0,radius]){
            rotate([0,0,0]) rotate([0.0,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([19.05,0,radius]){
            rotate([0,0,0]) rotate([0.0,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([-19.05,0,radius]){
            rotate([0,0,0]) rotate([-5.5,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([0,0,radius]){
            rotate([0,0,0]) rotate([-5.5,0,0]) translate([0,0,-radius]) key($kk=k);
        }
        translate([19.05,0,radius]){
            rotate([0,0,0]) rotate([-5.5,0,0]) translate([0,0,-radius]) key($kk=k);
        }
    }
}



module strip_r(ry=4, a=1,b=1,c=1,d=1,e=1,f=1){
        radius=200;

        k=$kk;
        if (a==1) rotate([0,ry,0]) rotate([-17.1,0,0]) translate([0,0,-radius]) key($kk=k)  ;  //bottom
        if (b==1) rotate([0,ry,0]) rotate([-11.4,0,0]) translate([0,0,-radius]) key($kk=k);
        if (c==1) rotate([0,ry,0]) rotate([-5.7,0,0]) translate([0,0,-radius]) key($kk=k);
        if (d==1) rotate([0,ry,0]) rotate([0.0,0,0]) translate([0,0,-radius]) key($kk=k);
        if (e==1) rotate([0,ry,0]) rotate([5.7,0,0]) translate([0,0,-radius]) key($kk=k);
        if (f==1) rotate([0,ry,0]) rotate([11.4,0,0]) translate([0,0,-radius]) key($kk=k);  //top

}

module keyboard_right(){
    union(){
        translate([0,0,0])      strip_r(ry=4,a=0);
        translate([12.55,0,-2]) strip_r(ry=2);
        translate([25.1,0,-5])  strip_r(ry=0);
        translate([34.15,0,-3]) strip_r(ry=-3);
        translate([43.2,0,-2])  strip_r(ry=-6);
        translate([55.75,0,0])  strip_r(ry=-8);
    }
}

module keyboard_left(){
    union(){
        translate([0,0,0])       strip_r(ry=-4,a=0);
        translate([-12.55,0,-2]) strip_r(ry=-2);
        translate([-25.1,0,-5])  strip_r(ry=0);
        translate([-34.15,0,-3]) strip_r(ry=3);
        translate([-43.2,0,-2])  strip_r(ry=6);
        translate([-55.75,0,0])  strip_r(ry=8);
    }
}
