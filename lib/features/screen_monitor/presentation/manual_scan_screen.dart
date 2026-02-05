import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../../../services/tflite_service.dart';

class ManualScanScreen extends StatefulWidget {

  @override

  _ManualScanScreenState createState() => _ManualScanScreenState();

}

class _ManualScanScreenState extends State<ManualScanScreen> {

  File? _selectedImage;

  final TfliteService _aiService = TfliteService();

  bool _isAnalyzing = false;

  Future<void> _pickImage(ImageSource source) async {

    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {

      setState(() => _selectedImage = File(pickedFile.path));

    }

  }

  Future<void> _runDeepScan() async {

    if (_selectedImage == null) return;

    setState(() => _isAnalyzing = true);

    // Convert image to bytes and run on-device AI

    final bytes = await _selectedImage!.readAsBytes();

    double score = await _aiService.analyzeFrame(bytes);

    setState(() => _isAnalyzing = false);

    _showResult(score);

  }

  void _showResult(double score) {

    showModalBottomSheet(

      context: context,

      builder: (_) => Container(

        padding: EdgeInsets.all(20),

        child: Text("AI Confidence: ${(score * 100).toStringAsFixed(2)}%"),

      ),

    );

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Manual Deep Scan")),

      body: Column(

        children: [

          if (_selectedImage != null) Image.file(_selectedImage!, height: 300),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              ElevatedButton(onPressed: () => _pickImage(ImageSource.gallery), child: Text("Gallery")),

              ElevatedButton(onPressed: () => _pickImage(ImageSource.camera), child: Text("Camera")),

            ],

          ),

          if (_selectedImage != null)

            ElevatedButton(

              onPressed: _isAnalyzing ? null : _runDeepScan,

              child: _isAnalyzing ? CircularProgressIndicator() : Text("Start Deep Scan"),

            ),

        ],

      ),

    );

  }

}

