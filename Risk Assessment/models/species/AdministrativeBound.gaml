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
	int F1 -> {int(20 * length(detected_cases_F0))};
	int extern;
	int foreigner;
	int moving;
	int high_contact;
	int low_contact;
	int social_distancing;
	int traffic_in;
	int emphasize;
	float risk_point -> {accessment()};
	float risk_social;
	float risk_contact;
	float risk_policy;
	string current_gid;
	string current_name;
	string current_varname;
	//	rgb mycolor -> {hsb(0, (risk_assessment_point > 25 ? 0.1 : 0) + (I > 25 ? 25 : I) / 29, 1)}; //	rgb mycolor -> {hsb(0, I/N, 1)};
	rgb my_risk_color -> {hsb(0, (risk_point > 0 ? 0.05 : 0) + ((risk_point / max_risk_point) < 0.95 ? (risk_point / max_risk_point) : 0.95), 1)}; //	rgb mycolor -> {hsb(0, I/N, 1)};
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

	float size_of_circle_1 -> {(5 #km + ((length(detected_cases_F0) / nb_increase_size_1) < 10 ? (length(detected_cases_F0) / nb_increase_size_1) #km : 10 #km))};
	float size_of_circle_2 -> {(5 #km + ((length(detected_cases_F0) / nb_increase_size_2) < 10 ? (length(detected_cases_F0) / nb_increase_size_2) #km : 10
	#km)) * ((world.shape.perimeter) / 4000000)};
	float size_of_circle_3 -> {(5 #km + ((length(detected_cases_F0) / nb_increase_size_3) < 10 ? (length(detected_cases_F0) / nb_increase_size_3) #km : 10
	#km)) * ((world.shape.perimeter) / 4000000)};
	//	map<int,float> c_size<-[5::size_of_circle_1,8::size_of_circle_2,11::size_of_circle_3];
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
			//			if (#zoom > 1.1) {
			//				draw NAME_3 at: location color: #black;
			//			}

		}

	}

}