import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final weatherFutureProvider = FutureProvider.autoDispose<Weather>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return weatherRepository.getWeather(city: 'London');
});

class WeatherRepository {
  Future<Weather> getWeather({required String city}) async {
    await Future.delayed(const Duration(seconds: 2));
    return Weather(city: city, temperature: 22.0, weatherDescription: 'Cloudy');
  }
}

class Weather {
  final String city;
  final double temperature;
  final String weatherDescription;

  Weather({
    required this.city,
    required this.temperature,
    required this.weatherDescription,
  });

  @override
  String toString() {
    return 'City: $city, Temperature: $temperature°C, Description: $weatherDescription';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Weather App'),
          ),
          body: const WeatherInfo(),
        ),
      ),
    );
  }
}

class WeatherInfo extends ConsumerWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherFutureProvider);

    return weatherAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(
        child: Text('Error: $err'),
      ),
      data: (weather) => Center(
        child: Text(weather.toString()),
      ),
    );
  }
}
