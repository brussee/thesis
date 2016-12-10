library("reshape2")
library("ggplot2")
library("gridExtra")

# Load the comparison function
source(paste(Sys.getenv('R_SCRIPTS_PATH', '.'), 'side_comparison.r', sep='/'))

# Generates the response time graph given a path to a jmeter summary csv file
generate_response_time_graph <- function(path) {
	data = read.csv(path, header = T)
	plot = ggplot(data, aes(x=seq(1, length(Latency)), y=Latency)) +
	    geom_line() +
	    xlab("Request") +
	    geom_line(data=data, aes(x=seq(1, length(bytes)), y=bytes/1024*.25), color="#FF0000") +
	    scale_y_continuous("Response time (ms)", sec.axis=sec_axis(~./.25, name="Response size (KB)"))

	return(plot)
}

current = "../Laptop-2.csv"
upstream = "../Laptop_.csv"

if(file.exists(current)){
	# If we have an upstream version, we are going to make a side comparison graph
	if(file.exists(upstream)){
		current_response_times <- generate_response_time_graph(current)
		upstream_response_times <- generate_response_time_graph(upstream)

        create_comparison(upstream_response_times, current_response_times, "api_combined_comparison.png")
	} else { # If not, we will just save this graph as-is.
		current_response_times <- generate_response_time_graph(current)
		current_response_times
		ggsave(file="api_combined.png", width=8, height=6, dpi=100)
	}
}
