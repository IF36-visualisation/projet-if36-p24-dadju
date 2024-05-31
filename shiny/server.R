#
# Server application shiny
# title: "Exploration cinématographique"
# author: "Eloïse LAPLANCHE, Laure PENG, Gaudeline Maeva SIMO KAMWA, Belvine YEMDJO YOUMBI"
#

library(shiny)
library(shinydashboard)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tibble)
library(lubridate)
library(readr)
library(forcats)
library(prettydoc)
library(stringr)
library(plotly)


data <- read_csv("../data/movies.csv")


function(input, output) {
  
  # Fonction générale pour ne sélectionner que les données dans l'intervalle de date choisi par l'utilisateur
  # Les revenus et les budgets mis à 0 dans le dataset sont considérés comme des valeurs manquantes
  filter_data_by_year_range <- function(year_range) {
    filtered_data <- subset(
      data,
      format(release_date, "%Y") >= year_range[1] &
        format(release_date, "%Y") <= year_range[2]
    )
    filtered_data$revenue <- ifelse(filtered_data$revenue == 0, NA, filtered_data$revenue)
    filtered_data$budget <- ifelse(filtered_data$budget == 0, NA, filtered_data$budget)
    return(filtered_data)
  }
  
  
  
  # Nombre de films selon la date sélectionnée
  output$nbFilms <- renderValueBox({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    valueBox(
      paste(nrow(filtered_data)),
      "Nombre de films dans l'intervalle",
      icon = icon("film"),
      color = "light-blue"
    )
  })
  
  
  # Moyenne des revenus selon la date sélectionnée
  output$mean_revenue <- renderInfoBox({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    mean_revenue <- mean(filtered_data$revenue, na.rm = TRUE)
    formatted_mean_revenue <-
      format(mean_revenue, big.mark = " ", scientific = FALSE)
    infoBox(
      "Revenus moyens ($)",
      paste(formatted_mean_revenue),
      icon = icon("sack-dollar"),
      color = "green"
    )
  })
  
  # Médiane des revenus selon la date sélectionnée
  output$median_revenue <- renderInfoBox({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    median_revenue <- median(filtered_data$revenue, na.rm = TRUE)
    formatted_median_revenue <-
      format(median_revenue,
             big.mark = " ",
             scientific = FALSE)
    infoBox(
      "Revenus médians ($)",
      paste(formatted_median_revenue),
      icon = icon("sack-dollar"),
      color = "green"
    )
  })
  
  # Moyenne du budget selon la date sélectionnée
  output$mean_budget <- renderInfoBox({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    mean_budget <- mean(filtered_data$budget, na.rm = TRUE)
    formatted_mean_budget <-
      format(mean_budget, big.mark = " ", scientific = FALSE)
    infoBox(
      "Budget moyen ($)",
      paste(formatted_mean_budget),
      icon = icon("file-invoice-dollar"),
      color = "red"
    )
  })
  
  # Médiane du budget selon la date sélectionnée
  output$median_budget <- renderInfoBox({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    median_budget <- median(filtered_data$budget, na.rm = TRUE)
    formatted_median_budget <-
      format(median_budget,
             big.mark = " ",
             scientific = FALSE)
    infoBox(
      "Budget médian ($)",
      paste(formatted_median_budget),
      icon = icon("file-invoice-dollar"),
      color = "red"
    )
  })
  
  # Boîte à moustache revenus selon la date sélectionnée
  output$boxplotRevenue <- renderPlotly({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    plot_ly(
      data = filtered_data,
      x = "",
      y = filtered_data$revenue,
      type = "box",
      name = "Revenus",
      marker = list(color = 'skyblue'),
      hoverinfo = "y",
      boxmean = TRUE
    ) %>%
      layout(title = "Distribution des revenus",
             yaxis = list(title = "Revenus ($)"))
  })
  
  # Boîte à moustache budget selon la date sélectionnée
  output$boxplotBudget <- renderPlotly({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    plot_ly(
      data = filtered_data,
      x = "",
      y = filtered_data$budget,
      type = "box",
      marker = list(color = "lightblue"),
      name = "Budget",
      hoverinfo = "y",
      boxmean = TRUE
    ) %>%
      layout(title = "Distribution du budget",
             yaxis = list(title = "Budget ($)"))
  })
  
  # Graphique évolution budget et revenus
  output$evolutionPlot <- renderPlotly({
    filtered_data <- filter_data_by_year_range(input$yearRange)
    filtered_data$year <-
      format(as.Date(filtered_data$release_date), "%Y")
    filtered_data$benefices <- ifelse(filtered_data$revenue == 0 | filtered_data$budget == 0, NA, filtered_data$revenue - filtered_data$budget)
    filtered_data$revenue <- ifelse(filtered_data$revenue == 0, NA, filtered_data$revenue)
    filtered_data$budget <- ifelse(filtered_data$budget == 0, NA, filtered_data$budget)
    
    if (input$aggregation == "mean") {
      modified_data <- filtered_data %>%
        group_by(year) %>%
        summarise(
          modified_budget = mean(budget, na.rm = TRUE),
          modified_revenue = mean(revenue, na.rm = TRUE),
          modified_benefices = mean(benefices, na.rm = TRUE)
        )
    } else {
      modified_data <- filtered_data %>%
        group_by(year) %>%
        summarise(
          modified_budget = median(budget, na.rm = TRUE),
          modified_revenue = median(revenue, na.rm = TRUE),
          modified_benefices = median(benefices, na.rm = TRUE)
        )
    }
    
    
    plot_ly() %>%
      add_lines(
        x = ~ modified_data$year,
        y = ~ modified_data$modified_budget,
        name = 'Budget',
        line = list(color = 'red')
      ) %>%
      add_lines(
        x = ~ modified_data$year,
        y = ~ modified_data$modified_revenue,
        name = 'Revenu',
        line = list(color = 'blue')
      ) %>%
      add_lines(
        x = ~ modified_data$year,
        y = ~ modified_data$modified_benefices,
        name = 'Bénéfices',
        line = list(color = 'green')
      ) %>%
      layout(
        title = "Évolution des bénéfices, du budget et des revenus",
        xaxis = list(title = "Date (par année)"),
        yaxis = list(title = "Montant ($)"),
        legend = list(
          x = 0.5,
          y = -0.2,
          orientation = 'h',
          xanchor = 'center',
          yanchor = 'top'
        )
      )
  })
  
}
