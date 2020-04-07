/***
* Name: Corona
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
model Corona

import "../Global.gaml"

global {
	font default <- font("Helvetica", 20, #bold);
	font info <- font("Helvetica", 14, #bold);
	rgb text_color <- world.color.brighter.brighter;
	rgb background <- world.color.darker.darker;
}

experiment AbstractExp virtual: true {
	float minimum_cycle_duration<-0.01;
	parameter "Xã hội" category: "Trọng số Tổng quan" var: weight_risk_social <- 0.35;
	parameter "Tiếp xúc" category: "Trọng số Tổng quan" var: weight_risk_contact <- 0.3;
	parameter "Chính sách" category: "Trọng số Tổng quan" var: weight_risk_policy <- 0.35;
	parameter "Ca nhiễm F0, F1" category: "Trọng số của yếu tố Xã hội" var: p_F0F1 <- 0.35;
	parameter "Thành phần ngoài lề" category: "Trọng số của yếu tố Xã hội" var: p_extern <- 0.2;
	parameter "Người nước ngoài" category: "Trọng số của yếu tố Xã hội" var: p_foreigner <- 0.3;
	parameter "Người di chuyển nhiều" category: "Trọng số của yếu tố Xã hội" var: p_moving <- 0.2;
	parameter "Tiếp xúc cao" category: "Trọng số của yếu tố Tiếp xúc" var: p_high_contact <- 0.6;
	parameter "Tiếp xúc thấp" category: "Trọng số của Yếu tố Tiếp xúc" var: p_low_contact <- 0.4;
	parameter "Giãn cách xã hội" category: "Trọng số của yếu tố Chính sách" var: p_social_distancing <- 0.45;
	parameter "Hạn chế dòng vào từ địa phương khác" category: "Trọng số của yếu tố Chính sách" var: p_traffic_in <- 0.35;
	parameter "Mức độ quyết liệt trong truy tầm nguồn" category: "Trọng số của yếu tố Chính sách" var: p_emphasize <- 0.2;
	output {
		display "default_display" synchronized: false background: background virtual: true draw_env: false {
			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
			overlay position: {100, 0} size: {700 #px, 200 #px} transparency: 0 {
				draw (""+map_GIS_name[GIS_id] + " | Infected") font: default at: {20 #px, 50 #px} anchor: #top_left color: text_color;
				draw (""+current_date) font: default at: {20 #px, 80 #px} anchor: #top_left color: text_color;
			}

			species AdministrativeBound aspect: default;
			event mouse_move action: move;
			
			graphics "Info" 
			{
				if (under_mouse_agent!=nil)
				{
					string str;
					if(length(GIS_id)=5){
						 str<-under_mouse_agent.VARNAME_1;
					}
					if(length(GIS_id)=8){
						
						 str<-under_mouse_agent.VARNAME_2;
					}
					if(length(GIS_id)=11){
						
						 str<-under_mouse_agent.VARNAME_3;
					}
					str<-str+": "+length(under_mouse_agent.detected_cases_F0);
					draw str at:target empty: false font: info border: false color: #yellow;
				}

			}
		}

		display "default_display_risk" synchronized: false background: background virtual: true draw_env: false {
			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
			overlay position: {100, 0} size: {700 #px, 200 #px} transparency: 0 { 
				draw (""+map_GIS_name[GIS_id] + " | Risky") font: default at: {20 #px, 50 #px} anchor: #top_left color: text_color;
				draw (""+current_date) font: default at: {20 #px, 80 #px} anchor: #top_left color: text_color;
			}

			species AdministrativeBound aspect: risky transparency: 0.5;
		}

		//		display "Statistic" {
		//			chart 'SEIR' type: series {
		////				data "S" value: sum(AdministrativeBound collect each.S) color: #green;
		//				data "E" value: sum(AdministrativeBound collect each.E) color: #yellow;
		//				data "I" value: sum(AdministrativeBound collect each.I) color: #red;
		//				data "R" value: sum(AdministrativeBound collect each.R) color: #blue;
		//			}
		//
		//		}

	}

}