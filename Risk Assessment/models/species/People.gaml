/***
* Name: DetectedCase
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model People

import "AdministrativeBound.gaml"
species People skills: [moving] {
	float size <- 2 #km;
	bool confined <- false;
	bool recovered <- false;
	bool infected <- false;
	path ownpath;
	point my_target;
	//	float spd <- (1+rnd(5))#m;
	float spd <- (10) #m;
	rgb mycolor <- hsb(240 / 360, 0.5 + (rnd(5) / 10), 1);
	int condense<-1;
	action init {
		geometry c <- square(size * (1 + rnd(4))) at_location location;
		list cc <- [];
		loop times: condense {
			cc <+ triangle(size) at_location any_location_in(c);
		}

		shape <- union(cc);
	}

	reflex moving_province when: !infected and show_traffic{
		do goto target: my_target speed: spd;
		if ((location distance_to my_target) < 4 #km) {
			do die;
		}

	}

	aspect default {
		if (show_traffic) {
			draw shape empty: true color: mycolor;
		}

	}

}