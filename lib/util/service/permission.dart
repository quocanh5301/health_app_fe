import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionService {
   Future<PermissionStatus> requestPermission();
}

class LocationPermissionService implements IPermissionService {
  @override
  Future<PermissionStatus> requestPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status.isDenied) {
      status = await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }

    return status;
  }
}

class PhysicalActivityPermissionService implements IPermissionService {
  @override
  Future<PermissionStatus> requestPermission() async {
    PermissionStatus status = await Permission.activityRecognition.status;

    if (status.isDenied) {
      status = await Permission.activityRecognition.request();
    }
    if (status.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }

    return status;
  }
}

class ScheduleExactAlarmPermissionsServices implements IPermissionService {
  @override
  Future<PermissionStatus> requestPermission() async {
    PermissionStatus status = await Permission.scheduleExactAlarm.status;
    if (status.isDenied) {
      status = await Permission.scheduleExactAlarm.request();
    }
    if (status.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }
    return status;
  }
}

class NotificationPermissionsServices implements IPermissionService {
  @override
  Future<PermissionStatus> requestPermission() async {
    PermissionStatus status = await Permission.notification.status;
    if (status.isDenied) {
      status = await Permission.notification.request();
    }
    if (status.isPermanentlyDenied) {
      return PermissionStatus.permanentlyDenied;
    }
    return status;
  }
}