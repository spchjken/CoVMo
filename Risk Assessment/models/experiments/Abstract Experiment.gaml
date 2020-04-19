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
	font info <- font("Helvetica", 18, #bold);
	rgb text_color <- world.color.brighter.brighter;
	rgb background <- world.color.darker.darker;
}

experiment AbstractExp virtual: true {
	float minimum_cycle_duration <- 0.025;
	parameter "Mức độ nghiêm trọng" category: "Chỉ số nguy cơ lây nhiễm" var: weight_risk_F0 <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Nguy cơ cá nhân" category: "Chỉ số nguy cơ lây nhiễm" var: weight_risk_personality <- 1.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Nguy cơ môi trường xã hội" category: "Chỉ số nguy cơ lây nhiễm" var: weight_risk_society <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Xâm nhập" category: "Chỉ số nguy cơ lây nhiễm" var: weight_risk_intruder <- 4.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Sức khỏe và bệnh lý" category: "Chỉ số nguy cơ đáp ứng" var: weight_risk_pathology <- 3.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Năng lực ứng phó" category: "Chỉ số nguy cơ đáp ứng" var: weight_risk_policy <- 3.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};

	//////ssss//////
	///////////////
	parameter "Chỉ số mức độ nghiệm trọng" category: "Khối chỉ số nguy cơ lây nhiễm" var: weight_Chi_so_muc_do_nghiem_trong <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số nguy cơ xâm nhập" category: "Khối chỉ số nguy cơ lây nhiễm" var: weight_Chi_so_nguy_co_xam_nhap <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Lưu trú (Việt Nam & Nước Ngoài)" category: "Chỉ số nguy cơ xâm nhập" var: weight_Luu_tru <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Biên giới Tây Nam/B/Cửa Khẩu" category: "Chỉ số nguy cơ xâm nhập" var: weight_Bien_gioi <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
			
		}

	};
	parameter "Sự kiện đông người" category: "Chỉ số nguy cơ xâm nhập" var: weight_Su_kien_dong_nguoi <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Di cư liên tỉnh" category: "Chỉ số nguy cơ xâm nhập" var: weight_Di_cu_lien_tinh <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số nguy cơ cá nhân" category: "Khối chỉ số nguy cơ lây nhiễm" var: weight_Chi_so_nguy_co_ca_nhan <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Tính chất việc làm" category: "Chỉ số nguy cơ cá nhân" var: weight_Tinh_chat_viec_lam <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Di chuyển nhiều" category: "Tính chất việc làm" var: weight_Di_chuyen_nhieu <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Tiếp xúc nhiều" category: "Tính chất việc làm" var: weight_Tiep_xuc_nhieu <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số nguy cơ môi trường-xã hội" category: "Khối chỉ số chính sách can thiệp" var: weight_Chi_so_nguy_co_moi_truong_xa_hoi <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Mật độ dân số" category: "Chỉ số nguy cơ môi trường-xã hội" var: weight_Mat_do_dan_so <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Thành thị" category: "Chỉ số nguy cơ môi trường-xã hội" var: weight_Thanh_thi <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "TP trực thuộc TW" category: "Thành thị" var: weight_TP_truc_thuoc_TW <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Đô thị khác" category: "Thành thị" var: weight_Do_thi_khac <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Nông thôn" category: "Chỉ số nguy cơ môi trường-xã hội" var: weight_Nong_thon <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Hoạt động kinh tế/ khu công nghiệp" category: "Chỉ số nguy cơ môi trường-xã hội" var: weight_Hoat_dong_kinh_te <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Ký túc xá" category: "Chỉ số nguy cơ môi trường-xã hội" var: weight_Ky_tuc_xa <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số nguy cơ sức khoẻ và bệnh lý nền" category: "Khối chỉ số nguy cơ đáp ứng" var: weight_Chi_so_nguy_co_suc_khoe_va_benh_ly_nen <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Bệnh nền mãn tính" category: "Chỉ số nguy cơ sức khoẻ và bệnh lý nền" var: weight_Benh_nen_man_tinh <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Dân số 60+" category: "Chỉ số nguy cơ sức khoẻ và bệnh lý nền" var: weight_Dan_so_gia <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số năng lực ứng phó Covid" category: "Khối chỉ số nguy cơ đáp ứng" var: weight_Chi_so_nang_luc_ung_pho_Covid <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số nhân viên ý tế và bác sỹ/ dân số" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_nhan_vien_y_te_va_bac_sy_dan_so <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số giường bệnh/ dân số" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_giuong_benh <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số máy thở" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_may_tho <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số cơ sở y tế" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_co_so_y_te <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số ICU" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_ICU <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Bệnh viện TW" category: "Chỉ số năng lực ứng phó Covid" var: weight_Benh_vien_TW <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Khám từ xa" category: "Chỉ số năng lực ứng phó Covid" var: weight_Kham_tu_xa <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Số máy PCR: 30" category: "Chỉ số năng lực ứng phó Covid" var: weight_So_may_PCR <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Tỷ lệ BN/người dân nghi ngờ được xét nghiệm PCR" category: "Chỉ số năng lực ứng phó Covid" var: weight_Ty_le_BN_nguoi_dan_nghi_ngo_duoc_xet_nghiem_PCR <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số giám sát, phát hiện, truy vết" category: "Chỉ số nguy cơ lây nhiễm" var: weight_Chi_so_giam_sat_phat_hien_truy_vet <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số nguy cơ từ đường biên giới" category: "Chỉ số nguy cơ lây nhiễm" var: weight_Chi_so_nguy_co_tu_duong_bien_gioi <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Liên quan đến Trung Quốc" category: "Chỉ số nguy cơ từ đường biên giới" var: weight_Lien_quan_den_Trung_Quoc <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Liên quan đến Lào" category: "Chỉ số nguy cơ từ đường biên giới" var: weight_lien_quan_den_Lao <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Liên quan đến Campuchia" category: "Chỉ số nguy cơ từ đường biên giới" var: weight_lien_quan_den_Campuchia <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số đáp ứng chính quyền" category: "Khối chỉ số sách can thiệp" var: weight_Chi_so_dap_ung_chinh_quyen <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Tốt" category: "Chỉ số đáp ứng chính quyền" var: weight_Tot <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Trung bình" category: "Chỉ số đáp ứng chính quyền" var: weight_Trung_binh <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Yếu" category: "Chỉ số đáp ứng chính quyền" var: weight_Yeu <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số đóng mở trường hợp" category: "Khối chỉ số sách can thiệp" var: weight_Chi_so_dong_mo_truong_hop <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Đóng" category: "Chỉ số đóng mở trường hợp" var: weight_dong <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Mở" category: "Chỉ số đóng mở trường hợp" var: weight_mo <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Chỉ số hỗ trợ" category: "Khối chỉ số chính sách can thiệp" var: weight_Chi_so_ho_tro <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Hỗ trợ người già" category: "Chỉ số hỗ trợ" var: weight_Ho_tro_nguoi_gia <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};
	parameter "Hỗ trợ người có triệu chứng" category: "Chỉ số hỗ trợ" var: weight_Ho_tro_nguoi_co_trieu_chung <- 5.0 min: 0.0 max: 10.0 on_change: {
		ask world {
			do trigger_color;
		}

	};

	//	parameter "Xã hội" category: "Trọng số Tổng quan" var: weight_risk_social <- 0.35 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Tiếp xúc" category: "Trọng số Tổng quan" var: weight_risk_contact <- 0.3 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Chính sách" category: "Trọng số Tổng quan" var: weight_risk_policy <- 0.35 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Ca nhiễm F0, F1" category: "Trọng số của yếu tố Xã hội" var: p_F0F1 <- 0.35 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Thành phần ngoài lề" category: "Trọng số của yếu tố Xã hội" var: p_extern <- 0.2 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Người nước ngoài" category: "Trọng số của yếu tố Xã hội" var: p_foreigner <- 0.3 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Người di chuyển nhiều" category: "Trọng số của yếu tố Xã hội" var: p_moving <- 0.2 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Tiếp xúc cao" category: "Trọng số của Yếu tố Tiếp xúc" var: p_high_contact <- 0.6 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Tiếp xúc thấp" category: "Trọng số của Yếu tố Tiếp xúc" var: p_low_contact <- 0.4 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Giãn cách xã hội" category: "Trọng số của yếu tố Chính sách" var: p_social_distancing <- 0.45 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Hạn chế dòng vào từ địa phương khác" category: "Trọng số của yếu tố Chính sách" var: p_traffic_in <- 0.35 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	//	parameter "Mức độ quyết liệt trong truy tầm nguồn" category: "Trọng số của yếu tố Chính sách" var: p_emphasize <- 0.2 on_change: {
	//		ask world {
	//			do trigger_color;
	//		}
	//
	//	};
	parameter "Thư mục lưu kết quả" category: "Hiển thị" var: a_file;
	user_command "Xuất kết quả" category: "Hiển thị" color: #darkblue {
		ask world {
			do writing_results;
		}

	}
	//	parameter "Disable following parameters" category: "Hiển thị" var: a_boolean_to_disable_parameters disables: [a_file];
	parameter "Xem lưu lượng giao thông" category: "Hiển thị" var: show_traffic <- false;
	parameter "Xem xếp hạng" category: "Hiển thị" var: show_ranking <- true;
	parameter "Số lượng hiển thị xếp hạng" category: "Hiển thị" var: nb_ranking_list <- 5 min: 1 max: 30;
	//	parameter "Mức tăng cấp quốc gia" category: "Hiển thị" var: nb_increase_size_1 <- 10;
	//	parameter "Mức tăng cấp thành phố" category: "Hiển thị" var: nb_increase_size_2 <- 5;
	//	parameter "Mức tăng cấp quận" category: "Hiển thị" var: nb_increase_size_3 <- 1;
	output {
		display "default_mixed_wander_display" synchronized: false background: background virtual: true draw_env: false {
			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
			overlay position: {100, 0} size: {270 #px, 420 #px} transparency: 0.8 {
				if (show_ranking) {
					draw ("" + map_GIS_name[GIS_id] + " | Ca nhiễm:" + (length(DetectedCase))) font: default at: {20 #px, 50 #px} anchor: #top_left color: text_color;
					draw ("" + current_date) font: info at: {20 #px, 80 #px} anchor: #top_left color: text_color;
					draw ("Xếp hạng nguy cơ:") font: default at: {20 #px, 110 #px} anchor: #top_left color: text_color;
					int y <- 130;
					list<AdministrativeBound_1> candi <- AdministrativeBound_1 sort_by (-each.risk_point);
					loop i from: 0 to: nb_ranking_list - 1 {
						y <- y + 25;
						draw (((i + 1) < 10 ? "0" : "") + (i + 1) + " . " + candi[i].current_name) font: info at: {20 #px, y #px} anchor: #top_left color: candi[i].my_risk_color.brighter;
					}

				}

			}

			species AdministrativeBound_1 aspect: simple position: {0, 0, 0.001};
			species AdministrativeBound_2 aspect: simple position: {0, 0, 0.002};
			species AdministrativeBound_3 aspect: simple position: {0, 0, 0.003};
			species People position: {0, 0, 0.004};
			species DetectedCase position: {0, 0, 0.005};
			event mouse_move action: when_mouse_move;
			graphics "Info" position: {0, 0, 0.006} {
				if (c_zoom != #zoom) {
					c_zoom <- #zoom;
					ask world {
						do change_zoom_all;
					}

				}

				if (#zoom >= 1.5) {
					if (under_mouse_agent != nil) {
						draw info_text at: #user_location empty: false perspective: false font: info color: #black;
					}

				}

			}

		}

		display "default_mixed_display" synchronized: false background: background virtual: true draw_env: false {
		//			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
		//			overlay position: {100, 0} size: {270 #px, 400 #px} transparency: 0.2 {
		//				draw ("" + map_GIS_name[GIS_id] + " | Ca nhiễm:" + (AdministrativeBound_1 sum_of length(each.detected_cases_F0))) font: default at: {20 #px, 50 #px} anchor: #top_left color:
		//				text_color;
		//				draw ("" + current_date) font: info at: {20 #px, 80 #px} anchor: #top_left color: text_color;
		//				draw ("Xếp hạng nguy cơ:") font: default at: {20 #px, 110 #px} anchor: #top_left color: text_color;
		//				if (show_ranking) {
		//					int y <- 130;
		//					list<AdministrativeBound_1> candi <- AdministrativeBound_1 sort_by (-each.risk_point);
		//					loop i from: 0 to: nb_ranking_list - 1 {
		//						y <- y + 25;
		//						draw (((i + 1) < 10 ? "0" : "") + (i + 1) + " . " + candi[i].current_name) font: info at: {20 #px, y #px} anchor: #top_left color: candi[i].my_risk_color.brighter;
		//					}
		//
		//				}
		//
		//			}
		//
		//			species AdministrativeBound_1 aspect: mixed; // transparency: 0.5 ;
		//			event mouse_move action: when_mouse_move;
		//			graphics "Info" transparency: 0.2 {
		//				if (under_mouse_agent != nil) {
		//					draw info_text at: {info_target.x - (length(info_text) * 20), info_target.y} empty: false font: info border: true color: #yellow;
		//				}
		//
		//			}

		}

		display "default_display" synchronized: false background: background virtual: true draw_env: false {
		//			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
		//			overlay position: {100, 0} size: {700 #px, 200 #px} transparency: 0 {
		//				draw ("" + map_GIS_name[GIS_id] + " | Ca nhiễm:" + (AdministrativeBound_1 sum_of length(each.detected_cases_F0))) font: default at: {20 #px, 50 #px} anchor: #top_left color:
		//				text_color;
		//				draw ("" + current_date) font: default at: {20 #px, 80 #px} anchor: #top_left color: text_color;
		//			}
		//
		//			species AdministrativeBound_1 aspect: default;
		//			event mouse_move action: when_mouse_move;
		//			graphics "Info" {
		//				if (under_mouse_agent != nil) {
		//					string str <- under_mouse_agent.current_name;
		//					str <- str + ": " + length(under_mouse_agent.detected_cases_F0);
		//					draw str at: {info_target.x - (length(str) * 20), info_target.y} empty: false font: info border: true color: #yellow;
		//				}
		//
		//			}

		}

		display "default_display_risk" synchronized: false background: background virtual: true draw_env: false {
		//			image file: "../images/satellite_" + GIS_id + ".png" refresh: false;
		//			species AdministrativeBound_1 aspect: risky position: {0, 0, 0.002}; //transparency: 0.5;
		//			event mouse_move action: when_mouse_move;
		//			overlay position: {100, 0} size: {700 #px, 200 #px} transparency: 0 {
		//				draw ("" + map_GIS_name[GIS_id] + " | Nguy cơ") font: default at: {20 #px, 50 #px} anchor: #top_left color: text_color;
		//				draw ("" + current_date) font: default at: {20 #px, 80 #px} anchor: #top_left color: text_color;
		//				if (show_ranking) {
		//					int y <- 100;
		//					list<AdministrativeBound_1> candi <- AdministrativeBound_1 sort_by (-each.risk_point);
		//					loop i from: 0 to: nb_ranking_list - 1 {
		//						y <- y + 20;
		//						draw ("" + candi[i].current_name + " " + int(candi[i].risk_point)) font: info at: {20 #px, y #px} anchor: #top_left color: text_color;
		//					}
		//
		//				}
		//
		//			}
		//
		//			graphics "Info" position: {0, 0, 0.002} {
		//				if (under_mouse_agent != nil) {
		//					string str <- under_mouse_agent.current_name;
		//					str <- str + ": " + int(under_mouse_agent.risk_point);
		//					draw str at: {info_target.x - (length(str) * 20), info_target.y} empty: false font: info border: false color: #yellow;
		//				}
		//
		//			}

		}

		//		display "Statistic" {
		//			chart 'SEIR' type: series {
		////				data "S" value: sum(AdministrativeBound_1 collect each.S) color: #green;
		//				data "E" value: sum(AdministrativeBound_1 collect each.E) color: #yellow;
		//				data "I" value: sum(AdministrativeBound_1 collect each.I) color: #red;
		//				data "R" value: sum(AdministrativeBound_1 collect each.R) color: #blue;
		//			}
		//
		//		}

	}

}