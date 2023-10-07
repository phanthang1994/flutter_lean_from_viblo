import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class Configuration {
  final String host;
  final int port;

  Configuration({required this.host, required this.port});

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      host: json['host'] as String,
      port: json['port'] as int,
    );
  }
}

final configProvider = FutureProvider<Configuration>((ref) async {
  final content = await rootBundle.loadString('assets/configurations.json');
  final Map<String, dynamic> data = json.decode(content);
  return Configuration.fromJson(data);
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Configuration App'),
        ),
        body: const ConfigurationInfo(),
      ),
    );
  }
}

class ConfigurationInfo extends ConsumerWidget {
  const ConfigurationInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Configuration> configAsync = ref.watch(configProvider);

    return configAsync.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(
        child: Text('Error: $err'),
      ),
      data: (config) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Host:',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                config.host,
                style: const TextStyle(fontSize: 48.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
