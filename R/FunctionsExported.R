#' Simulate IRT data
#'
#' Works for 2PLM and GRM
#'
#' @param theta vector
#' @param b vector or matrix (if matrix GRM is used)
#' @param a vector (of equal size with \code{length(b)})
#'
#' @return children of class Simulator (to be added...)
#'
#' @export
simulateirt = function(theta, b, a) {
	if(is.matrix(b)) {
		return(SimulatorGRM$new(theta, b, a))
	} else {
		return(Simulator2PLM$new(theta, b, a))
	}
}



#' Estimate IRT model based on data
#'
#' Works for 2PLM and GRM - decide the dependency: ltm or mirt?
#'
#' @param data matrix
#' @param theta.method character
#'
#' @return children of class Estimator (to be added...)
#'
#' @export
estimateirt = function(data, theta.method = "WLE") {
	
	if(max(data) > 1) {
		return(EstimatorGRM$new(data, theta.method))
	} else {
		return(Estimator2PLM$new(data, theta.method))
	}
}



#' Compute RCI 
#'
#' Roxygen2 is awesome.
#'
#' @param theta_pre matrix: first column thetas, second column se
#' @param theta_post matrix: first column thetas, second column se
#' @param method character: the test used; defaults to Wald test
#'
#' @return children of class ChangeAssessment (to be added...)
#'
#' @export
changeirt = function(theta.t1, theta.t2, method = "wald") {
	return(ChangeAssessment$wald(theta.t1, theta.t2))
}



#' Compute Person-Fit statistics
#'
#' to be added... decide: dependecy or implementation
#'
#' @return matrix: first column test value, second column p value
#'
#' @export
personfit = function() {
	
}


