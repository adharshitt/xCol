import 'package:flutter/services.dart';

class CaptureEngine {

  static const _channel = MethodChannel('com.xcol.security/capture');

  static Future<void> activateCapture() async {

    try {

      final bool success = await _channel.invokeMethod('requestCapturePermission');

      if (success) {

        // Now that permission is logged, we start the foreground service

        // that handles the actual TFLite inference.

      }

    } on PlatformException catch (e) {

      // Handle security denial

    }

  }

}

