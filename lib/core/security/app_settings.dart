import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSettings {

  final _storage = const FlutterSecureStorage();

  // Logic for the 'Kill Switch': If true, the app wipes all local scan data

  Future<void> setKillSwitch(bool active) async {

    await _storage.write(key: 'kill_switch', value: active.toString());

  }

  // Adjust AI sensitivity: 0.1 (Strict) to 1.0 (Relaxed)

  Future<void> setSensitivity(double value) async {

    await _storage.write(key: 'ai_sensitivity', value: value.toString());

  }

  Future<bool> getKillSwitch() async {

    String? val = await _storage.read(key: 'kill_switch');

    return val == 'true';

  }

}

