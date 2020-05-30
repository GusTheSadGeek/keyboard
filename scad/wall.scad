/////////////////////////////////////////////////////////////////////////////
T=4;
tt=T/2;

module C1() translate([115.5,61,-106]) cylinder(100,tt,tt);
module C2() translate([8,22,-77]) cylinder(100,tt,tt);

//module C3() translate([0,18,-78]) cylinder(100,tt,tt);
module C3() translate([0,22,-77]) cylinder(100,tt,tt);

module C4() translate([-8,22,-77]) cylinder(100,tt,tt);
module C5() translate([-115.5,61,-106]) cylinder(100,tt,tt);

module C6() translate([-157.5,-51,-100]) cylinder(100,tt,tt);
module C7() translate([-66,-85,-79]) cylinder(100,tt,tt);


module C8() translate([66,-85,-79]) cylinder(100,tt,tt);
module C9() translate([157.5,-51,-100]) cylinder(100,tt,tt);

module fudge(){
    hull(){
        C1();
        C9();
    }
    hull(){
        C8();
        C9();
    }

    hull(){
        C1();
        C2();
    }
    hull(){
        C2();
        C3();
    }
    hull(){
        C3();
        C4();
    }
    hull(){
        C4();
        C5();
    }
    hull(){
        C5();
        C6();
    }
    hull(){
        C6();
        C7();
    }
}

module fudgeBaseA(){
    hull(){
        C1();
        C2();
        C9();
        C8();
        C7();
    }
}
module fudgeBaseB(){
    hull(){
        C4();
        C5();
        C6();
        C7();
        C8();
    }
}
module fudgeBaseC(){
    hull(){
        C2();
        C3();
        C4();
        C9();
        C6();
    }
}



module bottom_cut(){
    translate([0,0,-70]) cube([1000,1000,100],center=true);
}
module fudge3(){
    translate([0,20,0]) rotate([0,0,20])cube([100,100,100]);
    mirror([1,0,0]) translate([0,20,0]) rotate([0,0,20])cube([100,100,100]);
}



module fudgeA(){
    difference(){
    union(){
        translate([-7,14.5,-35]) rotate([0,14,20])cube([150,2,60]);
        translate([-130,64.2,-71]) rotate([0,-14,-20])cube([150,2,60]);

        translate([160,-60,-30]) rotate([-3,0,20])cube([2,150,30]);
        translate([-162,-60,-30]) rotate([-3,0,-20])cube([2,150,30]);

        translate([55,-90,-37]) rotate([0,13,20])cube([105,2,60]);
        translate([-150,-55,-61]) rotate([0,-13,-20])cube([105,2,60]);
    }

    }
}

module fudge2A(){
    translate([-7,16.5,-30]) rotate([0,14,20])cube([150,50,60]);
    translate([-130,66.2,-66]) rotate([0,-14,-20])cube([150,50,60]);

    translate([161,-60,-55]) rotate([-3,0,20])cube([50,150,100]);
    translate([-215.2,-60,-55]) rotate([-3,0,-20])cube([50,150,100]);

    translate([55,-143.2,-30]) rotate([0,13,20])cube([150,50,60]);
    translate([-200,-90,-61]) rotate([0,-13,-20])cube([200,50,60]);

    translate([0,0,-530]) cube(1000,1000,100,center=true);
    translate([-10,11,-30]) cube([20,10,43]);
    translate([-20,12.5,21]) cube([40,15,11]);
}

module fudge3A(){
    translate([-10,20.5,-30]) cube([20,2,51]);
    translate([-10,14.5,13]) cube([20,8,8]);

}



////////////////////////////////////////////////////////////////////

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
module thumbfillets(){
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
