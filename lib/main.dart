import 'package:flutter/material.dart';

import 'dart:async';

import 'services/background_monitor.dart';

import 'services/notification_service.dart';

import 'features/onboarding/presentation/onboarding_screen.dart';

void main() async {

  // Defensive Start

  WidgetsFlutterBinding.ensureInitialized();

  // Load UI first to prevent black screen timeout

  runApp(const XColApp());

  // Background heavy tasks start after a small delay

  Future.delayed(const Duration(seconds: 2), () async {

    try {

      await NotificationService.init();

      await BackgroundMonitor.initialize();

    } catch (e) {

      debugPrint("Delayed Init Error: $e");

    }

  });

}

class XColApp extends StatelessWidget {

  const XColApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'xCol Security',

      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: const Color(0xFF121212),

      ),

      home: const OnboardingScreen(),

    );

  }

}

