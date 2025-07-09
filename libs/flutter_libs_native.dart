import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_libs_native/flutter_libs_native.dart';
import 'package:flutter_libs_native/flutter_libs_native_platform_interface.dart';

// Export all your existing functionality
export 'src/interfaces/error_logger_interface.dart';
export 'src/services/error_logger_service.dart' show ErrorLoggerService;
export 'src/services/notification_service.dart' show NotificationService;
export 'src/services/notification_config.dart' show NotificationConfig;
export 'src/firebase/background_handlers.dart';
export 'src/services/session_manager.dart' show SessionManager;
export 'src/firebase/firebase_initializer.dart' show FirebaseInitializer;
export 'src/services/location_service.dart' show LocationService;
export 'src/services/geofence_manager.dart'
    show GeofenceManager, GeofenceLocation;
export 'src/services/notification_constants.dart' show NotificationConstants;

class FlutterLibsNative {
  static final FlutterLibsNativePlatform _platform =
      FlutterLibsNativePlatform.instance;

  /// Provides access to error logging service
  static final IErrorLogger errorLogger = ErrorLoggerService();

  /// Get platform version (example method)
  static Future<String?> getPlatformVersion() async {
    return _platform.getPlatformVersion();
  }

  /// Initialize core services
  static Future<void> initialize() async {
    await _platform.initializeErrorLogger();
    await _platform.initializeLocationService();
    await _platform.configureNotifications();
    await _platform.startSessionManager();
  }

  /// Initialize Firebase with Remote Config
  static Future<Map<String, String>?>
  initializeFirebaseWithRemoteConfig() async {
    return _platform.initializeFirebaseWithRemoteConfig();
  }

  /// Initialize geofencing service
  static Future<void> initializeGeofencingService() async {
    await _platform.initializeGeofencingService();
  }

  /// Configure notifications
  static Future<void> configureNotifications() async {
    await _platform.configureNotifications();
  }
}
