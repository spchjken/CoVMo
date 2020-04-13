/***
* Name: Corona
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/
model Corona

import "Abstract Experiment.gaml"
experiment Pandemic2020 type: gui parent: AbstractExp autorun: true {

	action init {
		gama.pref_display_visible_agents <- true;
	} 
	output {
		layout #split consoles: false editors: false navigator: false tray: false tabs: false toolbars: true;
		display "Mixed" parent: default_mixed_wander_display synchronized: false type: opengl {
		} 
	}

}