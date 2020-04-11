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

	action move {
		target <- #user_location;
		if (c_zoom <= 6) {
			under_mouse_agent <- first(AdministrativeBound_1 overlapping (zone at_location #user_location));
		} else {
			under_mouse_agent <- first(AdministrativeBound_2 overlapping (zone at_location #user_location));
		}

	}

}