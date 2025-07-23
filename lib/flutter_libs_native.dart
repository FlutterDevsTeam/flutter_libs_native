import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_libs_native/flutter_libs_native.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications/src/platform_specifics/android/notification_channel.dart';
import 'package:geolocator/geolocator.dart';

enum Language { english, spanish }

class IBackgroundHandlerInterface {
  @pragma('vm:entry-point')
  static void Function(NotificationResponse) get onNotificationTap =>
      notificationBackgroundTap;

  @pragma('vm:entry-point')
  static Future<void> Function(RemoteMessage) get onBackgroundMessage =>
      firebaseMessagingBackgroundHandler;
}

class ISessionManager {
  static Duration validationInterval = Duration(days: 10);

  static Future<void> saveSession(
    String userData,
    Duration? sDuration,
    Duration? customDuration,
  ) async {
    await SessionManager.saveSession(userData, sDuration, customDuration);
  }

  static Future<String?> getSession() async {
    return await SessionManager.getSession();
  }

  static Future<void> clearSession() async {
    await SessionManager.clearSession();
  }

  static Future<void> initializePeriodicValidation() async {
    await SessionManager.initializePeriodicValidation();
  }

  static Future<void> checkAndValidateSession() async {}
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

@pragma('vm:entry-point')
void notificationBackgroundTap(NotificationResponse response) {}

class SessionManager {
  static Future<void> saveSession(
    String userData,
    Duration? sDuration,
    Duration? customDuration,
  ) async {}

  static Future<String?> getSession() async {}

  static Future<void> clearSession() async {}

  static Future<void> initializePeriodicValidation() async {}
}

class IPermissionManager {
  static Future<void> requestAllPermissions(
    BuildContext context,
    String appName,
    Language language,
  ) async {
    await PermissionManager().requestAllPermissions(context, appName, language);
  }
}

class PermissionManager {
  Future<void> requestAllPermissions(
    BuildContext context,
    String appName,
    Language language,
  ) async {}
}

class IGeofenceManager {
  static Future<GeofenceLocation?> getSavedGeofenceLocation() async {
    return await GeofenceManager().getSavedGeofenceLocation();
  }

  static Future<void> clearGeofenceLocation() async {
    await GeofenceManager().clearGeofenceLocation();
  }

  static Future<void> saveGeofenceLocation({
    required GeofenceLocation location,
    bool setLocal = false,
  }) async {
    await GeofenceManager().saveGeofenceLocation(
      location: location,
      setLocal: setLocal,
    );
  }
}

class GeofenceManager {
  Future<void> saveGeofenceLocation({
    required GeofenceLocation location,
    bool setLocal = false,
  }) async {}

  Future<void> clearGeofenceLocation() async {}

  Future<GeofenceLocation?> getSavedGeofenceLocation() async {}
}

class ILocationService {
  static Future<Position?> getCurrentLocation() async {
    return await LocationService().getCurrentLocation();
  }

  static Future<bool> requestLocationPermission() async {
    return await LocationService().requestLocationPermission();
  }
}

class LocationService {
  Future<Position?> getCurrentLocation() async {
    return null;
  }

  Future<bool> requestLocationPermission() async {
    return false;
  }
}

class INotificationChannels {
  final NotificationChannels _notificationChannels = NotificationChannels();
  static final AndroidNotificationChannel emergencyChannel =
      NotificationChannels.emergencyChannel;
  static final AndroidNotificationChannel generalChannel =
      NotificationChannels.generalChannel;
}

class INotificationConfig {
  final NotificationConfig _notificationConfig = NotificationConfig();

  static const String androidGeneralChannelId =
      NotificationConfig.androidGeneralChannelId;

  static const int foregroundNotificationId =
      NotificationConfig.foregroundNotificationId;
}

class INotificationService {
  static late NotificationService _instance;

  static NotificationService init({
    FirebaseMessaging? fcm,
    FirebaseFirestore? firestore,
    FlutterLocalNotificationsPlugin? notificationsPlugin,
    FlutterBackgroundService? backgroundService,
  }) {
    _instance = NotificationService(
      fcm: fcm,
      firestore: firestore,
      notificationsPlugin: notificationsPlugin,
      backgroundService: backgroundService,
    );
    return _instance;
  }

  static NotificationService get instance => _instance;

  Future<void> initialize({
    required String androidIcon,
    bool requestIOSPermissions = true,
  }) async {
    await _instance.initialize(
      androidIcon: androidIcon,
      requestIOSPermissions: requestIOSPermissions,
    );
  }

  static Future<bool?> sendNotificationToConnectedDevices(
    String alertNotificationMessage,
  ) async {
    return await _instance.sendNotificationToConnectedDevices(
      alertNotificationMessage,
    );
  }
}

class INotificationServices {
  static late NotificationServices _instance;

  static NotificationServices init({
    required FlutterBackgroundService backgroundService,
  }) {
    _instance =
        NotificationService(backgroundService: backgroundService)
            as NotificationServices;
    return _instance;
  }

  static INotificationService get instance => _instance;

  Future<void> initialize({
    required String androidIcon,
    bool requestIOSPermissions = true,
  }) async {
    await _instance.initialize(
      androidIcon: androidIcon,
      requestIOSPermissions: requestIOSPermissions,
    );
  }
}

class IGeofenceLocation {
  final double latitude;
  final double longitude;
  final double radiusKm;

  IGeofenceLocation({
    required this.latitude,
    required this.longitude,
    this.radiusKm = 1.0,
  });
}

class FlutterLibsNative {
  static const MethodChannel _channel = MethodChannel('flutter_libs_native');

  static Future<void> fiInitialize() async {
    return FirebaseInitializer.initialize();
  }

  static final FlutterLibsNativePlatform _platform =
      FlutterLibsNativePlatform.instance;

  static final ErrorLoggerService errorLogger = ErrorLoggerService();

  static Future<String?> getPlatformVersion() async {
    return _platform.getPlatformVersion();
  }

  static Future<void> initialize() async {
    await _channel.invokeMethod('initialize');

    await _platform.initializeErrorLogger();
    await _platform.initializeLocationService();
    await _platform.configureNotifications();
    await _platform.startSessionManager();
  }

  static Future<Map<String, String>?>
  initializeFirebaseWithRemoteConfig() async {
    return _platform.initializeFirebaseWithRemoteConfig();
  }

  static Future<void> initializeGeofencingService() async {
    await _platform.initializeGeofencingService();
  }

  static Future<void> configureNotifications() async {
    await _platform.configureNotifications();
  }
}

class ErrorLoggerService {}

class IErrorLogger {}

class FirebaseInitializer {
  static Future<void> initialize() async {}
}

class GeofenceLocation {
  final double latitude;
  final double longitude;
  final double radiusKm;
  GeofenceLocation({
    required this.latitude,
    required this.longitude,
    this.radiusKm = 1.0,
  });
}

class NotificationChannels {
  static late AndroidNotificationChannel emergencyChannel;
  static late AndroidNotificationChannel generalChannel;
  NotificationChannels();
}

class NotificationConfig {
  static const androidGeneralChannelId = 'general_channel';
  const NotificationConfig();

  static const foregroundNotificationId = 10013;
}

class NotificationService {
  NotificationService({
    FirebaseMessaging? fcm,
    FirebaseFirestore? firestore,
    FlutterLocalNotificationsPlugin? notificationsPlugin,
    FlutterBackgroundService? backgroundService,
  });

  Future<void> initialize({
    required String androidIcon,
    bool requestIOSPermissions = true,
  }) async {}

  Future<bool?> sendNotificationToConnectedDevices(
    String alertNotificationMessage,
  ) async {}
}

abstract class NotificationServices implements INotificationService {
  NotificationServices({
    FirebaseMessaging? fcm,
    FirebaseFirestore? firestore,
    FlutterLocalNotificationsPlugin? notificationsPlugin,
    required FlutterBackgroundService backgroundService,
  });
}

abstract class FlutterLibsNativePlatform {
  Future<String?> getPlatformVersion();
  Future<void> initializeErrorLogger();
  Future<void> initializeLocationService();
  Future<void> configureNotifications();
  Future<void> startSessionManager();

  static FlutterLibsNativePlatform get instance => throw UnimplementedError();

  Future<Map<String, String>?> initializeFirebaseWithRemoteConfig() async {}

  Future<void> initializeGeofencingService() async {}
}
