import 'package:weather_app_windows/app/responsive_screen.dart';

class FontSize {
  static double dynamicSize(double s0, [bool constWithAll = true]){
    double baseNum = 2;
    return ResponsiveScreen.newSize(s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, constWithAll: constWithAll, isFont: !constWithAll);
  }
}

class AppSize {

  static double wVector = ResponsiveScreen.newSize(250, 250, 250, 250, 250, constWithAll: true);
  static double productCardHeight = ResponsiveScreen.newSize(330, 330, 330, 330, 330, constWithAll: true);


  static double textStyleHeight__8 = .8;
  static double textStyleHeight__9 = .9;
  static double textStyleHeight_1 = 1;
  static double textStyleHeight_1_1 = 1.1;
  static double textStyleHeight_1_2 = 1.2;
  static double textStyleHeight_1_3 = 1.3;

  static double dynamicSize(double s0, [bool constWithAll = true]){
    double baseNum = 5;
    return ResponsiveScreen.newSize(s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, constWithAll: constWithAll);
  }

}

class OpacitySize {
  static const double o0005 = .0005;
  static const double o05 = .05;
  static const double o10 = .010;
  static const double o15 = .15;
  static const double o20 = .20;
  static const double o25 = .25;
  static const double o30 = .30;
  static const double o35 = .35;
  static const double o40 = .40;
  static const double o45 = .45;
  static const double o50 = .50;
  static const double o55 = .55;
  static const double o60 = .60;
  static const double o65 = .65;
  static const double o70 = .70;
  static const double o75 = .75;
  static const double o80 = .80;
  static const double o85 = .85;
  static const double o90 = .90;
  static const double o95 = .95;
  static const double o100 = 1;
}

class BorderRadiusSize {
  static double dynamicSize(double s0){
    double baseNum = 2;
    return ResponsiveScreen.newSize(s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, constWithAll: true);
  }
}

class ElevationSize {
  static const double e10 = 10;
  static const double e20 = 20;
  static const double e30 = 30;
  static const double e40 = 40;
  static const double e50 = 50;

}

class PaddingSize {
  static double dynamicSize(double s0, [bool constWithAll = true]){
    double baseNum = 2;
    return ResponsiveScreen.newSize(s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, s0 * baseNum, constWithAll: constWithAll);
  }
}
