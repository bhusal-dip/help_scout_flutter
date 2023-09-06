import 'package:flutter/material.dart';
import 'package:help_scout_flutter/help_scout_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final HelpScoutFlutter _helpScoutFlutterPlugin;

  initBeacon() {
    _helpScoutFlutterPlugin = HelpScoutFlutter(
      beaconId: '*******beacon-id******',
    );
  }

  @override
  void initState() {
    initBeacon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Help Scout example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _helpScoutFlutterPlugin
                  .initialize()
                  .then((value) => _helpScoutFlutterPlugin.open());
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue[700]!),
            ),
            child: const Text('HelpScout Button'),
          ),
        ),
      ),
    );
  }
}
