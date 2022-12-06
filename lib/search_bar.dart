// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_using_provider/dio/dio_services.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<DioService>(context, listen: true);
    return Consumer<DioService>(
      builder: (context, DioService, child) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: TextField(
                controller: DioService.searchBar,
                style: TextStyle(color: Colors.yellow[300]),
                decoration: InputDecoration(
                  hintText: "Search City",
                  hintStyle: const TextStyle(fontSize: 15, color:Colors.yellow),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.yellow[300],
                  ),
                  iconColor: Colors.yellow[300],
                  filled: true,
                  // fillColor: Color(0xff1B1D25),
                  fillColor: Color(0xff1B2541),
                ),
                // onTap: () {
                //   if (DioService.searchBar.text.isNotEmpty) {
                //     state.searchCityName(DioService.searchBar.text);
                //   }
                // },
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                 style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 0, 43, 78))),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  state.searchCityName(DioService.searchBar.text);
                },
                child: Icon(
                  Icons.search_rounded,
                color: Colors.yellow[300],
                ))
          ],
        );
      },
    );
  }
}
