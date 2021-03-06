library("reshape2")
library("ggplot2")
library("gridExtra")

# Load the comparison function
source(paste(Sys.getenv('R_SCRIPTS_PATH', '.'), 'side_comparison.r', sep='/'))

# Generates the response time graph given a path to a jmeter summary csv file
generate_response_time_graph <- function(path) {
	data = read.csv(path, header = T)
	plot = ggplot(data, aes(x=seq(1, length(bytes)), y=bytes/1024)) +
	    geom_line() +
	    xlab("Request") +
	    ylab("Response size (KB)")

	return(plot)
}

current = "../Nexus_6.csv"
upstream = "../Laptop.csv"

if(file.exists(current)){
	# If we have an upstream version, we are going to make a side comparison graph
	if(file.exists(upstream)){
		current_response_times <- generate_response_time_graph(current)
		upstream_response_times <- generate_response_time_graph(upstream)

        create_comparison(upstream_response_times, current_response_times, "api_response_sizes_comparison.png")
	} else { # If not, we will just save this graph as-is.
		current_response_times <- generate_response_time_graph(current)
		current_response_times
		ggsave(file="api_response_sizes.png", width=8, height=6, dpi=100)
	}
}
