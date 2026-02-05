import 'dart:async';

import 'dart:typed_data';

import 'package:flutter/services.dart';

class ScreenCaptureService {

  // We use a MethodChannel to talk to the native Android side

  static const _channel = MethodChannel('com.xcol.security/screen_capture');

  // Triggers the system "Start Recording?" dialog

  Future<bool> requestProjectionPermission() async {

    try {

      final bool granted = await _channel.invokeMethod('requestPermission');

      return granted;

    } catch (e) {

      return false;

    }

  }

  // Starts the background capture loop

  void startAnalysisLoop(Function(Uint8List) onFrameCaptured) {

    Timer.periodic(const Duration(seconds: 2), (timer) async {

      try {

        // Grabs a single frame from the virtual display

        final Uint8List? frame = await _channel.invokeMethod('getNextFrame');

        if (frame != null) {

          onFrameCaptured(frame);

        }

      } catch (e) {

        // Handle capture errors securely

      }

    });

  }

}

