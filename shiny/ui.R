#
# UI application shiny
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

min_date <- as.Date("1916-09-04")
max_date <- as.Date("2017-02-03")

dashboardPage(
  dashboardHeader(title = "Dashboard", titleWidth  = 350),
  
  
  dashboardSidebar(
    width = 350,
    sidebarMenu(
      menuItem("Stats", tabName = "stats", icon = icon("table")),
      menuItem(
        "Graphiques",
        tabName = "tab2",
        icon = icon("chart-simple")
      )
    ),
    sliderInput(
      "yearRange",
      "Sélectionnez l'intervalle d'années :",
      min = as.numeric(format(min_date, "%Y")),
      max = as.numeric(format(max_date, "%Y")),
      value = c(as.numeric(format(min_date, "%Y")), as.numeric(format(max_date, "%Y"))),
      step = 1,
      sep = ""
    )
    
  ),
  
  
  dashboardBody(tabItems(
    tabItem(
      tabName = "stats",
      
      fluidRow(
        box(
          title = "Données à visualiser",
          status = "primary",
          solidHeader = TRUE,
          collapsible = TRUE,
        selectInput(
          "choice",
          "",
          choices = c(
            "Revenus et budget" = "both",
            "Revenus" = "revenue",
            "Budget" = "budget"
            
          )
        )),
        valueBoxOutput("nbFilms")
      ),
      fluidRow(
        conditionalPanel(condition = "input.choice == 'both' || input.choice == 'revenue'",
                         infoBoxOutput("mean_revenue"), ),
        conditionalPanel(condition = "input.choice == 'both' || input.choice == 'budget'",
                         infoBoxOutput("mean_budget"), )
      ),
      fluidRow(
        conditionalPanel(condition = "input.choice == 'both' || input.choice == 'revenue'",
                         infoBoxOutput("median_revenue"), ),
        conditionalPanel(condition = "input.choice == 'both' || input.choice == 'budget'",
                         infoBoxOutput("median_budget"))
      ),
      fluidRow(
        conditionalPanel(
          condition = "input.choice == 'both' || input.choice == 'revenue'",
          box(
            title = "Distribution des revenus",
            status = "success",
            solidHeader = TRUE,
            collapsible = TRUE,
            plotlyOutput("boxplotRevenue")
          ),
        ),
        conditionalPanel(
          condition = "input.choice == 'both' || input.choice == 'budget'",
          box(
            title = "Distribution du budget",
            status = "danger",
            solidHeader = TRUE,
            collapsible = TRUE,
            plotlyOutput("boxplotBudget")
          )
        ),
      ),
    ),
    
    
    
    tabItem(tabName = "tab2",
            fluidRow(
              box(
                title = "Choisir un type d'agrégation",
                status = "primary",
                solidHeader = TRUE,
                collapsible = TRUE,
                selectInput(
                  "aggregation",
                  "Type d'agrégation :",
                  choices = c("Moyenne" = "mean", "Médiane" = "median")
                )
              ),
              box(
                title = "Info",
                status = "info",
                solidHeader = TRUE,
                collapsible = TRUE,
                p(
                  "Sur ce graphique, les bénéfices correspondent aux revenus du film moins le budget du film."
                ),
                p(
                  "L'agrégation pour les calculs de la moyenne ou la médiane des films est réalisée par année."
                )
              )
            ),
            fluidRow(plotlyOutput("evolutionPlot")))
  ))
)