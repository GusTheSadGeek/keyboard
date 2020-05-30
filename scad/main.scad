use <functions.scad>;
use <out.scad>;

key_spacing_x=19.05;
key_spacing_y=19.05;

module thumbs_corners(h=5) {
z=108;
    difference(){
        rotate([0,0,45]) cube([z,z,h], center=true);
        translate([0,83,0]) cube([100,100,20], center=true);
        translate([0,-95,0]) cube([100,100,20], center=true);
    }
}

module thumbs_corners2(h=5,x=3) {
    z=108;
    difference(){
        rotate([0,0,45]) cube([z,z,h], center=true);
        translate([x,0,0]) rotate([0,0,45]) cube([z,z,20], center=true);
        translate([0,83,0]) cube([100,100,20], center=true);
        translate([0,-100,0]) cube([200,200,20], center=true);
    }
}


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

module thumbs_wall(){
    difference(){
        hull(){
            rotate([15,0,0]) difference(){
                thumbs_corners();
                translate([0,3,1]) thumbs_corners(10);
            }

            translate([0,0,-100]) rotate([30,0,0]) difference(){
                thumbs_corners();
                translate([0,3,1]) thumbs_corners(10);
            }
        }
        translate([0,3,10])hull(){
            rotate([15,0,0]) difference(){
                thumbs_corners();
                translate([0,3,1]) thumbs_corners(10);
            }

            translate([0,0,-200]) rotate([30,0,0]) difference(){
                thumbs_corners();
                translate([0,3,1]) thumbs_corners(10);
            }
        }
    }

    difference(){
        union(){
            hull(){
                rotate([15,0,0]) thumbs_corners2(x=4);
                translate([0,0,-100]) rotate([15,0,0]) thumbs_corners2(x=3);
            }
            hull(){
                rotate([15,0,0]) thumbs_corners2(x=-3);
                translate([0,0,-100]) rotate([15,0,0]) thumbs_corners2(x=-3);
            }
        }
        translate([0,89,0]) rotate([0,0,45]) cube([200,200,100], center=true);
    }
}


module fillets(){
module c(){
    cylinder(5,0.1,0.1);
}

color("red") hull(){
    translate([-61,-64,9]) c();
    translate([-45.7,-70,15]) c();
    translate([-69,-84,15]) c();
    translate([-64.4,-88,10.2]) c();
}
color("green") hull(){
    translate([61,-64,9]) c();
    translate([45.7,-70,15]) c();
    translate([69,-84,15]) c();
    translate([64.4,-88,10.2]) c();
}

color("blue") translate([64.5,-86,-20]) cylinder(35,2,2);
color("blue") translate([-64.5,-86,-20]) cylinder(35,2,2);

}

module keyboard(){
    union(){
        difference(){
            base();
            base_stamp();
        }
        difference(){
            fudge();
            fudge2();
        }
        fudge3();
    }
}



*render(){
translate([20,0,0]) KEY(0.3);
translate([40,0,0]) KEY(0.4);
translate([60,0,0]) KEY(0.5);
translate([80,0,0]) KEY(0.6);
translate([100,0,0]) KEY(0.7);
translate([120,0,0]) KEY(0.8);
translate([140,0,0]) KEY(0.9);
translate([160,0,0]) KEY(1);
}

*keyboard();
*difference(){
    thumbs();
    keyboardMask();
}


module keyboard_right(){
    union(){
        strip_r1();
        strip_r2();
        strip_r3();
        strip_r4();
        strip_r5();
        strip_r6();
    }
}

module keyboard_left(){
    union(){
        strip_l1($kk=$kk);
        strip_l2($kk=$kk);
        strip_l3($kk=$kk);
        strip_l4($kk=$kk);
        strip_l5($kk=$kk);
        strip_l6($kk=$kk);
    }
}

module keyboard_leftx(){
    keyboard_left($kk=$kk);
}

module keyboard_rightx(){
    keyboard_right($kk=$kk);
}

s=94;
r=20;
a=15;

module keyboardMask(){
s=94;
r=20;
a=15;
    translate([0,-40,15])   rotate([-3.5,00,0]) centre($kk=5, padding=1);
    translate([s,0,200])    rotate([0,a,r]) keyboard_rightx($kk=4);
    translate([-s,0,200])   rotate([0,-a,-r]) keyboard_leftx($kk=4);
}


module keyboard() {
union(){
//render()
    difference(){
    union(){
        difference(){
            translate([0,-40,15])   rotate([-3.5,00,0]) centre($kk=3, padding=1);
            translate([s,0,200])    rotate([0,a,r]) keyboard_rightx($kk=6);
            translate([-s,0,200])   rotate([0,-a,-r]) keyboard_leftx($kk=6);
        }
        translate([s,0,200])    rotate([0,a,r]) keyboard_rightx($kk=2);   // Cut right holes
        translate([-s,0,200])   rotate([0,-a,-r]) keyboard_leftx($kk=2);  // Cut left holes
    }
    translate([0,-40,15])   rotate([-3,00,0]) centre($kk=1, padding=0);   // Cut center holes
    fudge3();
    }


    translate([0,-99,9.8]) rotate([15,0,0]) thumbs_new();
    difference(){
        translate([0,-99,9.8])  thumbs_wall();
        fudge2();
    }

    difference(){
        fudge();
        fudge2();
    }
    fillets();
}
}

module Base() {
difference(){
    union(){
        hull()  translate([0,-99,60.8])  thumbs_wall();
        translate([0,0,20]) {
            fudgeBaseA();
            fudgeBaseB();
            fudgeBaseC();
        }
    }
    translate([0,0,258]) cube(500,500,500,center=true);
    translate([0,0,-245]) cube(500,500,500,center=true);
    }
}




*difference(){
thumbs_new();
translate([-100,0,0]) cube([200,200,200],center=true);
}


// KEYBOARD
*keyboard();

// BASE
Base();
