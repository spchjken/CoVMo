/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model retrieve_cases

import "../Constants.gaml"
import "../Parameters.gaml"
import "../species/AdministrativeBound.gaml"

global {

	action retrieve_cases (date d) {
		string fpath <- "../../data/VNM_1_statistic.csv";
		if (!file_exists(fpath)) {
			return;
		}

		file statistic_csv_file <- csv_file(fpath, true);
		matrix statistic_cases <- (statistic_csv_file.contents);
		loop while: ((row_idx < statistic_cases.rows) and (d.day_of_year >= date(statistic_cases[3, row_idx]).day_of_year)) {
			if (!(statistic_cases_added contains row_idx)) {
			//				string str <- "" + (statistic_cases[0, row_idx]) + " " + (statistic_cases[1, row_idx]) + " " + (statistic_cases[2, row_idx]) + " " + date(statistic_cases[3, row_idx]);
			//				write "xxxx " + row_idx + " " + str;
			//				ask (AdministrativeBound_1 where (each.GID_2 = GIS_id2 and each.VARNAME_3 = statistic_cases[2, row_idx])) {
				list<AdministrativeBound_1> adm1;
				list<AdministrativeBound_2> adm2;
				list<AdministrativeBound_3> adm3;
				if (statistic_cases[2, row_idx] = "" or statistic_cases[2, row_idx] = "cach ly") {
					adm1 <- (first(map_adm_1.values));
				} else {
					adm1 <- AdministrativeBound_1 where (each.VARNAME_1 = statistic_cases[2, row_idx]);
				}

				if (statistic_cases[4, row_idx] = "" or statistic_cases[4, row_idx] = "cach ly") {
					adm2 <- (AdministrativeBound_2 where (each.VARNAME_1 = statistic_cases[2, row_idx]));
				} else {
					adm2 <- map_adm_2["" + statistic_cases[2, row_idx] + " " + statistic_cases[4, row_idx]];
				}
				//				list D;
				ask adm1 {
				//					write VARNAME_2;
				//					infected <- true;
					I <- I + 1;
					S <- S - 1;
					create DetectedCase returns: D {
						name <- (statistic_cases[0, row_idx]);
						origin1 <- myself;
						if (length(adm2) > 0) {
							origin2 <- first(adm2);
							origin2.circle_bound <- circle(origin2.size_of_circle_2) at_location origin2.location;
						}

						detected_date <- date(statistic_cases[3, row_idx]);
					}

					circle_bound <- circle(size_of_circle_1) at_location location;
					detected_cases_F0 << first(D);
					if (length(adm2) > 0) {
						first(adm2).detected_cases_F0 << first(D);
					}

				}

				statistic_cases_added << row_idx;
			}

			row_idx <- row_idx + 1;
		}

	}

}