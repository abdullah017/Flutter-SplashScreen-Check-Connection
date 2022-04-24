// ignore_for_file: prefer_final_fields

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_check_connection/views/connection_error.dart';
import 'package:splash_screen_check_connection/views/home.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String connectionStatus = 'waiting';
  Connectivity _connectivity = Connectivity();
  Future<bool?> asyncNetCheck() async {
    var connectionResult = await _connectivity.checkConnectivity();

    if (connectionResult == ConnectivityResult.mobile) {
      return Future<bool>.value(true);
    } else if (connectionResult == ConnectivityResult.wifi) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  @override
  void initState() {
    super.initState();
    asyncNetCheck().then((value) {
      if (value == true) {
        connectionStatus = "connect";
        debugPrint(connectionStatus);
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        });
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          connectionStatus = "not_connect";
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ConnectionErrorView()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(
            size: 90,
          ),
        ),
      ),
    );
  }
}
