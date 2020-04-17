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
	// xac dinh moi buoc bang 15 phut
	float step <- 15 #minute;
	float c_zoom<-1.0;
	//thoi gian khoi dau mo hinh
	date starting_date <- date([2020, 4, 17, 0, 0]);

	// thoi gian virus ton tai va gay nguy hiem o khu vuc benh nhan di qua (tinh theo gio)
	int v_time_life <- 24;
	bool do_init <- true;
	float _size<-world.shape.perimeter/10000;
//	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_1.shp");
//	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_2.shp");
	shape_file provinces_shp_file;// <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_3.shp");
	shape_file provinces_shp_file1 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_1.shp");
	shape_file provinces_shp_file2 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_2.shp");
	shape_file provinces_shp_file3 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_3.shp");
//	shape_file provinces_shp_file3 <- shape_file("../includes/gadm36_VNM_shp/generated/VNM.27.16_1.shp");

	list<int> statistic_cases_added<-[];
	geometry shape <- envelope(image_file("../images/satellite_" + GIS_id + ".png"));
//	geometry shape <- envelope(provinces_shp_file1);
	
	
	bool show_traffic<-true;
	bool show_ranking<-true;
	int nb_ranking_list <- 10;
	file a_file <- folder("../../results/");
	bool a_boolean_to_disable_parameters <- true;
	
	float weight_risk_F0<-5.0;
	float weight_risk_personality<-2.0;
	float weight_risk_society<-3.0;
	float weight_risk_intruder<-4.0;
	float weight_risk_policy<-3.0;
	
	
	
	float weight_risky_activity<-0.5;
	float weight_risky_zone<-0.5;
	float weight_risky_transport<-0.5;
	float weight_risky_policy<-0.5;
	
	float weight_risk_social<-0.35;
	float weight_risk_contact<-0.3;
//	float weight_risk_policy<-0.35;
	
	float p_F0F1<-0.35;
	float p_extern<-0.2;
	float p_foreigner<-0.3;
	float p_moving<-0.2;
	
	float p_high_contact<-0.6;
	float p_low_contact<-0.4;
	
	float p_social_distancing<-0.45;
	float p_traffic_in<-0.35;
	float p_emphasize<-0.2;
	
	
	string GIS_id0<-"VNM_1";
	string GIS_id1<-"VNM.27_1";
	string GIS_id2<-"VNM.27.16_1";
	string GIS_id3<-"VNM.25_1";
	list<string> lst_GIS_id<-[GIS_id0,GIS_id1,GIS_id2,GIS_id3];
	string GIS_id<- lst_GIS_id[0];
	map<string,string> map_GIS_name<-[GIS_id0::"Việt Nam",GIS_id1::"Hà Nội",GIS_id2::"Long Biên",GIS_id3::"Hồ Chí Minh"];
	
	 
//	float max_risk_point ->{AdministrativeBound_1 max_of each.risk_point};
	map<string,list<AdministrativeBound_1>> map_adm_1;// <- AdministrativeBound_1 group_by (each.VARNAME_1);
	map<string,list<AdministrativeBound_2>> map_adm_2;// <- AdministrativeBound_1 group_by (each.VARNAME_2);
	map<string,list<AdministrativeBound_3>> map_adm_3;// <- AdministrativeBound_1 group_by (each.VARNAME_2+" "+each.VARNAME_3);
	map<string,list<string>> quarantine_zone;
	
	geometry info_target1;
	geometry info_target2;
	geometry info_target3;
	string info_text<-"";	
	geometry zone1 <- circle(0.1#m);
	geometry zone2 <- circle(0.1#m);
	geometry zone3 <- circle(0.001#m);
	AdministrativeBound under_mouse_agent;
	
	int nb_increase_size_1<-10;
	int nb_increase_size_2<-20;
	int nb_increase_size_3<-1;
	map<int,int> map_nb_increase<-[5::nb_increase_size_1,8::nb_increase_size_1,11::nb_increase_size_1];
	
	
	float max_risk_point <-200.0;
//	float radius_circle_1<- (20 #km);
//	float radius_circle_2 -> (1#km) ;
//	float radius_circle_3 -> (0.01#m);
	
	int row_idx <- 0;
	int zoom1<-10;
	int zoom2<-30;
}