import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> get isConnected => isConnectedNetwork();

  Future<bool> isConnectedNetwork() async {
    var connectivityResult = await connectivity.checkConnectivity();
    print(connectivityResult);
    return true;
    return connectivityResult.isNotEmpty &&
        !connectivityResult.contains(ConnectivityResult.none);
  }
}
