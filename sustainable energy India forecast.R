# ===============================================================
# TIME SERIES FORECASTING
# For dataset: Global data on sustainable energy (Cleaned).csv
# ===============================================================

#  Install packages
#install.packages(c("tidyverse", "forecast", "readr", "ggplot2"))

#  Load libraries
library(tidyverse)
library(forecast)
library(ggplot2)
library(readr)


#Imported the dataset using 'import dataset' option
#rename it

data <- Global_data_on_sustainable_energy_Cleaned_


# check the dataset

dim(data)     # number of rows and columns
names(data)   # column names
summary(data) # basic stats
str(data)     # structure and data types

#  Choose variable and country for forecasting
target_var <- "Access_to_electricity_of_population"   # change if needed
country_name <- "India"                               # change to any country in your data
forecast_horizon <- 5                                 # years ahead

#  Filter and prepare data
df_country <- data %>%
  filter(Country == country_name) %>%
  arrange(Year) %>%
  select(Year, all_of(target_var)) %>%
  drop_na()

# Check data
print(df_country)

#  Create a time series object
ts_data <- ts(df_country[[target_var]], 
              start = min(df_country$Year), 
              end = max(df_country$Year), 
              frequency = 1)   # yearly data
#check data
print(ts_data)

#  Fit ARIMA model automatically
fit <- auto.arima(ts_data)

#  Forecast for next 5 years
forecast_result <- forecast(fit, h = forecast_horizon)

#  Print summary
print(summary(fit))
print(forecast_result)

#  Plot the forecast
autoplot(forecast_result) +
  ggtitle(paste("Forecast of", target_var, "for", country_name)) +
  xlab("Year") + ylab(target_var)


# Plot with labels for both actual and forecasted values
actual_data <- data.frame(
  Year = df_country$Year,
  Value = df_country[[target_var]]
)

forecast_data <- data.frame(
  Year = time(forecast_result$mean),
  Value = as.numeric(forecast_result$mean)
)

ggplot() +
  geom_line(data = actual_data, aes(x = Year, y = Value), color = "blue") +
  geom_point(data = actual_data, aes(x = Year, y = Value), color = "blue") +
  geom_text(data = actual_data, aes(x = Year, y = Value, label = round(Value, 2)),
            vjust = -0.5, color = "blue", size = 3.2) +
  geom_line(data = forecast_data, aes(x = Year, y = Value), color = "red") +
  geom_point(data = forecast_data, aes(x = Year, y = Value), color = "red") +
  geom_text(data = forecast_data, aes(x = Year, y = Value, label = round(Value, 2)),
            vjust = -0.5, color = "red", size = 3.2) +
  ggtitle(paste("Forecast of", target_var, "for", country_name)) +
  xlab("Year") + ylab(target_var) +
  theme_minimal(base_size = 13)


#  Save forecast results
output_folder <- "R_Forecast_Output"
dir.create(output_folder, showWarnings = FALSE)

# Save forecast data to CSV
forecast_df <- data.frame(
  Year = (max(df_country$Year) + 1):(max(df_country$Year) + forecast_horizon),
  Forecast = as.numeric(forecast_result$mean),
  Lo80 = forecast_result$lower[,"80%"],
  Hi80 = forecast_result$upper[,"80%"],
  Lo95 = forecast_result$lower[,"95%"],
  Hi95 = forecast_result$upper[,"95%"]
)

write_csv(forecast_df, file.path(output_folder, paste0(country_name, "_forecast.csv")))


cat("\n Forecast saved in folder:", output_folder, "\n")


# in the same way we can forecast for each country
# ===============================================================
# We can:
# - Change `country_name` and rerun to forecast another country.
# - Change `target_var` to forecast a different column.
# - Adjust `forecast_horizon` to extend years.
# ===============================================================





