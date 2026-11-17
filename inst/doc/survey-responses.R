## ----options, include = FALSE-----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7,
                      fig.height = 5.5, fig.align = "center", dpi = 96)
old_options <- options(digits = 2, width = 90)

## ----setup------------------------------------------------------------------------------
library(snakeplot)

## ----labels-----------------------------------------------------------------------------
labs5 <- c("1" = "Not at all", "2" = "Slightly", "3" = "Moderate",
           "4" = "Quite", "5" = "Extremely")

## ----ticks------------------------------------------------------------------------------
survey_snake(ema_emotions, level_labels = labs5,
             colors = snake_palette("ocean", n = 5))

## ----means------------------------------------------------------------------------------
sort(colMeans(ema_emotions))

## ----sorted-----------------------------------------------------------------------------
survey_snake(ema_emotions, sort_by = "mean", level_labels = labs5,
             colors = snake_palette("ocean", n = 5))

## ----top-share--------------------------------------------------------------------------
sort(colMeans(ema_emotions >= 4))

## ----bars-------------------------------------------------------------------------------
survey_snake(ema_emotions, tick_shape = "bar", sort_by = "mean",
             level_labels = labs5, colors = snake_palette("ocean", n = 5))

## ----sequence---------------------------------------------------------------------------
survey_sequence(ema_emotions, sort_by = "mean",
                colors = snake_palette("ocean", n = 5))

## ----markers----------------------------------------------------------------------------
survey_snake(ema_emotions, tick_shape = "bar", sort_by = "mean",
             show_mean = TRUE, show_median = TRUE, level_labels = labs5,
             colors = snake_palette("ocean", n = 5))

## ----medians----------------------------------------------------------------------------
vapply(ema_emotions, median, numeric(1))

## ----dots-------------------------------------------------------------------------------
survey_snake(ema_emotions, tick_shape = "dot", sort_by = "mean",
             level_labels = labs5, colors = snake_palette("viridis", n = 5),
             band_palette = c("#1a1228", "#1a2a42"))

## ----correlation------------------------------------------------------------------------
survey_snake(ema_emotions, sort_by = "mean", arc_fill = "correlation",
             level_labels = labs5, colors = snake_palette("ocean", n = 5))

## ----daily------------------------------------------------------------------------------
survey_snake(ema_beeps, var = "angry", day = "day", level_labels = labs5,
             colors = snake_palette("sunset", n = 5),
             title = "Anger, by study day")

## ----daily-share------------------------------------------------------------------------
aggregate(angry ~ day, data = ema_beeps, FUN = \(x) mean(x >= 3))

## ----daily-time-------------------------------------------------------------------------
survey_snake(ema_beeps, var = "angry", day = "day",
             timestamp = "start_time", level_labels = labs5,
             colors = snake_palette("sunset", n = 5),
             title = "Anger, by time of day")

## ----sequential-------------------------------------------------------------------------
sequential_dist(ema_emotions, sort_by = "mean")

## ----restore-options, include = FALSE-----------------------------------------
options(old_options)

