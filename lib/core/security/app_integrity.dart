import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppIntegrity {

  final _storage = const FlutterSecureStorage();

  // Securely store a 'trust' flag locally

  Future<void> markDeviceSecure() async {

    await _storage.write(key: 'is_secure', value: 'true');

  }

}

