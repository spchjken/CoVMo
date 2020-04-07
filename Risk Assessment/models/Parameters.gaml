/***
* Name: Corona
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@no_experiment

model Parameters

import "Constants.gaml"
import "species/AdministrativeBound.gaml"
global {

//	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_1.shp");
//	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_2.shp");
	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_3.shp");

	list<int> statistic_cases_added<-[];
	geometry shape <- envelope(provinces_shp_file);
	
	
	float weight_risky_activity<-0.5;
	float weight_risky_zone<-0.5;
	float weight_risky_transport<-0.5;
	float weight_risky_policy<-0.5;
	
	float weight_risk_social<-0.35;
	float weight_risk_contact<-0.3;
	float weight_risk_policy<-0.35;
	
	float p_F0F1<-0.35;
	float p_extern<-0.2;
	float p_foreigner<-0.3;
	float p_moving<-0.2;
	
	float p_high_contact<-0.6;
	float p_low_contact<-0.4;
	
	float p_social_distancing<-0.45;
	float p_traffic_in<-0.35;
	float p_emphasize<-0.2;
	
	
	string GIS_id;
	string GIS_id0<-"VNM_1";
	string GIS_id1<-"VNM.27_1";
	string GIS_id2<-"VNM.27.16_1";
	string GIS_id3<-"VNM.25_1";
	list<string> lst_GIS_id<-[GIS_id0,GIS_id1,GIS_id2,GIS_id3];
	map<string,string> map_GIS_name<-[GIS_id0::"Việt Nam",GIS_id1::"Hà Nội",GIS_id2::"Long Biên",GIS_id3::"Hồ Chí Minh"];
	
	 
	float max_risk_point ->{AdministrativeBound max_of each.risk_point};
	map<string,list<AdministrativeBound>> map_adm_2;// <- AdministrativeBound group_by (each.VARNAME_2);
	map<string,list<AdministrativeBound>> map_adm_3;// <- AdministrativeBound group_by (each.VARNAME_2+" "+each.VARNAME_3);
	
	
	float _size<-world.shape.perimeter/10000;
}