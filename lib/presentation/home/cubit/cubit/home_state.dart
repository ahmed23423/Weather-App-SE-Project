part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class WeatherDetails extends HomeState {
  String cityName;
  String country;
  double temperatureInCelsius;
  double humidityInPercent;
  double widSpeed;
  double pressure;
  List<Weather> currentWeatherCityFiveDay;
  WeatherDetails([this.cityName = '', this.humidityInPercent = 0.0, this.pressure = 0.0, this.temperatureInCelsius = 0.0, this.widSpeed = 0.0, this.country = '', this.currentWeatherCityFiveDay = const []]);
}


final class DateTimeIntl extends HomeState{
  String dateTime;
  DateTimeIntl([this.dateTime = '' ]);
}
