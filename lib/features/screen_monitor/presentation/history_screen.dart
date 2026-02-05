// lib/features/screen_monitor/presentation/history_screen.dart

import 'package:flutter/material.dart';

// ... other imports

@override

Widget build(BuildContext context) {

  return Scaffold(

    appBar: AppBar(title: const Text("Scan History")),

    body: SensitiveContent(

      // This is the magic part

      // On Android 15+, this whole list will turn black if someone records the screen.

      sensitivity: ContentSensitivity.sensitive, 

      child: FutureBuilder<List<ScanEntry>>(

        future: _repo.getHistory(),

        builder: (context, snapshot) {

          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          if (snapshot.data!.isEmpty) return const Center(child: Text("No deepfakes detected yet."));

          return ListView.builder(

            itemCount: snapshot.data!.length,

            itemBuilder: (context, index) {

              final entry = snapshot.data![index];

              return ListTile(

                leading: Icon(

                  entry.isDeepfake ? Icons.warning : Icons.check_circle,

                  color: entry.isDeepfake ? Colors.red : Colors.green,

                ),

                title: Text("Confidence: ${(entry.confidence * 100).toStringAsFixed(1)}%"),

                subtitle: Text("Date: ${entry.timestamp.toString().split('.')[0]}"),

              );

            },

          );

        },

      ),

    ),

  );

}

