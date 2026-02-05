import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  // Request all xCol-critical permissions at once

  static Future<bool> requestAll() async {

    Map<Permission, PermissionStatus> statuses = await [

      Permission.camera, // For manual deep scans

      Permission.systemAlertWindow, // For the "Deepfake Alert" popup

      Permission.manageExternalStorage, // For secure local history

      Permission.notification, // For the protection status bar

    ].request();

    // Returns true only if the core system-level permissions are granted

    return statuses[Permission.systemAlertWindow]!.isGranted &&

           statuses[Permission.notification]!.isGranted;

  }

}

