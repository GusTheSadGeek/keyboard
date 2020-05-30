key_spacing_x=19.05;
key_spacing_y=19.05;
print_base=false;
print_top=true;




include <keys.scad>;
include <wall.scad>;
include <boards.scad>;


s=94;
r=20;
a=15;



module keyboard() {
// keyboards
    difference(){
        union(){
            // center section no holes
            difference(){
                translate([0,-40,15])   rotate([-3.5,00,0]) centre($kk=3, padding=1);
                translate([s,0,200])    rotate([0,a,r]) keyboard_right($kk=6);
                translate([-s,0,200])   rotate([0,-a,-r]) keyboard_left($kk=6);
                fudge3(); //trim excess from top
            }
            // right section
            translate([s,0,200])    rotate([0,a,r]) keyboard_right($kk=2);   // Cut right holes
            // left section
            translate([-s,0,200])   rotate([0,-a,-r]) keyboard_left($kk=2);  // Cut left holes
        }
        translate([0,-40,15])   rotate([-3,00,0]) centre($kk=1, padding=0);   // Cut center holes
    }
    translate([0,-99,9.8]) rotate([15,0,0]) thumbs_new();

// walls
    difference(){
        union(){
            translate([0,-99,9.8])  thumbs_wall();
            fudge();
            thumbfillets();
        }
        bottom_cut();
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
        translate([0,0,258]) cube([500,500,500],center=true);
        translate([0,0,-245]) cube([500,500,500],center=true);
    }
}


// KEYBOARD
if (print_top) keyboard();

// BASE
if (print_base) Base();
