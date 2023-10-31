// import 'dart:async';

// class NetworkState {
//   static ConnectivityResult connectivityResult = ConnectivityResult.none;

//   static Future<void> init() async {
//     connectivityResult = await Connectivity().checkConnectivity();

//     Connectivity().onConnectivityChanged.listen((event) {
//       connectivityResult = event;
//     });
//   }

//   static Future<bool> get isConnected async {
//     connectivityResult = await Connectivity().checkConnectivity();

//     return connectivityResult == ConnectivityResult.mobile ||
//         connectivityResult == ConnectivityResult.wifi;
//   }
// }
