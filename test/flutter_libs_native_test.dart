// ignore_for_file: unused_local_variable

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_libs_native/flutter_libs_native.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLibsNativePlatform
    with MockPlatformInterfaceMixin
    implements FlutterLibsNativePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> configureNotifications() {
    // TODO: implement configureNotifications
    throw UnimplementedError();
  }

  @override
  Future<void> initializeErrorLogger() {
    // TODO: implement initializeErrorLogger
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>?> initializeFirebaseWithRemoteConfig() {
    // TODO: implement initializeFirebaseWithRemoteConfig
    throw UnimplementedError();
  }

  @override
  Future<void> initializeGeofencingService() {
    // TODO: implement initializeGeofencingService
    throw UnimplementedError();
  }

  @override
  Future<void> initializeLocationService() {
    // TODO: implement initializeLocationService
    throw UnimplementedError();
  }

  @override
  Future<void> startSessionManager() {
    // TODO: implement startSessionManager
    throw UnimplementedError();
  }
}

void main() {
  final FlutterLibsNativePlatform initialPlatform =
      FlutterLibsNativePlatform.instance;

  test('$MethodChannelFlutterLibsNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLibsNative>());
  });

  test('getPlatformVersion', () async {
    FlutterLibsNative flutterLibsNativePlugin = FlutterLibsNative();
    MockFlutterLibsNativePlatform fakePlatform =
        MockFlutterLibsNativePlatform();

    expect(await FlutterLibsNative.getPlatformVersion(), '42');
  });
}

class MethodChannelFlutterLibsNative {
  Future getPlatformVersion() async {}
}
