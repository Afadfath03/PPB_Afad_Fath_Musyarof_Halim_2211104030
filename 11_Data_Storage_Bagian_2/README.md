# PERTEMUAN KE 11

## Firebase Notification

---

### GUIDED

Source Code

- main
``` dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'mynotif.dart';

// Variabel global
String? token;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

// Fungsi handler untuk background message
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Mynotif(),
    );
  }
}
```

- view
``` dart
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';

class Mynotif extends StatefulWidget {
  const Mynotif({super.key});

  @override
  _MynotifState createState() => _MynotifState();
}

class _MynotifState extends State<Mynotif> {
  @override
  void initState() {
    super.initState();

    // Inisialisasi notifikasi lokal
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: "@mipmap/ic_launcher",
            ),
          ),
        );
      }
    });

    // Menangani pesan ketika notifikasi dibuka
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? ""),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(notification.body ?? "")],
                ),
              ),
            );
          },
        );
      }
    });

    // Mendapatkan token FCM
    getToken();
  }

  // Metode untuk mendapatkan token FCM
  void getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Example')),
      body: const Center(child: Text('Hello, Notifications!')),
    );
  }
}
```

---

### UNGUIDED
``` text
Modifikasi guided sesuai nama, nim, kelas, prodi
```

1. Koding
   - main.dart
     ``` dart
      import 'package:firebase_core/firebase_core.dart';
      import 'package:firebase_messaging/firebase_messaging.dart';
      import 'package:flutter/material.dart';
      import 'package:unguided11/firebase.dart';
      
      import 'notif.dart';
      
      String? title = '';
      String? data = '';
      
      Future<void> main() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
        FirebaseApi().initFCM();
        LocalNotificationHandler().initLocalNotifications();
        runApp(const MainApp());
      }
      
      class MainApp extends StatefulWidget {
        const MainApp({super.key});
      
        @override
        State<MainApp> createState() => _MainAppState();
      }
      
      class _MainAppState extends State<MainApp> {
        @override
        void initState() {
          super.initState();
          FirebaseMessaging.onMessageOpenedApp.listen((message) {
            setState(() {
              title = message.notification!.title;
              data = message.notification!.body;
            });
          });
        }
      
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                centerTitle: true,
                title: const Text('Test Notifikasi Firebase',
                    style: TextStyle(color: Colors.white)),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$title',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text('$data'),
                  ],
                ),
              ),
            ),
          );
        }
      }
     ```
     
   - firebase.dart
     ``` dart
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
     ```

   - notif.dart
     ``` dart
      import 'package:firebase_messaging/firebase_messaging.dart';
      import 'package:flutter_local_notifications/flutter_local_notifications.dart';
      
      class LocalNotificationHandler {
        final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
      
        Future<void> initLocalNotifications() async {
          const AndroidInitializationSettings androidSettings =
              AndroidInitializationSettings('@mipmap/ic_launcher');
      
          const InitializationSettings initializationSettings =
              InitializationSettings(
            android: androidSettings,
          );
      
          await flutterLocalNotificationsPlugin.initialize(initializationSettings);
        }
      
        Future<void> showLocalNotification(RemoteMessage message) async {
          const AndroidNotificationDetails androidDetails =
              AndroidNotificationDetails(
            'default_channel', // ID channel
            'Default Notifications', // Nama channel
            importance: Importance.high,
            priority: Priority.high,
          );
      
          const NotificationDetails platformDetails = NotificationDetails(
            android: androidDetails,
          );
      
          await flutterLocalNotificationsPlugin.show(
            message.hashCode, // ID unik notifikasi
            message.notification?.title, // Judul notifikasi
            message.notification?.body, // Konten notifikasi
            platformDetails,
          );
        }
      }
     ```
     
2. Output
   - notif <br> ![WhatsApp Image 2024-12-03 at 03 28 37_68e92275](https://github.com/user-attachments/assets/7c62da65-2402-46f8-987e-7d121e2a9855)

   - app <br> ![WhatsApp Image 2024-12-03 at 03 28 38_f5c4d494](https://github.com/user-attachments/assets/9cfcdda9-285c-49b6-a4a4-d148c16c142b)

3. Penjelasan
   - main.dart berisi kodingan utama untuk menampilkan apa yang ada pada aplikasi dan inisiasi fungsi lain
   - notif.dart berisi kodingan untuk menghandle notifikasi sehingga dapat di tampilkan
   - firebase.dart berisi kodingan untuk menghandle fungsi firebase cloud message
