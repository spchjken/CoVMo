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
		if (length(GIS_id) = 5) {
			loop while: ((row_idx < statistic_cases.rows) and (d.day_of_year >= date(statistic_cases[3, row_idx]).day_of_year)) {
				if (!(statistic_cases_added contains row_idx)) {
					string str <- "" + (statistic_cases[0, row_idx]) + " " + (statistic_cases[1, row_idx]) + " " + (statistic_cases[2, row_idx]) + " " + date(statistic_cases[3, row_idx]);
					write "xxxx " + row_idx + " " + str;
					//				ask (AdministrativeBound_1 where (each.GID_2 = GIS_id2 and each.VARNAME_3 = statistic_cases[2, row_idx])) {
					list<AdministrativeBound> adm;
					if (statistic_cases[2, row_idx] = "" or statistic_cases[2, row_idx] = "Cach y") {
						adm <- (first(map_adm_2.values));
					} else {
						adm <- AdministrativeBound_1 where (each.VARNAME_1 = statistic_cases[2, row_idx]);
					}

					ask adm {
					//					write VARNAME_2;
					//					infected <- true;
						I <- I + 1;
						S <- S - 1;
						create DetectedCase returns: D {
							name <- (statistic_cases[0, row_idx]);
							origin <- myself;
							detected_date <- date(statistic_cases[3, row_idx]);
							location <- any_location_in(origin.circle_bound);
						}

						circle_bound <- circle(size_of_circle_1) at_location location;
						detected_cases_F0 << first(D);
					}

					statistic_cases_added << row_idx;
				}

				row_idx <- row_idx + 1;
			}

		}

		if (length(GIS_id) = 8) {
			loop while: ((row_idx < statistic_cases.rows) and (d.day_of_year >= date(statistic_cases[3, row_idx]).day_of_year)) {
				if (!(statistic_cases_added contains row_idx)) {
					string str <- "" + (statistic_cases[0, row_idx]) + " " + (statistic_cases[1, row_idx]) + " " + (statistic_cases[2, row_idx]) + " " + date(statistic_cases[3, row_idx]);
					write "xxxx " + row_idx + " " + str;
					//				ask (AdministrativeBound_1 where (each.GID_2 = GIS_id2 and each.VARNAME_3 = statistic_cases[2, row_idx])) {
					list<AdministrativeBound> adm;
					if (statistic_cases[2, row_idx] = "" or statistic_cases[2, row_idx] = "Cach y") {
						adm <- (first(map_adm_2.values));
					} else {
						adm <- map_adm_2["" + statistic_cases[2, row_idx]];
					}

					ask adm {
					//					write VARNAME_2;
					//					infected <- true;
						I <- I + 1;
						S <- S - 1;
						create DetectedCase returns: D {
							name <- (statistic_cases[0, row_idx]);
							origin <- myself;
							detected_date <- date(statistic_cases[3, row_idx]);
						}

						detected_cases_F0 << first(D);
					}

					statistic_cases_added << row_idx;
				}

				row_idx <- row_idx + 1;
			}

		}

		if (length(GIS_id) = 11) {
			loop while: ((row_idx < statistic_cases.rows) and (d.day_of_year >= date(statistic_cases[3, row_idx]).day_of_year)) {
				if (!(statistic_cases_added contains row_idx)) {
					string str <- "" + (statistic_cases[0, row_idx]) + " " + (statistic_cases[1, row_idx]) + " " + (statistic_cases[2, row_idx]) + " " + date(statistic_cases[3, row_idx]);
					//				write "" + row_idx + " " + str;
					//				ask (AdministrativeBound_1 where (each.GID_2 = GIS_id2 and each.VARNAME_3 = statistic_cases[2, row_idx])) {
					ask map_adm_3["" + statistic_cases[1, row_idx] + " " + statistic_cases[2, row_idx]] {
					//					write VARNAME_2;
					//					infected <- true;
						I <- I + 1;
						S <- S - 1;
						create DetectedCase returns: D {
							location <- any_location_in(origin);
							name <- (statistic_cases[0, row_idx]);
							origin <- myself;
							detected_date <- date(statistic_cases[3, row_idx]);
						}

						detected_cases_F0 << first(D);
					}

					statistic_cases_added << row_idx;
				}

				row_idx <- row_idx + 1;
			}

		}

	}

}