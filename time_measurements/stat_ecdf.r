test_frame = data.frame(a=c(1,2,3,4,5,6))
test_frame
library(ggplot2)
ggplot(test_frame, aes(x=a))+stat_ecdf(geom="step")
