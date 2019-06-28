// Units are in millimeters

// Thickness (Z)
d_outer = 2.0;
d_inner = 1.0;

// Radius (XY)
r_thickness = 2.0;
r_outer = 30.0;
r_inner = r_outer - r_thickness;

// Font stuff
font = "Liberation Sans";

letter_size = 25;
letter_height = d_outer;


// Makes a letter or some shit?
module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = letter_height) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	}
}


// Make the main shape
module tag_shape() {
    difference() {
        // Outline of the tag
        cylinder(h = d_outer, r = r_outer);

        // Subtracted inner shape
        translate([0.0, 0.0, d_inner])
            cylinder(h = d_inner + d_outer, r = r_inner);
    }
}





// Make that stuff
union() {
    // The tag
    tag_shape();
    // Make that C letter!
    letter("C");
}




























