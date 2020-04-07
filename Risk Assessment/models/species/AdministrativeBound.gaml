/***
* Name: AdministrativeBound
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment 
model AdministrativeBound

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
	int F1->{int(30*length(detected_cases_F0))};
	int extern;
	int foreigner;
	int moving;
	int high_contact;
	int low_contact;
	int social_distancing;
	int traffic_in;
	int emphasize;
	
	
	float risk_point->{accessment()};
	float risk_social;
	float risk_contact;
	float risk_policy;
//	rgb mycolor -> {hsb(0, (risk_assessment_point > 25 ? 0.1 : 0) + (I > 25 ? 25 : I) / 29, 1)}; //	rgb mycolor -> {hsb(0, I/N, 1)};
	rgb my_risk_color -> {hsb(0, risk_point / max_risk_point, 1)}; //	rgb mycolor -> {hsb(0, I/N, 1)};
	
	float accessment {
		return weight_risk_social * get_risk_social() + weight_risk_contact * get_risk_contact() + weight_risk_policy* get_risk_policy();
	}
	float get_risk_social{
		return  p_F0F1 * (length(detected_cases_F0)+F1) + p_extern * (extern) +p_foreigner * (foreigner) + p_moving * (moving);
	}

	float get_risk_contact{
		return  p_high_contact * high_contact + p_low_contact * low_contact;
	}

	float get_risk_policy{
		return  p_social_distancing * social_distancing + p_traffic_in * traffic_in + p_emphasize* emphasize;
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
		draw shape color: #white empty: true border: #black;
		if (length(detected_cases_F0) > 0) {
			draw circle(length(detected_cases_F0) #km /10 ) color: #red;
//			if (#zoom > 1.1) {
//				draw NAME_3 at: location color: #black;
//			}

		}

	}
}