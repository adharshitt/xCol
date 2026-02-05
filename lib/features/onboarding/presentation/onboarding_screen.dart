import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

class OnboardingScreen extends StatelessWidget {

  const OnboardingScreen({super.key});

  Future<void> _setupPermissions(BuildContext context) async {

    await [Permission.camera, Permission.notification, Permission.systemAlertWindow].request();

    if (context.mounted) Navigator.pushReplacementNamed(context, '/home');

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(Icons.security, size: 100, color: Color(0xFF00FF88)),

            const Text("xCol Security", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

            const Padding(

              padding: EdgeInsets.all(20),

              child: Text("Protecting 8 Billion Users from Deepfakes.", textAlign: TextAlign.center),

            ),

            ElevatedButton(

              onPressed: () => _setupPermissions(context),

              child: const Text("Activate Shield"),

            ),

          ],

        ),

      ),

    );

  }

}

