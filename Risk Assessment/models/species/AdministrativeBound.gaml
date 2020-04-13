/***
* Name: AdministrativeBound
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model AdministrativeBound

import "EpidemiologicHost.gaml"
import "DetectedCase.gaml"
import "../Parameters.gaml"
species AdministrativeBound parent: EpidemiologicHost {
	string NAME_1;
	string NAME_2;
	string NAME_3;
	string GID_1;
	string GID_2;
	string GID_3;
	string VARNAME_1;
	string VARNAME_2;
	string VARNAME_3;
	list<AdministrativeBound> neighbors <- [];
	list<DetectedCase> detected_cases_F0 <- [];
	int F1 -> {int(3 * length(detected_cases_F0))};
	int extern;
	int foreigner;
	int moving;
	int high_contact;
	int low_contact;
	int social_distancing;
	int traffic_in;
	int emphasize;
	float risk_point ;//-> {accessment()};
	float risk_social;
	float risk_contact;
	float risk_policy;
	string current_gid;
	string current_name;
	string current_varname;
	string parent_varname;
	geometry circle_bound; 
	rgb my_risk_color; 
	float size_of_circle_1 -> {(1 #km + ((length(detected_cases_F0) / nb_increase_size_1) < 30 ? (length(detected_cases_F0) / nb_increase_size_1) #km : 30 #km))};
	float size_of_circle_2 -> {(1 #km + ((length(detected_cases_F0) / nb_increase_size_1) < 30 ? (length(detected_cases_F0) / nb_increase_size_1) #km : 30 #km)) * ((world.shape.perimeter) / 8000000)};
	float size_of_circle_3 -> {(1 #km + ((length(detected_cases_F0) / nb_increase_size_1) < 30 ? (length(detected_cases_F0) / nb_increase_size_1) #km : 30 #km)) * ((world.shape.perimeter) / 20000000)};
	//	map<int,float> c_size<-[5::size_of_circle_1,8::size_of_circle_2,11::size_of_circle_3];
	float accessment {
		return weight_risk_social * get_risk_social() + weight_risk_contact * get_risk_contact() + weight_risk_policy * get_risk_policy();
	}

	float get_risk_social {
		return p_F0F1 * ((length(detected_cases_F0) + F1)) + p_extern * (extern) + p_foreigner * (foreigner) + p_moving * (moving);
	}

	float get_risk_contact {
		return p_high_contact * high_contact + p_low_contact * low_contact;
	}

	float get_risk_policy {
		return p_social_distancing * social_distancing + p_traffic_in * traffic_in + p_emphasize * emphasize;
	}

	aspect risky {
	//		if(accessment()>0){			
		draw shape color: my_risk_color border: #black;
		//		}
		//		if (#zoom > 1.1) {
		//			draw NAME_3 at: location color: #black;
		//		}

	}

	aspect default {
	//		draw shape color: I>0?#red:#white border: #black;
		draw shape color: #white empty: true border: #darkgray;
		if (length(detected_cases_F0) > 0) {
			if (length(GIS_id) = 5) {
				draw circle(size_of_circle_1) color: #red;
			}

			if (length(GIS_id) = 8) {
				draw circle(size_of_circle_2) color: #red;
			}

			if (length(GIS_id) = 11) {
				draw circle(size_of_circle_3) color: #red;
			}
			//			draw circle( (d <10? (d*2)#km:20#km)*((world.shape.perimeter)/2000000)   ) color: #yellow;
			//			draw arc((d <10? (d*2)#km:20#km)*((world.shape.perimeter)/2000000),0,180,true) color: #red;
			//			draw arc((d <10? (d*2)#km:20#km)*((world.shape.perimeter)/2000000),180,180,true)   color: #yellow;
		}

	}

	aspect simple {
	//		draw shape color: I>0?#red:#white border: #black;
		draw shape color: my_risk_color border: #white;
		//		if (#zoom > 3) {
		//			draw current_name at: location color: #white;
		//		}

	}

	aspect mixed {
	// 		draw shape color: #white empty: true border: #darkgray;
		draw shape color: my_risk_color border: #black;
		if (length(detected_cases_F0) > 0) {
			if (length(GIS_id) = 5) {
				draw circle(size_of_circle_1) color: #red border: #yellow;
			}

			if (length(GIS_id) = 8) {
				draw circle(size_of_circle_2) color: #red border: #yellow;
			}

			if (length(GIS_id) = 11) {
				draw circle(size_of_circle_3) color: #red border: #yellow;
			}

		}

	}

	aspect mixed_wander {
	// 		draw shape color: #white empty: true border: #darkgray;
		draw shape color: my_risk_color border: #black;

		//		if (length(detected_cases_F0) > 0) {
		//			if (length(GIS_id) = 5) {
		//				draw circle(size_of_circle_1) color: #red border: #yellow;
		//			}
		//
		//			if (length(GIS_id) = 8) {
		//				draw circle(size_of_circle_2) color: #red border: #yellow;
		//			}
		//
		//			if (length(GIS_id) = 11) {
		//				draw circle(size_of_circle_3) color: #red border: #yellow;
		//			}
		//
		//		}

	}

}

species AdministrativeBound_1 parent: AdministrativeBound {
	list<AdministrativeBound_1> possible_transport<-[];
	int flow_capacity<-1;
	reflex transportation when:!empty(possible_transport) and show_traffic{
		loop p over:possible_transport{			
			create People{
				condense<-myself.flow_capacity;
				location<-myself.location;
				my_target<-p.location;
				do init;
			}
		}

	}

	aspect simple {
		if (#zoom <= zoom1) {
			draw shape color: my_risk_color border:#lightgray;
//			draw shape color: #white empty: true border: #gray;
			//			draw current_name at: location color: #white;
		}
//			draw circle(2#km) color:  #red  border: #black;

	}

}

species AdministrativeBound_2 parent: AdministrativeBound {

	aspect simple {
	//		draw shape color: I>0?#red:#white border: #black;
		if (#zoom > zoom1 and #zoom<=zoom2) {
			draw shape color: my_risk_color border:#lightgray;
//			draw shape color: #white empty: true border: #gray;
			//			draw current_name at: location color: #white;
		}

	}

}

species AdministrativeBound_3 parent: AdministrativeBound {

	aspect simple {
	//		draw shape color: I>0?#red:#white border: #black;
		if (#zoom > zoom2) {
			draw shape color: my_risk_color border:#lightgray;
//			draw shape color: #white empty: true border: #gray;
			//			draw current_name at: location color: #white;
		}

	}

}