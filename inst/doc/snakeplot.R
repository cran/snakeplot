## ----options, include = FALSE-----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7,
                      fig.height = 5, fig.align = "center", dpi = 96)
old_options <- options(digits = 3, width = 90)

## ----setup------------------------------------------------------------------------------
library(snakeplot)

## ----one-student------------------------------------------------------------------------
student <- subset(ema_beeps, id == "xcVDLRQOwn")
xtabs(~ day, data = student)

## ----activity-snake---------------------------------------------------------------------
activity_snake(student, flow = "snake", title = "Prompts answered, snake flow")

## ----activity-natural-------------------------------------------------------------------
activity_snake(student, flow = "natural",
               title = "Prompts answered, natural flow")

## ----survey-----------------------------------------------------------------------------
survey_snake(ema_emotions, tick_shape = "bar", sort_by = "mean",
             colors = snake_palette("ocean", n = 5))

## ----sequence---------------------------------------------------------------------------
sequence_snake(with(student, factor(happy, levels = 1:5,
                                    labels = c("Not at all", "Slightly",
                                               "Moderate", "Quite",
                                               "Extremely"))),
               rows = 5, title = "Happiness at each prompt")

## ----sequence-counts--------------------------------------------------------------------
xtabs(~ happy, data = student)

## ----timeline---------------------------------------------------------------------------
career <- data.frame(
  role  = c("Intern", "Junior developer", "Developer",
            "Senior developer", "Lead", "Architect"),
  start = c("2015-01", "2015-07", "2017-01", "2019-07", "2022-07",
            "2024-01"),
  end   = c("2015-06", "2016-12", "2019-06", "2022-06", "2023-12",
            "2024-12")
)
timeline_snake(career)

## ----restore-options, include = FALSE-----------------------------------------
options(old_options)

