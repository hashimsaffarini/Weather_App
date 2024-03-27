import 'package:flutter/material.dart';
import 'package:weather_app/views/pages/search_view.dart';
import 'package:weather_app/views/widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
          ),
        ],
      ),
      body: const NoWeatherBody(),
    );
  }
}
