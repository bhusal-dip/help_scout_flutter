import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HelpScoutFlutter {
  static const MethodChannel _channel = MethodChannel('help_scout_flutter');

  /// This is your beacon ID
  final String beaconId;

  /// This is the user's name
  final String name;

  /// This is the user's email address
  final String email;

  /// This is the user's avatar/photo
  final String avatar;

  /// This is the user's company
  final String company;

  /// This is the user's job title
  final String jobTitle;

  HelpScoutFlutter({
    this.email = '',
    this.name = '',
    required this.beaconId,
    this.avatar = '',
    this.company = '',
    this.jobTitle = '',
  });

  /// This method will initialize the beacon.
  Future<String?> initialize() async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
      'email': email,
      'name': name,
      'avatar': avatar,
      'jobTitle': jobTitle,
      'company': company,
    };

    try {
      final String result;
      result = await _channel.invokeMethod(
        'initialize',
        data,
      );
      debugPrint(result);
      return result;
    } on PlatformException catch (e) {
      debugPrint('Unable to initialize beacon: ${e.toString()}');
    }
    return null;
  }

  /// Once you’ve initialized Beacon, you’re ready to interact with it.
  /// Whenever you want to invoke Beacon, use the code below to
  /// display the Beacon user interface.
  Future<String?> open() async {
    var data = <String, dynamic>{
      'beaconId': beaconId,
    };

    try {
      final String result;
      result = await _channel.invokeMethod(
        'openBeacon',
        data,
      );
      return result;
    } on PlatformException catch (e) {
      debugPrint('Unable to open beacon: ${e.toString()}');
    }
    return null;
  }

  /// This method wipes all data from the Beacon,
  /// including the Beacon ID. This may be useful if
  /// you are using different Beacons in different parts of your app.
  Future<String?> clear() async {
    try {
      final String result = await _channel.invokeMethod(
        'clearBeacon',
      );
      debugPrint(result);
      return result;
    } on PlatformException catch (e) {
      debugPrint('Unable to open beacon: ${e.toString()}');
    }
    return null;
  }
}
