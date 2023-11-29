import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/current_weather/ui/screen/current_weather_screen.dart';
import 'package:weather_app/features/search_city/ui/screen/city_search_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const CitySearchScreen();
        }),
    GoRoute(
      path: '/current',
      builder: (context, routeState) {
        final query = routeState.extra as Map;
        return CurrentWeatherScreen(
            latitude: query['lati']!, 
            longitude: query['longi']!,
            city: query['city'] );
      },
    )
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
