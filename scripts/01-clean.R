library(tidyverse)
library(dplyr)
library(knitr)

Apartment_evaluation <-
  read_csv("C:/Users/Yukiu/Documents/apartment further/inputs/data/Apartment_Evaluation.csv")
options(warn=-1)

cleaned <- Apartment_evaluation
cleaned <- 
  Apartment_evaluation |>
  select('_id', YEAR_BUILT, SECURITY, STAIRWELLS, GARBAGE_CHUTE_ROOMS, ELEVATORS, 
         INTERIOR_WALL_CEILING_FLOOR, INTERIOR_LIGHTING_LEVELS, GRAFFITI, 
         EXTERIOR_CLADDING, WATER_PEN_EXT_BLDG_ELEMENTS) |>
  mutate(age = 2021 - YEAR_BUILT) |>
  drop_na() |>
  filter(!GARBAGE_CHUTE_ROOMS == 'N/A') |>
  filter(!ELEVATORS == 'N/A') |>
  mutate(GARBAGE_CHUTE_ROOMS = as.numeric(GARBAGE_CHUTE_ROOMS)) |>
  mutate(ELEVATORS = as.numeric(ELEVATORS)) |>
  select('_id', SECURITY, STAIRWELLS, GARBAGE_CHUTE_ROOMS, ELEVATORS, 
         INTERIOR_WALL_CEILING_FLOOR, INTERIOR_LIGHTING_LEVELS, GRAFFITI, 
         EXTERIOR_CLADDING, WATER_PEN_EXT_BLDG_ELEMENTS, age) |>
  mutate(age = if_else(age == 0, 0.5, age))

write.csv(cleaned, "C:/Users/Yukiu/Documents/apartment further/inputs/data/cleaned data.csv")



