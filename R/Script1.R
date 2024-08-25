library(tidyverse)
library(gtsummary)

ikea <-read_csv (here::here("data","ikea.csv")) %>%
  select (-...1) |>
mutate(sellable_online_cat = factor(sellable_online, labels = c ("Yes", "No")),
       other_colors_cat = factor (other_colors, labels = c("Yes","No")),
       category2 = factor (category, labels = c("Bar furniture","Beds",
                                              "Bookcases & shelving units","Cabinets & cupboards",
                                              "Cafe furniture", "Chairs", "Chests of drawers & drawer units", "Children's furniture", "Nursery furniture", "Outdoor Furniture", "Room dividers",
                                              "Sideboards, buffets & console tables", "Sofas & armchairs", "Tables & desks",
                                              "Trolleys", "TV & media furniture", "Wardrobes"))) 
  
#Table Summary 
tbl_summary(
  ikea,
  include = c(category2, price, sellable_online_cat, other_colors_cat)
)

#Linear Regression (Univariate)
tbl_uvregression(
  ikea,
  y = price,
  include = c(category2, sellable_online_cat, other_colors_cat),
  method = lm
)


            
                


