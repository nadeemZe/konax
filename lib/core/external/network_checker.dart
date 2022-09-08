import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get online;
}


class NetworkCheckerImpl implements NetworkChecker{

  final InternetConnectionChecker internetConnectionChecker;
  NetworkCheckerImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get online => internetConnectionChecker.hasConnection;

}
