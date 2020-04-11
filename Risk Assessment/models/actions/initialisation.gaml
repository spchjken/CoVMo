/***
* Name: Provinces
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
@ no_experiment model initialisation
 
import "../species/AdministrativeBound.gaml"

global {

	action initialisation {
		create AdministrativeBound_1 from: provinces_shp_file1 with: [h::10.0, N::500, I::0.0];
		create AdministrativeBound_2 from: provinces_shp_file2 with: [h::10.0, N::500, I::0.0];
		ask AdministrativeBound_1 {
		//							write NAME_2;
		//							write GID_2;
			neighbors <- (AdministrativeBound_1 where (each touches self)) - self; 
				circle_bound <- circle(size_of_circle_1) at_location location;
				current_gid <- GID_1;
				current_name <- NAME_1;
				parent_varname<-"Viet Nam";
				current_varname <- VARNAME_1; 
				
				}
		ask AdministrativeBound_2 {
		//							write NAME_2;
		//							write GID_2;
			neighbors <- (AdministrativeBound_2 where (each touches self)) - self; 
		 
				circle_bound <- circle(size_of_circle_2) at_location location;
				current_gid <- GID_2;
				current_name <- NAME_2;
				parent_varname<-VARNAME_1;
				current_varname <- VARNAME_2; 

		}

		map_adm_1 <- AdministrativeBound_1 group_by (each.VARNAME_1);
		map_adm_2 <- AdministrativeBound_2 group_by ("" + each.VARNAME_1 + " " + each.VARNAME_2);
		map_adm_3 <- AdministrativeBound_3 group_by ("" + each.VARNAME_2 + " " + each.VARNAME_3);
	}
}