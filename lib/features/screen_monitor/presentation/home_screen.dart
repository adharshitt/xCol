import 'package:flutter/material.dart';

import 'package:flutter_background_service/flutter_background_service.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("xCol Shield")),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text("Status: Secure", style: TextStyle(color: Color(0xFF00FF88), fontSize: 20)),

            const SizedBox(height: 20),

            ElevatedButton(

              onPressed: () => FlutterBackgroundService().startService(),

              child: const Text("Start Real-Time Monitor"),

            ),

          ],

        ),

      ),

    );

  }

}

