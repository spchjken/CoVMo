/***
* Name: DetectedCase
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/

@no_experiment

model DetectedCase
import "AdministrativeBound.gaml"
species DetectedCase skills:[moving]{
	date detected_date;
	AdministrativeBound origin;
	rgb mycolor<-hsb(0,0.5+(rnd(5)/10) , 1);
	reflex ss{
		do wander amplitude:45.0  bounds:origin.circle_bound speed:0.25#m;
	}
	aspect default{
		if(#zoom>2){
			draw circle(2#km) color:mycolor ;			
		}else{
			
			draw circle(2#km) color:mycolor;
		}
	}
}