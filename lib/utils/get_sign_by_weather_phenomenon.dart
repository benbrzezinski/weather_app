String getSignByWeatherPhenomenon(String weatherPhenomenon) {
  const signs = {"Humidity": "%", "Wind Speed": "m/s", "Pressure": "hPa"};
  return signs[weatherPhenomenon] ?? "";
}
