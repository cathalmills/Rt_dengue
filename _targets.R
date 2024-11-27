# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
# library(tarchetypes) # Load other packages as needed.

library(targets)
library(tarchetypes)

tar_option_set(packages = c("readr", "dplyr", "ggplot2",
                            "stats", "pracma", "data.table",
                            "tidyverse", "gridExtra", "ggpubr",
                            "scales", "RColorBrewer"),
               format = "rds")
tar_source()
#Data = fortaleza, sao jao, singapore, fortaleza, simulated

list(
  tar_target(green_pal, green_palette_setup_function()),
  tar_target(ovr_gamma_dt, R_r_relationship_exponential_diff_lambdas()),
  tar_target(top_panel_plot, process_and_plot_R_r_relationship(ovr_gamma_dt, green_pal)),
  tar_target(blue_pal, blue_palette_setup_function()),
  tar_target(mus_R_r_plot, R_r_mu_varying_plot_function(blue_pal)),
  tar_target(R_r_relationship_lambda_m_plot, R_r_lambda_m_varying_plot_function(blue_pal)),
  tar_target(R_r_analytical_plot_two_panels, plot_four_panel_figure_two(top_panel_plot,
                                        mus_R_r_plot,
                                        R_r_relationship_lambda_m_plot))
)

# tar_read(green_pal)
