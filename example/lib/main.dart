import 'package:flutter/material.dart';
import 'package:help_scout_flutter/help_scout_flutter.dart';
import 'package:help_scout_flutter/model.dart';

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

  void initBeacon() {
    // Initialize with beacon ID and user info
    final user = HSBeaconUser(email: 'john@example.com', name: 'John Doe');
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
        appBar: AppBar(title: const Text('Help Scout Example App')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Initialize and open the beacon
              final initResult = await _helpScoutFlutterPlugin.initialize();
              debugPrint('Initialize result: $initResult');

              final openResult = await _helpScoutFlutterPlugin.open();
              debugPrint('Open result: $openResult');
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => Colors.blue[700]!,
              ),
            ),
            child: const Text('HelpScout Button'),
          ),
        ),
      ),
    );
  }
}
