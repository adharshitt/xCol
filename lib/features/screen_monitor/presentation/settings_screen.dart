import 'package:flutter/material.dart';

import '../../../core/security/app_settings.dart';

class SettingsScreen extends StatefulWidget {

  @override

  _SettingsScreenState createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  final _settings = AppSettings();

  bool _killSwitch = false;

  double _sensitivity = 0.85;

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Security & Privacy")),

      body: ListView(

        children: [

          SwitchListTile(

            title: Text("Emergency Kill Switch"),

            subtitle: Text("Instantly wipe all history if threat detected"),

            value: _killSwitch,

            onChanged: (val) => setState(() => _killSwitch = val),

          ),

          ListTile(

            title: Text("AI Detection Sensitivity"),

            subtitle: Text("Current: ${(_sensitivity * 100).toInt()}%"),

          ),

          Slider(

            value: _sensitivity,

            min: 0.5,

            max: 0.95,

            onChanged: (val) => setState(() => _sensitivity = val),

          ),

          Divider(),

          ListTile(

            leading: Icon(Icons.delete_forever, color: Colors.red),

            title: Text("Wipe All Encrypted Data"),

            onTap: () { /* Add wipe logic here */ },

          ),

        ],

      ),

    );

  }

}

