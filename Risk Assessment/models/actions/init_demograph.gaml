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
		string fpath <- "../../data/demographie/" + GIS_id + ".csv";
		if (!file_exists(fpath)) {
			ask AdministrativeBound_1 {
				extern <- rnd(100);
				foreigner <- rnd(100);
				moving <- rnd(100);
				high_contact <- rnd(100);
				low_contact <- rnd(100);
				social_distancing <- rnd(100);
				traffic_in <- rnd(100);
				emphasize <- rnd(100);
			}

			return;
		}

		file demo_csv_file <- csv_file(fpath, true);
		matrix data <- (demo_csv_file.contents);
		//		write GIS_id;
		if (length(GIS_id) = 5) {
		//			write data;
			loop i from: 0 to: data.rows - 1 {
			//				write "" + data[0, i] + " " + data[1, i];
				ask map_adm_1["" + data[1, i]] {
					extern <- int(data[2, i]);
					foreigner <- int(data[3, i]);
					moving <- int(data[4, i]);
					high_contact <- int(data[5, i]);
					low_contact <- int(data[6, i]);
					social_distancing <- int(data[7, i]);
					traffic_in <- int(data[8, i]);
					emphasize <- int(data[9, i]);
				}

			}

		}

		if (length(GIS_id) = 8) {
		//			write data;
			loop i from: 0 to: data.rows - 1 {
			//				write "" + data[0, i] + " " + data[1, i];
				ask map_adm_2["" + data[1, i]] {
					extern <- int(data[2, i]);
					foreigner <- int(data[3, i]);
					moving <- int(data[4, i]);
					high_contact <- int(data[5, i]);
					low_contact <- int(data[6, i]);
					social_distancing <- int(data[7, i]);
					traffic_in <- int(data[8, i]);
					emphasize <- int(data[9, i]);
				}

			}

		}

		if (length(GIS_id) = 11) {
			loop i from: 0 to: data.rows - 1 {
			//				write "" + data[0, i] + " " + data[1, i];
				ask map_adm_3["" + data[0, i] + " " + data[1, i]] {
					extern <- int(data[2, i]);
					foreigner <- int(data[3, i]);
					moving <- int(data[4, i]);
					high_contact <- int(data[5, i]);
					low_contact <- int(data[6, i]);
					social_distancing <- int(data[7, i]);
					traffic_in <- int(data[8, i]);
					emphasize <- int(data[9, i]);
				}

			}

		}

	}

}