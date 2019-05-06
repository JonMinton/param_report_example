# Simple script

# This doc will present a very simple example of 20 places, each with two values.
# A separate report will be made for each of these places 

require(knitr)
require(tidyverse)


# Create the data  
# only do this once

# #make reproducible
# set.seed(20)
# 
# # create the dataframe
# data_to_report <- tibble(
#   label = LETTERS[1:20],
#   xvar = runif(20),
#   yvar = runif(20)
# )
# 
# # write the dataframe
# data_to_report %>% 
#   write_csv(path = "input_data/input.csv")
# 
# 


data <- read_csv("input_data/input.csv")

labels <- data$label


# Here's some insightful comment


render_report <- function(label){
  rmarkdown::render("report_template.Rmd",
                    output_file = paste0("markdown_reports/", label, ".html"),
                    params = list(place_name = label)
                    )
  
}

purrr::walk(labels, render_report)

