// ignore_for_file: unused_field

import 'dart:math';

import 'package:dartz/dartz_unsafe.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:weather_app_windows/app/responsive_screen.dart';
import 'package:weather_app_windows/presentation/common/components/button_components.dart';
import 'package:weather_app_windows/presentation/home/cubit/cubit/home_cubit.dart';
import 'package:weather_app_windows/presentation/resources/color_manager.dart';
import 'package:weather_app_windows/presentation/resources/values_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context)..initCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreen(builder: (context, info) {
      return Scaffold(
        backgroundColor: Colors.white60,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.dynamicSize(12), vertical: AppSize.dynamicSize(3)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ClearSky',
                    style: GoogleFonts.almarai(
                        fontSize: FontSize.dynamicSize(9), fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: AppSize.dynamicSize(20)),
                  Expanded(
                    child: Container(
                      height: AppSize.dynamicSize(6.5),
                      padding: EdgeInsets.symmetric(horizontal: AppSize.dynamicSize(2)),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(4)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.02),
                                offset: Offset(0, 3),
                                blurRadius: 16)
                          ]),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: FontSize.dynamicSize(10),
                          ),
                          SizedBox(width: AppSize.dynamicSize(2)),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Search Location',
                                  hintStyle: GoogleFonts.almarai(
                                      fontSize: FontSize.dynamicSize(7),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.dynamicSize(20)),
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      if (current is DateTimeIntl) {
                        if (previous is DateTimeIntl) {
                          if (previous != current) return true;
                          return false;
                        }
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is! DateTimeIntl) {
                        state = DateTimeIntl();
                      }
                      return Text(
                        state.dateTime,
                        style: GoogleFonts.almarai(
                            fontSize: FontSize.dynamicSize(7), fontWeight: FontWeight.w500),
                      );
                    },
                  ),
                  SizedBox(width: AppSize.dynamicSize(8)),
                  ButtonComponents.animatedTextButton(
                    onTap: () {},
                    fixedSize: Size(AppSize.dynamicSize(6), AppSize.dynamicSize(6)),
                    alignmentGeometry: Alignment.center,
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadiusSize.dynamicSize(4),
                    boxShadow: BoxShadow(
                        color: Colors.black.withOpacity(.02),
                        offset: const Offset(0, 3),
                        blurRadius: 16),
                    child: Icon(
                      Icons.face_6_rounded,
                      color: Colors.black,
                      size: FontSize.dynamicSize(10),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.dynamicSize(12), vertical: AppSize.dynamicSize(3)),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: AppSize.dynamicSize(50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(10)),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/home-background.jpg'),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.low)),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) {
                          if (current is WeatherDetails) {
                            if (previous is WeatherDetails) {
                              if (previous != current) return true;
                              return false;
                            }
                            return true;
                          }
                          return false;
                        },
                        builder: (context, state) {
                          if (state is WeatherDetails) {
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: PaddingSize.dynamicSize(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${state.cityName}, ${state.country}',
                                        style: TextStyle(
                                            fontSize: FontSize.dynamicSize(15),
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${state.temperatureInCelsius.toString().split("").getRange(0, 4).join('')} \u2103',
                                        style: TextStyle(
                                            fontSize: FontSize.dynamicSize(20),
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSize.dynamicSize(7),
                                  )
                                ],
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                if (current is WeatherDetails) {
                  if (previous is WeatherDetails) {
                    if (previous != current) return true;
                    return false;
                  }
                  return true;
                }
                return false;
              },
              builder: (context, weatherDetails) {
                if (weatherDetails is! WeatherDetails) {
                  weatherDetails = WeatherDetails();
                }
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.dynamicSize(12), vertical: AppSize.dynamicSize(3)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingSize.dynamicSize(8),
                              horizontal: PaddingSize.dynamicSize(10)),
                          // height: AppSize.dynamicSize(21),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.02),
                                    offset: const Offset(0, 3),
                                    blurRadius: 16)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Current Temperature',
                                    softWrap: true,
                                    style: GoogleFonts.cairo(
                                        fontSize: FontSize.dynamicSize(6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: PaddingSize.dynamicSize(4),
                                  ),
                                  Icon(
                                    Icons.cloud_queue_rounded,
                                    color: const Color.fromRGBO(255, 129, 0, 0.9),
                                    size: FontSize.dynamicSize(8),
                                  )
                                ],
                              ),
                              Text(
                                '${weatherDetails.temperatureInCelsius.toString().split(".")[0]} \u2103',
                                style: GoogleFonts.cairo(
                                    fontSize: FontSize.dynamicSize(17),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: PaddingSize.dynamicSize(8),
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingSize.dynamicSize(8),
                              horizontal: PaddingSize.dynamicSize(10)),
                          // height: AppSize.dynamicSize(21),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.02),
                                    offset: const Offset(0, 3),
                                    blurRadius: 16)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Wind Speed',
                                    softWrap: true,
                                    style: GoogleFonts.cairo(
                                        fontSize: FontSize.dynamicSize(6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: PaddingSize.dynamicSize(4),
                                  ),
                                  Icon(
                                    Icons.air_rounded,
                                    color: const Color.fromRGBO(255, 129, 0, 0.9),
                                    size: FontSize.dynamicSize(8),
                                  )
                                ],
                              ),
                              Text(
                                '${weatherDetails.widSpeed} m/s',
                                style: GoogleFonts.cairo(
                                    fontSize: FontSize.dynamicSize(17),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: PaddingSize.dynamicSize(8),
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingSize.dynamicSize(8),
                              horizontal: PaddingSize.dynamicSize(10)),
                          // height: AppSize.dynamicSize(21),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.02),
                                    offset: const Offset(0, 3),
                                    blurRadius: 16)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Humidity',
                                    softWrap: true,
                                    style: GoogleFonts.cairo(
                                        fontSize: FontSize.dynamicSize(6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: PaddingSize.dynamicSize(4),
                                  ),
                                  Icon(
                                    Icons.water_drop_outlined,
                                    color: const Color.fromRGBO(255, 129, 0, 0.9),
                                    size: FontSize.dynamicSize(8),
                                  )
                                ],
                              ),
                              Text(
                                '${weatherDetails.widSpeed} %',
                                style: GoogleFonts.cairo(
                                    fontSize: FontSize.dynamicSize(17),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: PaddingSize.dynamicSize(8),
                      ),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          padding: EdgeInsets.symmetric(
                              vertical: PaddingSize.dynamicSize(8),
                              horizontal: PaddingSize.dynamicSize(10)),
                          // height: AppSize.dynamicSize(21),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.02),
                                    offset: const Offset(0, 3),
                                    blurRadius: 16)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Pressure',
                                    softWrap: true,
                                    style: GoogleFonts.cairo(
                                        fontSize: FontSize.dynamicSize(6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: PaddingSize.dynamicSize(4),
                                  ),
                                  Icon(
                                    Icons.compress_rounded,
                                    color: const Color.fromRGBO(255, 129, 0, 0.9),
                                    size: FontSize.dynamicSize(8),
                                  )
                                ],
                              ),
                              Text(
                                '${weatherDetails.pressure} Pa',
                                style: GoogleFonts.cairo(
                                    fontSize: FontSize.dynamicSize(17),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: PaddingSize.dynamicSize(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric( horizontal: AppSize.dynamicSize(12)),
              child: Row(
                children: [
                  Text('Temperature chart for the next 5 Days', style: GoogleFonts.cairo(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            SizedBox(
              height: PaddingSize.dynamicSize(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric( horizontal: AppSize.dynamicSize(12)),
              child: Row(
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    buildWhen: (previous, current) {
                      if (current is WeatherDetails) {
                        if (previous is WeatherDetails) {
                          if (previous != current) return true;
                          return false;
                        }
                        return true;
                      }
                      return false;
                    },
                    builder: (context, weatherDetails) {
                      if (weatherDetails is! WeatherDetails) {
                        weatherDetails = WeatherDetails();
                      }
                      return Container(
                        width: 350,
                        height: ResponsiveScreen.newSize(30, 30, 30, 30, 30, withWidth: false),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: BarChart(
                          BarChartData(
                            titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: getTitles,
                                    reservedSize: 38,
                                  ),
                                ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false, getTitlesWidget: (a, b)=> getTitles2(a, b, weatherDetails as WeatherDetails), reservedSize: 38),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true, getTitlesWidget: (a, b)=> getTitles2(a, b, weatherDetails as WeatherDetails), reservedSize: 38),
                              ),
                            ),
                          barGroups: weatherDetails.currentWeatherCityFiveDay.isNotEmpty ? [
                            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: weatherDetails.currentWeatherCityFiveDay[0].temperature!.celsius!)]),
                            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: weatherDetails.currentWeatherCityFiveDay[1].temperature!.celsius!)]),
                            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: weatherDetails.currentWeatherCityFiveDay[2].temperature!.celsius!)]),
                            BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: weatherDetails.currentWeatherCityFiveDay[3].temperature!.celsius!)]),
                            BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: weatherDetails.currentWeatherCityFiveDay[4].temperature!.celsius!)])
                          ] : [],
                          borderData: FlBorderData(show: true, border: Border.all(color: Colors.transparent, width: 1)),
                          groupsSpace: 45,
                          backgroundColor: Colors.white,
                          alignment: BarChartAlignment.center,


                          ),
                        ),

                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text(DateFormat('EE').format(DateTime.now().add(Duration(days: 1))), style: style);
      break;
    case 2:
      text = Text(DateFormat('EE').format(DateTime.now().add(Duration(days: 2))), style: style);
      break;
    case 3:
      text = Text(DateFormat('EE').format(DateTime.now().add(Duration(days: 3))), style: style);
      break;
    case 4:
      text = Text(DateFormat('EE').format(DateTime.now().add(Duration(days: 4))), style: style);
      break;
    case 5:
      text = Text(DateFormat('EE').format(DateTime.now().add(Duration(days: 5))), style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}
Widget getTitles2(double value, TitleMeta meta, WeatherDetails weatherDetails) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      String temp;
      try{
        temp = weatherDetails.currentWeatherCityFiveDay[0].temperature!.celsius!.toString().split("").getRange(0, 5).join('') + ' \u2103';
      }catch(e){
        temp = weatherDetails.currentWeatherCityFiveDay[0].temperature!.celsius!.toString() + ' \u2103';
      }
      text = Text(temp, style: style);
      break;
    case 2:
      String temp;
      try{
        temp = weatherDetails.currentWeatherCityFiveDay[1].temperature!.celsius!.toString().split("").getRange(0, 5).join('') + ' \u2103';
      }catch(e){
        temp = weatherDetails.currentWeatherCityFiveDay[1].temperature!.celsius!.toString() + ' \u2103';
      }
      text = Text(temp, style: style);      break;
    case 3:
      String temp;
      try{
        temp = weatherDetails.currentWeatherCityFiveDay[2].temperature!.celsius!.toString().split("").getRange(0, 5).join('') + ' \u2103';
      }catch(e){
        temp = weatherDetails.currentWeatherCityFiveDay[2].temperature!.celsius!.toString() + ' \u2103';
      }
      text = Text(temp, style: style);      break;
    case 4:
      String temp;
      try{
        temp = weatherDetails.currentWeatherCityFiveDay[3].temperature!.celsius!.toString().split("").getRange(0, 5).join('') + ' \u2103';
      }catch(e){
        temp = weatherDetails.currentWeatherCityFiveDay[3].temperature!.celsius!.toString() + ' \u2103';
      }
      text = Text(temp, style: style);      break;
    case 5:
      String temp;
      try{
        temp = weatherDetails.currentWeatherCityFiveDay[4].temperature!.celsius!.toString().split("").getRange(0, 5).join('') + ' \u2103';
      }catch(e){
        temp = weatherDetails.currentWeatherCityFiveDay[4].temperature!.celsius!.toString() + ' \u2103';
      }
      text = Text(temp, style: style);      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}

class Data {
  Data(this.temp, this.day);
  final double temp;
  final String day;
}
