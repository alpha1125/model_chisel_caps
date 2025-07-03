// Chisel Cap
// By: Lloyd Leung
// 2025-July-02

// Creative Commons
// CC BY-SA
// This license enables reusers to distribute, remix, adapt, and build upon the material in any medium or format, so long as attribution is given to the creator. The license allows for commercial use. If you remix, adapt, or build upon the material, you must license the modified material under identical terms. CC BY-SA includes the following elements:

// BY: credit must be given to the creator.
// SA: Adaptations must be shared under the same terms.

// Inspriations from: Gxrkensalat https://www.printables.com/model/797929-tpu-chisel-protection


// units: millimeters
chisel_w = 25.4*.75;
chisel_h = 4; 

wall_thickness = 2;

sheath_depth = 25.4; // how deep the chisel should go into the cap.

cylinderBump = .5; // use to cause a friction fit. Set to ZERO if you don't want it.


nudge_width = 0.2;  // nudge the width of the hole.  Bigger the number, the looser the fit
nudge_height = 0.5; // nudge the thickness of the hole. 0.5. will increase hole by 0.5


// the outter walls of the cap.
outterWall_w = chisel_w + (2*wall_thickness);
outterWall_h = chisel_h + (2*wall_thickness);
outterWall_d = sheath_depth + wall_thickness;


hole_height = 12; // the height at which the hole will be.



difference(){ // hole for dust/chips

    union(){ // cylinder + box together
        difference(){ // Basic hollow box, to slide the chisel in
            cube(size = [outterWall_w, outterWall_h, outterWall_d], center = false);

            translate([wall_thickness,wall_thickness,wall_thickness+.001])    
                cube(size = [chisel_w+nudge_width, chisel_h+nudge_height, sheath_depth], center = false);
           
        }

        // cylinder, for friction fit
        move_cylinder_along_x = wall_thickness + (0.5 * chisel_w);
        translate([move_cylinder_along_x, wall_thickness, wall_thickness+.01])
          cylinder(h= sheath_depth-.01, r = cylinderBump, center=false, $fn= 32)  ;
    } // /union


    // hole/window, for dust/chips
    translate([wall_thickness, 0, wall_thickness])    
        cube(size = [chisel_w, chisel_h, hole_height], center = false);
}
