/***
* Name: EpidemiologicHost
* Author: hqngh
* Description: 
* Tags: Tag1, Tag2, TagN
***/ @ no_experiment model EpidemiologicHost

species EpidemiologicHost {
	float t;
	int N;
	float S <- N - I;
	float E <- 0.0;
	float I;
	float R <- 0.0;
	float h;
	float beta <- 0.4;
	float gamma <- 0.01;
	float sigma <- 0.05;
	float mu <- 0.01;
	rgb mycolor -> {hsb(0, (I > 25 ? 0.1 : 0) + (I > 25 ? 25 : I) / 29, 1)};
	//	rgb mycolor -> {hsb(0, I/N, 1)};
	action setSEIR (float iI) {
		write I;
		I <- iI;
		write I;
		S <- N - I;
	}

	equation eqSEIR {
		diff(S, t) = (mu * N - beta * S * I / N - mu * S) / step;
		diff(E, t) = (beta * S * I / N - mu * E - sigma * E) / step;
		diff(I, t) = (sigma * E - mu * I - gamma * I) / step;
		diff(R, t) = (gamma * I - mu * R) / step;
	}

	bool infected <- false;

	reflex solving when: infected {
		solve eqSEIR method: "rk4" step_size: h;
	}


}