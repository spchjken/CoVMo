/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model init_demograph

import "../Constants.gaml"
import "../Parameters.gaml"
import "../species/AdministrativeBound.gaml"

global {

	action init_demograph {
		string fpath1 <- "../../data/demographie/VNM_1.csv";
		//		if (!file_exists(fpath1)) {
		ask AdministrativeBound_1 + AdministrativeBound_2 +AdministrativeBound_3{
			extern <- rnd(100);
			foreigner <- rnd(100);
			moving <- rnd(100);
			high_contact <- rnd(100.0);
			low_contact <- rnd(100);
			social_distancing <- rnd(100);
			traffic_in <- rnd(100);
			emphasize <- rnd(100);
		} 
		//			return;
		//		}
		file demo_csv_file1 <- csv_file(fpath1, true);
		matrix data <- (demo_csv_file1.contents);
		loop i from: 0 to: data.rows - 1 {
		//				write "" + data[0, i] + " " + data[1, i];
			ask map_adm_1["" + data[1, i]] {
				extern <- int(data[2, i]);
				foreigner <- int(data[3, i]);
				moving <- int(data[4, i]);
				high_contact <- float(data[5, i]);
				low_contact <- int(data[6, i]);
				social_distancing <- int(data[7, i]);
				traffic_in <- int(data[8, i]);
				emphasize <- int(data[9, i]);
			}

		}

		string fpath2 <- "../../data/demographie/VNM.27_1.csv";
		file demo_csv_file2 <- csv_file(fpath2, true);
		data <- (demo_csv_file2.contents);
		loop i from: 0 to: data.rows - 1 {
		//						write "" + data[0, i] + " " + data[1, i];
			ask map_adm_2["" + data[0, i] + " " + data[1, i]] {
				extern <- int(data[2, i]);
				foreigner <- int(data[3, i]);
				moving <- int(data[4, i]);
				high_contact <- float(data[5, i]);
				low_contact <- int(data[6, i]);
				social_distancing <- int(data[7, i]);
				traffic_in <- int(data[8, i]);
				emphasize <- int(data[9, i]);
			}

		}

		fpath2 <- "../../data/demographie/VNM.25_1.csv";
		demo_csv_file2 <- csv_file(fpath2, true);
		data <- (demo_csv_file2.contents);
		loop i from: 0 to: data.rows - 1 {
		//				write "" + data[0, i] + " " + data[1, i];
			ask map_adm_2["" + data[0, i] + " " + data[1, i]] {
				extern <- int(data[2, i]);
				foreigner <- int(data[3, i]);
				moving <- int(data[4, i]);
				high_contact <- float(data[5, i]);
				low_contact <- int(data[6, i]);
				social_distancing <- int(data[7, i]);
				traffic_in <- int(data[8, i]);
				emphasize <- int(data[9, i]);
			}

		}

		string fpath3 <- "../../data/demographie/VNM.27.16_1.csv";
		file demo_csv_file3 <- csv_file(fpath3, true);
		data <- (demo_csv_file3.contents);
		loop i from: 0 to: data.rows - 1 {
			ask map_adm_3["" + data[0, i] + " " + data[1, i]] {
				extern <- int(data[2, i]);
				foreigner <- int(data[3, i]);
				moving <- int(data[4, i]);
				high_contact <- float(data[5, i]);
				low_contact <- int(data[6, i]);
				social_distancing <- int(data[7, i]);
				traffic_in <- int(data[8, i]);
				emphasize <- int(data[9, i]);
			}

		}

	}

}