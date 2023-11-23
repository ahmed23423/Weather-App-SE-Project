import 'package:weather_app_windows/data/request/request.dart';

import '../../response/response.dart';

import 'login_services.dart';

abstract class AppServicesClient {
}

class AppServicesClientImpl extends LoginServicesClientImpl {
  @override
  Future<String> signUp({required CompleteSignUpRequest completeSignUpRequest}) async {
    return await super.signUp(completeSignUpRequest: completeSignUpRequest);
  }

  @override
  Future<String> login({required LoginDetailsRequest loginDetailsRequest}) async {
    return await super.login(loginDetailsRequest: loginDetailsRequest);
  }
}
