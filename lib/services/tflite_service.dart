import 'package:tflite_flutter/tflite_flutter.dart';

import 'dart:typed_data';

import 'package:image/image.dart' as img;

class TfliteService {

  Interpreter? _interpreter;

  Future<void> initModel() async {

    try {

      _interpreter = await Interpreter.fromAsset('models/xcol.tflite');

    } catch (e) {

      // Handle model loading error securely

    }

  }

  Future<double> analyzeFrame(Uint8List frameBytes) async {

    if (_interpreter == null) return 0.0;

    // Preprocessing: Resize to 224x224 (Standard for mobile AI models)

    img.Image? image = img.decodeImage(frameBytes);

    if (image == null) return 0.0;

    img.Image resized = img.copyResize(image, width: 224, height: 224);

    // Convert to float32 matrix for the model

    var input = resized.getBytes().reshape([1, 224, 224, 3]);

    var output = List<double>.filled(1, 0).reshape([1, 1]);

    _interpreter!.run(input, output);

    return output[0][0]; // Returns AI Confidence (0.0 to 1.0)

  }

}

