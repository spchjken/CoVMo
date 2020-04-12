/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model move

import "../Constants.gaml"
import "../Parameters.gaml"
import "../species/AdministrativeBound.gaml"

global {

	action when_mouse_move {
		info_target <- #user_location;
		if (c_zoom <= zoom1) {
			under_mouse_agent <- first(AdministrativeBound_1 overlapping (zone at_location #user_location));
		} 
		if (c_zoom > zoom1 and c_zoom<=zoom2) {
			under_mouse_agent <- first(AdministrativeBound_2 overlapping (zone at_location #user_location));
		}
		if (c_zoom > zoom2) {
			under_mouse_agent <- first(AdministrativeBound_3 overlapping (zone at_location #user_location));
		}
		if(under_mouse_agent!=nil){			
			info_text <- under_mouse_agent.current_name;
			info_text <- info_text + ": " + length(under_mouse_agent.detected_cases_F0);
		}
	}

}