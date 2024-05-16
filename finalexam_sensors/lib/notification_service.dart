import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  static void initializeNotifications() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notification',
          channelDescription: 'Notification channel for basic test',
          defaultPrivacy: NotificationPrivacy.Private,
          importance: NotificationImportance.Max,
        ),
      ],
      debug: true,
    );
  }

  static void requestNotificationPermission() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  static void showBasicNotification({
    required String title,
    required String body,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'DISMISS',
          label: 'Dismiss',
        ),
      ],
      schedule: null,
      // autoCancel: true, // Wake up screen when notification is shown
      // sound: 'asset://raw/Notification.mp3', // If using a custom sound
    );
  }
}

// import 'package:awesome_notifications/awesome_notifications.dart';
//
// class NotificationService {
//   static void initializeNotifications() {
//     AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic Notification',
//           channelDescription: 'Notification channel for basic test',
//           defaultPrivacy: NotificationPrivacy.Private,
//           importance: NotificationImportance.Max,
//         ),
//       ],
//       debug: true,
//     );
//   }
//
//   static void showBasicNotification({required String title,
//     required String body,
//     String? customSound}) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 1,
//         channelKey: 'basic_channel',
//         title: title,
//         body: body,
//         notificationLayout: NotificationLayout.Default,
//       ),
//       schedule: null,
//       wakeUpScreen: true,
//       soundSource: customSound != null ? NotificationSoundSource.resource(customSound) : null,
//     );
//   }
//
//   static void requestNotificationPermission() {
//     AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//       if (!isAllowed) {
//         AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }
// }
