// ignore_for_file: prefer_final_fields

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_check_connection/views/home.dart';

class ConnectionErrorView extends StatefulWidget {
  const ConnectionErrorView({Key? key}) : super(key: key);

  @override
  State<ConnectionErrorView> createState() => _ConnectionErrorViewState();
}

class _ConnectionErrorViewState extends State<ConnectionErrorView> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'MAALESEF İNTERNET BAĞLANTINIZ YOK.\nLÜTFEN BAĞLANTINIZI KONTROL EDİN \nVE TEKRAR DENEYİN',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  asyncNetCheck().then((value) {
                    if (value == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
                    }
                  });
                },
                child: const Text('Tekrar Dene'))
          ],
        ),
      ),
    );
  }
}
