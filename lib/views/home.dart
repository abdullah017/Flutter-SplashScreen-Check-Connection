import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Anasayfa'),
        ),
        body: const Center(
          child: Text('BAĞLANTINIZ OLDUĞU İÇİN BURADASINIZ :)'),
        ),
      ),
    );
  }
}
