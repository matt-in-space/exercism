// Package weather provides resources for forecasting the weather.
package weather

var (
    // CurrentCondition provides the current condition.
	CurrentCondition string
    // CurrentLocation provides the current location.
	CurrentLocation  string
)

// Forecast forecasts the weather.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
