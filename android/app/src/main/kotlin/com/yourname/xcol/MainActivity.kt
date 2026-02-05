package com.yourname.xcol

import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.engine.FlutterEngine

import android.view.WindowManager.LayoutParams

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        super.configureFlutterEngine(flutterEngine)

        

        // Only secure the window once the engine is ready

        try {

            window.addFlags(LayoutParams.FLAG_SECURE)

        } catch (e: Exception) {

            // Log error but don't crash

        }

    }

}

