// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/dio/dio_services.dart';
import 'package:weather_app_using_provider/weather_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DioService>(
      create: ((context) => DioService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherAppScreen(),
      ),
    );
  }
}
