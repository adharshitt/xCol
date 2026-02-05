import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityLogic {

  static const _storage = FlutterSecureStorage();

  static Future<bool> isEnvironmentSafe() async {

    // Add logic here for root detection packages if needed

    final firstRun = await _storage.read(key: 'initialized');

    if (firstRun == null) {

      await _storage.write(key: 'initialized', value: DateTime.now().toIso8601String());

    }

    return true; 

  }

}

