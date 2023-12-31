import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImpl implements NetWorkInfo {
  final InternetConnectionChecker _internetChecker = InternetConnectionChecker();
  @override
  Future<bool> get isConnected => _internetChecker.hasConnection;
}
