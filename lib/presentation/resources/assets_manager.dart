import '../../data/network/error_handler.dart';
import '../../data/network/failure.dart';

class AssetsManager {
  static const String onBoardingOne = 'assets/images/onBoardingOne.svg';
  static const String onBoardingTwo = 'assets/images/onBoardingTwo.svg';
  static const String onBoardingThree = 'assets/images/onBoardingThree.svg';
  static const String forgetPassword = 'assets/images/forgetPassword.svg';
  static const String restPassword = 'assets/images/restPassword.svg';
  static const String noInternetConnection = 'assets/images/noConnection.svg';

  static String getAssetsImageError(Failure failure){
    if(failure.message == ResponseMessage.NO_INTERNET_CONNECTION){
      return AssetsManager.noInternetConnection;
    }else{
      return '';
    }
  }
}
