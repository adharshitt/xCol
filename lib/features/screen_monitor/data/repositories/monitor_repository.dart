import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/scan_entry.dart';

class MonitorRepository {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _historyKey = 'xcol_scan_history';

  // Securely write a new scan to the encrypted history

  Future<void> saveScan(ScanEntry entry) async {

    final List<ScanEntry> history = await getHistory();

    history.insert(0, entry); // Keep newest at the top

    final String jsonString = jsonEncode(

      history.map((e) => {

        'id': e.id,

        'timestamp': e.timestamp.toIso8601String(),

        'confidence': e.confidence,

        'isDeepfake': e.isDeepfake,

      }).toList(),

    );

    await _storage.write(key: _historyKey, value: jsonString);

  }

  // Retrieve and decrypt the entire history

  Future<List<ScanEntry>> getHistory() async {

    final String? data = await _storage.read(key: _historyKey);

    if (data == null) return [];

    final List<dynamic> jsonList = jsonDecode(data);

    return jsonList.map((item) => ScanEntry(

      id: item['id'],

      timestamp: DateTime.parse(item['timestamp']),

      confidence: item['confidence'],

      isDeepfake: item['isDeepfake'],

    )).toList();

  }

  Future<void> clearHistory() async {

    await _storage.delete(key: _historyKey);

  }

}

