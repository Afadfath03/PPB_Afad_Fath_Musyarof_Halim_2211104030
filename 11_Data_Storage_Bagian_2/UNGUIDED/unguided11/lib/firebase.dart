import 'package:firebase_messaging/firebase_messaging.dart';
import 'notif.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFCM() async {
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');

    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationHandler().showLocalNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Message Title: ${message.notification?.title}");
  print('Message Data : ${message.notification?.body}');
}
