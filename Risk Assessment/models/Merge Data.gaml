/***
* Name: Corona
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
model Parameters

import "Constants.gaml"

global {
	shape_file provinces_shp_file1 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_1.shp");
	shape_file provinces_shp_file2 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_2.shp");
	shape_file provinces_shp_file3 <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM_3.shp");
//	shape_file provinces_shp_file <- shape_file("../includes/gadm36_VNM_shp/gadm36_VNM.shp");

	init {
		do generate_demograph;
	}

	action generate_demograph {
		string old_gid <- "";
		string csv <- "";
		create adm2 from: provinces_shp_file2 {
			if (old_gid = "") {
				old_gid <- GID_1;
				csv <-"";// "district,commune,extern,foreigner,moving,high_contact,low_contact,social_distancing,traffic_in,emphasize\n";
			}
			if (old_gid != GID_1) {
				save csv to: "../data/demographie/generated/" + old_gid + ".csv" type: "csv" rewrite: true;
				old_gid <- GID_1;
				csv <- "";//"district,commune,extern,foreigner,moving,high_contact,low_contact,social_distancing,traffic_in,emphasize\n";
			}

			csv <-
			csv + VARNAME_1 + "," + VARNAME_2 + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "\n";

		}


 		old_gid <- "";
		create adm3 from: provinces_shp_file3 {
			if (old_gid = "") {
				old_gid <- GID_2;
				csv <-"";// "district,commune,extern,foreigner,moving,high_contact,low_contact,social_distancing,traffic_in,emphasize\n";
			}
			if (old_gid != GID_2) {
				save csv to: "../data/demographie/generated/" + old_gid + ".csv" type: "csv" rewrite: true;
				old_gid <- GID_2;
				csv <- "";//"district,commune,extern,foreigner,moving,high_contact,low_contact,social_distancing,traffic_in,emphasize\n";
			}

			csv <-
			csv + VARNAME_2 + "," + VARNAME_3 + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "," + rnd(100) + "\n";

		}

	}

	action convertprojdata {
		create adm1 from: provinces_shp_file1{ 
			VARNAME_1 <- first(adm1 where (each.GID_1 = GID_1)).VARNAME_1;
		}
		create adm2 from: provinces_shp_file2{
			VARNAME_2 <- first(adm2 where (each.GID_2 = GID_2)).VARNAME_2;
			VARNAME_1 <- first(adm1 where (each.GID_1 = GID_1)).VARNAME_1;
		}
//		create adm3 from: provinces_shp_file3 {
//			VARNAME_2 <- first(adm2 where (each.GID_2 = GID_2)).VARNAME_2;
//			VARNAME_1 <- first(adm1 where (each.GID_1 = GID_1)).VARNAME_1;
//		}

		save adm1 to: "../includes/gadm36_VNM_shp/generated/gadm36_VNM_1.shp" type: "shp" attributes:
		["ID"::int(self), "NAME_1"::NAME_1, "GID_1"::GID_1, "NAME_2"::NAME_2, "GID_2"::GID_2, "NAME_3"::NAME_3, "GID_3"::GID_3, "VARNAME_1"::VARNAME_1, "VARNAME_2"::VARNAME_2, "VARNAME_3"::VARNAME_3];
		save adm2 to: "../includes/gadm36_VNM_shp/generated/gadm36_VNM_2.shp" type: "shp" attributes:
		["ID"::int(self), "NAME_1"::NAME_1, "GID_1"::GID_1, "NAME_2"::NAME_2, "GID_2"::GID_2, "NAME_3"::NAME_3, "GID_3"::GID_3, "VARNAME_1"::VARNAME_1, "VARNAME_2"::VARNAME_2, "VARNAME_3"::VARNAME_3];
	}

	action mergedata {
		create adm1 from: provinces_shp_file1;
		create adm2 from: provinces_shp_file2;
		create adm3 from: provinces_shp_file3 {
			VARNAME_2 <- first(adm2 where (each.GID_2 = GID_2)).VARNAME_2;
			VARNAME_1 <- first(adm1 where (each.GID_1 = GID_1)).VARNAME_1;
		}

		save adm3 to: "../includes/gadm36_VNM_shp/gadm36_VNM.shp" type: "shp" attributes:
		["ID"::int(self), "NAME_1"::NAME_1, "GID_1"::GID_1, "NAME_2"::NAME_2, "GID_2"::GID_2, "NAME_3"::NAME_3, "GID_3"::GID_3, "VARNAME_1"::VARNAME_1, "VARNAME_2"::VARNAME_2, "VARNAME_3"::VARNAME_3];
	}

}

species adm1 {
	string NAME_1;
	string NAME_2;
	string NAME_3;
	string GID_1;
	string GID_2;
	string GID_3;
	string VARNAME_1;
	string VARNAME_2;
	string VARNAME_3;
}

species adm2 {
	string NAME_1;
	string NAME_2;
	string NAME_3;
	string GID_1;
	string GID_2;
	string GID_3;
	string VARNAME_1;
	string VARNAME_2;
	string VARNAME_3;
}

species adm3 {
	string NAME_1;
	string NAME_2;
	string NAME_3;
	string GID_1;
	string GID_2;
	string GID_3;
	string VARNAME_1;
	string VARNAME_2;
	string VARNAME_3;
}

experiment "Merge data" type: gui {
//	output {
//		display "SS" {
//		}
//
//	}

}