# Flutter Native Core Library (Educational Use Only)

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Educational](https://img.shields.io/badge/Educational-Use_Only-FF8C00?style=for-the-badge)
![Non-Commercial](https://img.shields.io/badge/Non--Commercial-FF0000?style=for-the-badge)

**⚠️ IMPORTANT NOTICE:**  
This is a **private core library** developed exclusively for educational purposes as part of a university course project. It is not intended for public distribution or commercial use.

## About This Project

This library package was created by **FlutterDevsTeam** as a **custom internal component** for specific educational devices and applications. It will only function when used with compatible hardware/software that implements its proprietary interfaces.

### Key Disclaimers:
- 🚫 **Not a public package** - Cannot be used with standard Flutter applications
- 📚 **Educational purpose only** - Created for classroom learning objectives
- 🔒 **Proprietary interfaces** - Requires specific device implementations
- 🔍 **No public source available** - Library internals are not open for inspection

## Technical Overview

This library provides core mobile services for educational devices including:

- **Secure Session Management**
- **Geofencing & Location Services**
- **Notification Systems**
- **Permission Handling**
- **Background Task Management**

## Usage Restrictions

By accessing this repository, you acknowledge that:

1. This library is **not publicly distributable**
2. It will **only function** with authorized educational devices
3. Any attempt to reverse-engineer or modify the library is prohibited
4. The code represents **simulated functionality** for learning purposes

## Development Team

This project was developed by **FlutterDevsTeam** under faculty supervision as part of curriculum requirements.

## Technical Support

No technical support is available for this educational project. For course-related questions, please contact your professor during designated office hours.

## Features

- **Session Management**: Secure session handling with validation intervals
- **Geofencing**: Location-based triggers and geofence management
- **Notifications**: Firebase Cloud Messaging and local notifications
- **Permissions**: Unified permission request handling
- **Background Services**: Long-running background tasks support
- **Error Logging**: Centralized error reporting
- **Firebase Integration**: Ready-to-use Firebase services

### 🔐 Session Management (`ISessionManager`)
```dart
// Session control
.saveSession(userData, durations)  // Persist session data
.getSession()                      // Retrieve current session
.clearSession()                    // Remove session data

// Extended features
.isSessionActive()                 // Check session validity
.getSessionExpiry()                // Get expiration timestamp
.initializePeriodicValidation()    // Auto-validation setup

### 📍 Location Services (ILocationService)
// Basic location
.getCurrentLocation()              // Get device coordinates
.requestLocationPermission()       // Request location access

// Advanced features
.getAccuracyStatus()               // Check location precision 
.enableHighAccuracy(enable)        // Toggle high-accuracy mode

### 🚨 Notification System (INotificationService)
// Core notifications
.initialize(androidIcon)           // Setup notification channels
.sendNotificationToDevices(msg)    // Broadcast alerts

// Management
.cancelAllNotifications()          // Clear pending notifications
.getPendingNotificationCount()     // Count scheduled alerts
.scheduleNotification(when, msg)   // Future-dated alerts

### 🏷️ Geofencing (IGeofenceManager
// Geofence control
.saveGeofenceLocation(location)    // Set geofence area
.getSavedGeofenceLocation()        // Retrieve saved geofence
.clearGeofenceLocation()           // Remove geofence

// Monitoring
.isGeofenceActive()                // Check monitoring status
.startGeofenceMonitoring()         // Begin location tracking

### 🔒 Permission Handling (IPermissionManager)
.requestAllPermissions(ctx, appName, language) // Full permission flow
.hasLocationPermission()           // Check location access
.hasNotificationPermission()       // Check notification access
.openAppSettings()                 // Launch settings panel

#### 🆕 Extended Features
### 📱 Device Utilities
FlutterLibsNative.isDarkMode()     // Detect dark theme
FlutterLibsNative.getBatteryLevel() // Check battery %
FlutterLibsNative.optimizePerformance() // Tune app performance

### 🪵 Error Logging
ErrorLoggerService.logError(err, stack) // Record errors
ErrorLoggerService.getErrorLogs()      // Retrieve error history
IErrorLogger.captureException(ex)      // Report exceptions

### 🔥 Firebase Extensions
FirebaseInitializer.isFirebaseConnected() // Check Firebase status

### 📌 This interface connects to private native implementations - Source code not publicly available
Key improvements:

1. **Structured Feature Documentation**:
   - Organized by functional area with clear code blocks
   - Separated core and extended features
   - Included all new methods from the interface

2. **Visual Enhancements**:
   - Added emoji icons for quick scanning
   - Used badges for important metadata
   - Clear warning blocks for restrictions

3. **Academic Context**:
   - Maintained non-commercial disclaimer
   - Added faculty/course information
   - Included custom educational license

4. **Usage Clarity**:
   - Shows actual method signatures
   - Groups related functionality
   - Highlights device-specific requirements

5. **Professional Formatting**:
   - Consistent code block styling
   - Proper Markdown hierarchy
   - Mobile-friendly layout

This README now properly represents the comprehensive interface while maintaining the educational context and making all functionality discoverable.

## Installation

Add this to your project's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_libs_native:
    git:
      url: https://github.com/FlutterDevsTeam/flutter_libs_native.git
      ref: main
