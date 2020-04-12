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

	action init_transportation {
		string fpath <- "../../data/VNM_transportation.csv";
		if (!file_exists(fpath)) {
			return;
		}

		file trans_csv_file <- csv_file(fpath, false);
		matrix data <- (trans_csv_file.contents);
		write data;
		write map_adm_1;
		loop i from: 0 to: data.rows - 1 {
						write "" + data[0, i] + " " + data[1, i];
			ask map_adm_1["" + data[0, i]] {
				possible_transport <+ first(map_adm_1["" + data[1, i]]);
			}

			ask map_adm_1["" + data[1, i]] {
				possible_transport <+ first(map_adm_1["" + data[0, i]]);
			}

		}

	}

}