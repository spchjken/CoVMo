/***
* Name: Corona
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
model Corona

import "Abstract Experiment.gaml"
 
experiment "Show 4 zones" type: gui parent:AbstractExp{
 
	action _init_ {
		float simulation_seed <- rnd(2000.0);
		loop id over: lst_GIS_id {
			
			string filepath <- "../../includes/gadm36_VNM_shp/generated/" + id + ".shp";
			create simulation with: [do_init::true,GIS_id::id, provinces_shp_file::shape_file(filepath)];
		}

	}

	output { 		
		layout #split consoles: false editors: false navigator: false tray: false tabs: false toolbars: false;
	
//		layout horizontal([horizontal([0::5000, 1::5000])::5000, vertical([horizontal([2::5000, 3::5000])::5000, horizontal([4::5000, 5::5000])::5000])::5000]) consoles: false editors:
//		false navigator: false tray: false tabs: true toolbars: false;
		display "Detected" parent: default_display synchronized:false{
		}
		display "Risky" parent: default_display_risk synchronized:false {
		}
	}

}