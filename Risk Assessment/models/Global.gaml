/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model RiskEstimate

import "Constants.gaml"
import "Parameters.gaml"
import "species/AdministrativeBound.gaml"

global {
// xac dinh moi buoc bang 15 phut
	float step <- 15 #minute;

	//thoi gian khoi dau mo hinh
	date starting_date <- date([2020, 3, 14, 0, 0]);

	// thoi gian virus ton tai va gay nguy hiem o khu vuc benh nhan di qua (tinh theo gio)
	int v_time_life <- 24;
	bool do_init <- false;

	init {
//		write world.shape.perimeter;//1.2948119997868672E12  1.2948119997868672E12  9.619460640970342E7
		if (do_init) {
			do initialisation;
			do init_infected_cases;
			do init_demograph;
		}

	}

	int row_idx <- 0;

	action initialisation {
		create AdministrativeBound from: provinces_shp_file with: [h::10.0, N::500, I::0.0];
		ask AdministrativeBound {
		//							write NAME_2;
		//							write GID_2;
			neighbors <- (AdministrativeBound where (each touches self)) - self;
		}

		map_adm_2 <- AdministrativeBound group_by (each.VARNAME_2);
		map_adm_3 <- AdministrativeBound group_by ("" + each.VARNAME_2 + " " + each.VARNAME_3);
	}

	reflex run {
		do retrieve_cases(current_date);
	}

	action retrieve_cases (date d) {
		string fpath <- "../../data/" + GIS_id + "_statistic.csv";
		if (!file_exists(fpath)) {
			return;
		}

		file statistic_csv_file <- csv_file(fpath, true);
		matrix statistic_cases <- (statistic_csv_file.contents);
		loop while: ((row_idx < statistic_cases.rows) and (d.day_of_year >= date(statistic_cases[3, row_idx]).day_of_year)) {
			if (!(statistic_cases_added contains row_idx)) {
				string str <- "" + (statistic_cases[0, row_idx]) + " " + (statistic_cases[1, row_idx]) + " " + (statistic_cases[2, row_idx]) + " " + date(statistic_cases[3, row_idx]);
				//				write "" + row_idx + " " + str;
				//				ask (AdministrativeBound where (each.GID_2 = GIS_id2 and each.VARNAME_3 = statistic_cases[2, row_idx])) {
				ask map_adm_3["" + statistic_cases[1, row_idx] + " " + statistic_cases[2, row_idx]] {
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

	action init_infected_cases {
		string fpath <- "../../data/" + GIS_id + ".csv";
		if (!file_exists(fpath)) {
			return;
		}

		file pop_csv_file <- csv_file(fpath);
		matrix data <- matrix(pop_csv_file.contents);
		
		if (length(GIS_id) = 5) {
			loop i from: 0 to: data.rows - 1 {
				AdministrativeBound p <- first(AdministrativeBound where (each.VARNAME_1 = data[0, i]));
				ask p {
					N <- int(data[1, i]);
					I <- float(data[2, i]);
					if(I>0){						
						create DetectedCase number:I returns: D { 
							origin <- myself; 
						} 
						detected_cases_F0 <-detected_cases_F0+ D;
					}
					rgb null <- mycolor;
				}
	
			}
		
		}
		if (length(GIS_id) = 8) {
			loop i from: 0 to: data.rows - 1 {
				AdministrativeBound p <- first(AdministrativeBound where (each.VARNAME_2 = data[0, i]));
				ask p {
					N <- int(data[1, i]);
					I <- float(data[2, i]);
					if(I>0){						
						create DetectedCase number:I returns: D { 
							origin <- myself; 
						} 
						detected_cases_F0 <-detected_cases_F0+ D;
					}
					rgb null <- mycolor;
				}
	
			}
		
		}
		if (length(GIS_id) = 11) {
			loop i from: 0 to: data.rows - 1 {
				AdministrativeBound p <- first(AdministrativeBound where (each.VARNAME_3 = data[0, i]));
				ask p {
					N <- int(data[1, i]);
					I <- float(data[2, i]);
					if(I>0){						
						create DetectedCase number:I returns: D { 
							origin <- myself; 
						} 
						detected_cases_F0 <-detected_cases_F0+ D;
					}
					rgb null <- mycolor;
				}
	
			}
		
		}

	} 
	
	action init_demograph {
		string fpath <- "../../data/demographie/" + GIS_id + ".csv";
		if (!file_exists(fpath)) {
			ask AdministrativeBound {
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