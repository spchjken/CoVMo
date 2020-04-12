/***
* Name: DetectedCase
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model DetectedCase

import "People.gaml"
import "AdministrativeBound.gaml"
species DetectedCase parent:People {
	date detected_date;
	bool infected<-true;
	AdministrativeBound origin;
	AdministrativeBound_1 origin1;
	AdministrativeBound_2 origin2;
	rgb mycolor <- hsb(0, 0.5 + (rnd(5) / 10), 1);
	float spd <- 0.25#m;
	//	init{
	//		do change_zoom;
	//	}
	action change_zoom {
		if (c_zoom <= 6) {
			size <- 2 #km;
			spd <- 0.25#m;
			if (origin1 != nil and origin!=origin1) {
				origin <- origin1;
				origin.circle_bound <- circle(origin.size_of_circle_1) at_location origin.location;
				location <- any_location_in(origin.circle_bound);
			}

		}

		if (c_zoom > 6) {
			size <- 0.5 #km;
			spd <- 0.1#m;
			if (origin2 != nil and origin!=origin2) {
				origin <- origin2;
				origin.circle_bound <- circle(origin.size_of_circle_2) at_location origin.location;
				location <- any_location_in(origin.circle_bound);
			}

		}

	} 
	reflex ss when:!recovered and !confined{
//		do change_zoom;
		do wander amplitude: 45.0 bounds: origin.circle_bound speed:spd;
	}

	aspect default {
		if(!recovered and !confined){			
			if (#zoom > 2) {
				draw circle(size) color: mycolor;
			} else {
				draw circle(size) color: mycolor;
			}
		}

	}

}