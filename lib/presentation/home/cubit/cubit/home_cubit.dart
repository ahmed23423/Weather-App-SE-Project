import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'dart:developer' as developer;
import 'package:weather_app_windows/app/constants.dart';
import 'package:weather_app_windows/app/print.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late WeatherFactory weatherFactory;

  Future<void> initCubit() async {
    dateTimer();
    weatherFactory = WeatherFactory(Constants.weatherApiKey, language: Language.ENGLISH);
    Weather currentWeatherCity = await weatherFactory.currentWeatherByCityName('Mansourah');
    List<Weather> currentWeatherCityFiveDay = await weatherFactory.fiveDayForecastByCityName('Mansourah');
    // 
    // Dio dio = Dio();
    // Response response = await dio.get('https://api.openweathermap.org/data/2.5/weather?q=Mansourah&lat=null&lon=null&exclude=current&lang=english&appid=${Constants.weatherApiKey}');
    // print(response.data);

    
    emit(WeatherDetails(currentWeatherCity.areaName!, currentWeatherCity.humidity!, currentWeatherCity.pressure!,
        currentWeatherCity.temperature!.celsius!, currentWeatherCity.windSpeed!, currentWeatherCity.country!, currentWeatherCityFiveDay));
    
    
  }

  void dateTimer(){
    emit(DateTimeIntl(DateFormat('EEEE hh:mm').format(DateTime.now())));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      String time = DateFormat('EEEE hh:mm').format(DateTime.now());
      emit(DateTimeIntl(time));
    });
  }
  
  
  // Future<List> getListOfAllCityNames() async {
  //   final dio = Dio();
  //   final url = 'http://bulk.openweathermap.org/sample/city.list.json.gz';

  //   try {
  //     final response = await dio.get(url);
  //     if (response.statusCode == 200) {
  //       final data = response.data;
  //       print((data));
  //       final cityNames = data.map((city) => city['name']).toList();
  //       return cityNames;
  //     } else {
  //       throw Exception('Failed to fetch data');
  //     }
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }
}
