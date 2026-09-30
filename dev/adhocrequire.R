getwd()
setwd("dev")

# Load the brave package
library(brave)

# Execute the adhoc installation
brave::adhocRequire("sasquatch",   ref="pinned") 
brave::adhocRequire("SASmarkdown", ref="pinned") 

# back to root folder
setwd("..")
