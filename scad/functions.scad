$fn=100;
$fa=100;

$kk=0;

key_spacing_x=19.05;
key_spacing_y=19.05;
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
    h=4;
    m=3.5;
    s=q;

    rotate([0,0,90])
    translate ([0, 0, 0]) {
        hull () {
            translate ([0, 0, 0]) {
                cube ([w, 0.1, h], center=true);
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

    h=50;

    render() difference(){
        if (h==2) {
            translate([0,-key_spacing_y/2,h/2 - key_base_z*2]) cube([x+1,y+2,h], center=true);
            translate([0,+key_spacing_y/2,h/2 - key_base_z*2]) cube([x+1,y+2,h], center=true);
        } else {
            if (w==2)  {
                translate([-key_spacing_y/2,0,h/2 - key_base_z*2]) cube([x+1,y+2,h], center=true);
                translate([+key_spacing_y/2,0,h/2 - key_base_z*2]) cube([x+1,y+2,h], center=true);
            } else {
                    translate([0,0,h/2 - key_base_z*2]) cube([x+1,y+2,h], center=true);
            }
        }
        key_hole(1,1,q=q);
        translate([0,0,-key_base_z+0.001]) key_hole(1,1,nips=0);
        translate([0,0,-2*key_base_z+0.002]) key_hole(1,1,nips=0);
  //      translate([0,0,-3*key_base_z+0.005]) key_hole(1,1,nips=0);
    }
}

module key_blank(w=1,h=1){
    hh=6;
    x=key_spacing_x+1;
    y=key_spacing_y+1;

    if (h == 2) {
        translate([0, -key_spacing_y/2, -1]) cube([x,y,hh], center=true);
        translate([0, +key_spacing_y/2, -1]) cube([x,y,hh], center=true);
    } else {
        if (w == 2)  {
            translate([-key_spacing_y/2, 0, -1]) cube([x,y,hh], center=true);
            translate([+key_spacing_y/2, 0, -1]) cube([x,y,hh], center=true);
        } else {
            translate([0,0,-1]) cube([x,y,hh], center=true);
        }
    }
//    translate([0,0,-1]) cube([x,y,hh], center=true);
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



module right_thumb(b=0, q=0){
    radius=200;

    translate([0,-205,166]) rotate([40,0,0])
    if (b==0) {
       rotate([0,0,0]) translate([0,0,-radius]) key(2);
       rotate([0,0,0]) translate([0,0,-radius]) key(2);
       rotate([0,0,0]) translate([0,0,-radius]) key(2);
       rotate([0,0,0]) translate([0,0,-radius]) key(2);
    }

*    rotate([30,0,0]) {

        if (b==0) {
            color("green")  translate([0,-61,50]) key_xxx(h=1,w=7,l=7);




         }

        if (b==1) {
                rotate([0,0,0]) translate([key_spacing_x,0,0]) key(h=2);
                rotate([0,5,0]) translate([0,0,1]) key(h=2);
                color("green") rotate([0,10,0]) translate([-key_spacing_x,0,0]) key_stamp(h=1);

                if (q==0) color("green") rotate([0,10,-5]) translate([-key_spacing_x-4,key_spacing_y+2,0]) key_stamp(h=1);

                color("green")  translate([0,-61,50]) key_stamp(h=1);

        }


    }
}
/////////////////////////////////////////////////////////////////////////////
module right_thumb2(b=0, q=0){

        if (b==0) color("green") rotate([30,0,0]) translate([0,-61,50]) key_blank(h=1);
        if (b==1) color("green") rotate([30,0,0]) translate([0,-61,50]) key_stamp(h=1);

   * difference(){

        translate([31,-98,2]) rotate([15,-25,45]){
            if (b==0)  union(){
                color("red") rotate([0,0,0]) translate([key_spacing_x,0,0]) key_blank(h=2);
                color("blue") rotate([0,5,0]) translate([0,0,1]) key_blank(h=2);
                color("green") rotate([0,10,0]) translate([-key_spacing_x,0,0]) key_blank(h=1);
                color("green") rotate([0,10,0]) translate([-2*key_spacing_x,0,0]) key_blank(h=1);
                color("green") rotate([0,10,0]) translate([-key_spacing_x,-key_spacing_y,-0.5]) key_blank(h=1);

//                color("pink") rotate([0,0,0]) translate([key_spacing_x*2,0,0]) key_blank(h=2);
  //              color("red") rotate([0,0,0]) translate([key_spacing_x,key_spacing_y,0]) key_blank(h=2);
    //            color("blue") rotate([0,5,0]) translate([0,key_spacing_y,1]) key_blank(h=2);

                if (q==0) color("green") rotate([0,10,-5]) translate([-key_spacing_x-4,key_spacing_y+2,0]) key_blank(h=1);

            }
            if (b==1) union(){
                color("red") rotate([0,0,0]) translate([key_spacing_x,0,5]) key_blank(h=2);
                color("blue") rotate([0,5,0]) translate([0,0,6]) key_blank(h=2);

                rotate([0,0,0]) translate([key_spacing_x,0,0]) key_stamp(h=2);
                rotate([0,5,0]) translate([0,0,1]) key_stamp(h=2);
                color("green") rotate([0,10,0]) translate([-key_spacing_x,0,0]) key_stamp(h=1);
                if (q==0) color("green") rotate([0,10,-5]) translate([-key_spacing_x-4,key_spacing_y+2,0]) key_stamp(h=1);
            }
        }

    }
    Q=0.01;
    if (b==0) {
        color("pink") hull(){
            translate([49,-65,17.1]) cylinder(5,Q,Q);
            translate([72,-52,13.1]) cylinder(5,Q,Q);

            translate([8,-66.3,16]) cylinder(5,Q,Q);
            *translate([59,-73,10.4]) cylinder(5,Q,Q);
            translate([16,-100,-1]) cylinder(5,Q,Q);
            translate([0,-100,-2]) cylinder(5,Q,Q);
        }
*        color("pink") hull(){
            translate([39,-65,16.1]) cylinder(5,Q,Q);
            translate([8,-66.3,16]) cylinder(5,Q,Q);
            translate([42,-73,12.4]) cylinder(5,Q,Q);
            translate([16,-100,-1]) cylinder(5,Q,Q);
            translate([0,-100,-2]) cylinder(5,Q,Q);
        }
*        color("purple") hull(){
            translate([44,-73,13.1]) cylinder(5,Q,Q);
            translate([66.8,-90,6]) cylinder(5,1,1);     // corner
            translate([69,-60,11]) cylinder(5,Q,Q);
        }
        color("cyan")  hull(){
            translate([66.8,-90,-47]) cylinder(60,2,2);
            translate([37,-122,-66]) cylinder(60,2,2);
        }
        hull(){
            translate([66.8,-90,-47]) cylinder(60,2,2);
            translate([66.8,-85,-47]) cylinder(60,2,2);
        }


    }
}

module left_thumb(b){
    mirror([1,0,0]) right_thumb(b=b,q=1);
}

module thumbs(){
    Q=0.01;
    difference(){
        union(){
            right_thumb(b=0);
            left_thumb(b=0);
            color("pink") hull(){
                translate([-8,-66.3,16]) cylinder(5,Q,Q);
                translate([8,-66.3,16]) cylinder(5,Q,Q);
                translate([0,-100,-2]) cylinder(5,Q,Q);
            }

            color("magenta") hull(){
                translate([37,-122,-66]) cylinder(60,2,2);
                translate([-37,-122,-66]) cylinder(60,2,2);
            }

        }
        color("cyan")  hull(){
            translate([75,-90,-47]) cylinder(60,4,4);
            translate([26,-144,-66]) cylinder(60,4,4);
        }

        color("cyan")  hull(){
            translate([-75,-90,-47]) cylinder(60,4,4);
            translate([-26,-144,-66]) cylinder(60,4,4);
        }

        color("magenta") hull(){
            translate([50,-126,-66]) cylinder(80,2,2);
            translate([-50,-126,-66]) cylinder(80,2,2);
        }

        union(){
            right_thumb(b=1);
            left_thumb(b=1);
            translate([-100,-66.5,0]) cube([200,100,100]);
            translate([-100,-225,-100]) cube([200,100,300]);
        }
        fudge2();
    }
}

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



module fudge2(){
//    translate([0,0,-530]) cube(1000,1000,100,center=true);
    translate([0,0,-520]) cube(1000,1000,100,center=true);
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


module KEY(q){
    difference(){
        key_blank();
        key_stamp(q);
    }
}
