# help_scout_flutter

A new Flutter plugin for the implementation of HelpScout Beacon.

## Getting started

### Add dependency

You can use the command to add help_scout_flutter as a dependency with the latest stable version:

```console
$ dart pub add help_scout_flutter
```

Or you can manually add help_scout_flutter into the dependencies section in your pubspec.yaml:

```yaml
dependencies:
  help_scout_flutter: ^replace-with-latest-version
```

### Super simple to use

```dart
 ElevatedButton(
    onPressed: () {
        HelpScoutFlutter _helpScoutFlutterPlugin = HelpScoutFlutter(beaconId: '*******beacon-id******',);
        _helpScoutFlutter.initialize()
              .then((value) => _helpScoutFlutter.open());
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue[700]!)),
    child: const Text('HelpScout Button'),
),
```
