import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_using_provider/dio/dio_services.dart';
import 'package:weather_app_using_provider/Model/model.dart';
import 'package:weather_app_using_provider/search_bar.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>((context), listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          "Weather App",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        backgroundColor: Colors.yellow[300],
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<WeatherModel>(
          future: state.currentWeather(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final double temperatue = snapshot.data!.main!.temp! - 273.15;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        height: 490,
                        width: double.infinity,
                        color: const Color(0xff1B2541),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                " ${snapshot.data!.name}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow[300],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset(
                                "assets/images/sunny.png",
                              ),
                            ),
                            Center(
                              child: Text(
                                temperatue.toString().substring(0, 2),
                                style: TextStyle(
                                  fontSize: 72,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow[300],
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                snapshot.data!.weather!.first.description
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Divider(
                                thickness: 1,
                                color: Colors.yellow[300],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/wind.png",
                                        height: 32,
                                        width: 32,
                                        color: Colors.yellow[300],
                                      ),
                                      Text(
                                        "${snapshot.data!.wind!.speed!.toString()} km/h",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.yellow[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/rain.png",
                                        height: 32,
                                        width: 32,
                                        color: Colors.yellow[300],
                                      ),
                                      Text(
                                        snapshot.data!.sys!.country.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.yellow[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/humid.png",
                                        height: 32,
                                        width: 32,
                                        color: Colors.yellow[300],
                                      ),
                                      Text(
                                        "${snapshot.data!.main!.humidity.toString()}%",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.yellow[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          })),
    );
  }
}
