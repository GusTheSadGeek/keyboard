$fn=100;
$fa=100;

$kk=0;

//key_spacing_x=19.05;
//key_spacing_y=19.05;
key_base_x=19.05;
key_base_y=20;
key_hole_x=14.2;
key_hole_y=14.2;
key_hole_z=4;
key_base_z=4;

module nipple(){
    translate ([0, 0, 0]) {
        hull () {
            translate ([0, 0, 0]) {
                cube ([2.5, 0.1, key_hole_z], center=true);
            }
            translate ([0, 0.5-0.1, key_hole_z/5]) {
               cube ([2.5, 0.1, 0.5], center=true);
           }
        }
    }
}


module nipple2(q){
    w=3.5;  // (4)
    z=4;
    m=3.5;
    s=q;

    rotate([0,0,90])
    translate ([0, 0, 0]) {
        hull () {
            translate ([0, 0, 0]) {
                cube ([w, 0.1, z], center=true);
            }
            translate ([0, s, -m/2]) {
               cube ([w, 0.1, 0.1], center=true);
           }
        }
    }
}



module key_hole(l=0,r=0,t=0,b=0,nips=1,q=0.5){
    difference(){
        cube([key_base_x+l,key_base_y+r,key_base_z], center=true);
        cube([key_hole_x,key_hole_x,key_base_z+0.2], center=true);
    }
    if (nips==1) {
        translate([-key_hole_x/2,0,0]) mirror([1,0,0]) nipple2(q);
        translate([key_hole_x/2,0,0]) mirror([0,0,0]) nipple2(q);
    }
}


module key_stamp(q=0.96,w=1,h=1){
    x=key_spacing_x;
    y=key_spacing_y;

    z=50;

    render() difference(){
        if (h==2) {
            translate([0,-key_spacing_y/2,h/2 - key_base_z*2]) cube([x+1,y+2,z], center=true);
            translate([0,+key_spacing_y/2,h/2 - key_base_z*2]) cube([x+1,y+2,z], center=true);
        } else {
            if (w==2)  {
                translate([-key_spacing_y/2,0,h/2 - key_base_z*2]) cube([x+1,y+2,z], center=true);
                translate([+key_spacing_y/2,0,h/2 - key_base_z*2]) cube([x+1,y+2,z], center=true);
            } else {
                    translate([0,0,h/2 - key_base_z*2]) cube([x+1,y+2,z], center=true);
            }
        }
        key_hole(1,1,q=q);
        translate([0,0,-key_base_z+0.001]) key_hole(1,1,nips=0);
        translate([0,0,-2*key_base_z+0.002]) key_hole(1,1,nips=0);
  //      translate([0,0,-3*key_base_z+0.005]) key_hole(1,1,nips=0);
    }
}

module key_blank(w=1,h=1){
    z=6;
    x=key_spacing_x+1.5;
    y=key_spacing_y+1.5;

    if (h == 2) {
        translate([0, -key_spacing_y/2, -1]) cube([x,y,z], center=true);
        translate([0, +key_spacing_y/2, -1]) cube([x,y,z], center=true);
    } else {
        if (w == 2)  {
            translate([-key_spacing_y/2, 0, -1]) cube([x,y,z], center=true);
            translate([+key_spacing_y/2, 0, -1]) cube([x,y,z], center=true);
        } else {
            translate([0,0,-1]) cube([x,y,z], center=true);
        }
    }
//    translate([0,0,-1]) cube([x,y,z], center=true);
}

module key_hhh(z=1){
    hh=6*z;
    x=key_spacing_x+1;
    y=key_spacing_y+1;
//    if (z>1){
//        translate([0,0,hh-1]) cube([x,y,hh], center=true);
//        translate([0,0,-1-hh]) cube([x,y,hh], center=true);
//    }
//    if (z>3){
//        translate([0,0,2*hh-1]) cube([x,y,hh], center=true);
//        translate([0,0,-1-2*hh]) cube([x,y,hh], center=true);
//    }
    translate([0,0,-1]) cube([x,y,hh], center=true);
}


module key_xxx(h=1,w=1,l=1){
    hh=6*h;
    x=key_spacing_x*w+1;
    y=key_spacing_y*l+1;
    translate([0,0,-1]) cube([x,y,hh], center=true);
}

module key_blank_small(){
    h=10;
    x=key_spacing_x + 4;
    y=key_spacing_y + 4;


    translate([0,0,-2]) cube([x,y,h], center=true);
}

module key(x=-1){
    if (x > -1){
        $kk=x;
    }
    if ($kk == 0) {
        key_blank(h=1);
    }
    if ($kk == 1) {
        key_stamp(h=1);
    }
    if ($kk == 2) {
        difference(){
            key_blank(h=1);
            key_stamp(h=1);
        }
    }
    // Wide
    if ($kk == 3) {
        key_xxx(w=3,h=1);
    }
    // TALL
    if ($kk == 4) {
        key_xxx(w=1,h=5);
    }
    // Wide and Tall
    if ($kk == 5) {
        key_xxx(w=3,h=5);
    }
    // long and Tall
    if ($kk == 6) {
        key_xxx(w=1,h=5,l=3);
    }

}

module hkey(){
    difference(){
        key_blank(w=2);
        key_stamp(w=2);
    }
}
module vkey(){
    difference(){
        key_blank(h=2);
        key_stamp(h=2);
    }
}






module KEY(q){
    difference(){
        key_blank();
        key_stamp(q);
    }
}
