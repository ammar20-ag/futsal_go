import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {

  final FirebaseMessaging messaging =
      FirebaseMessaging.instance;

  Future<void> init() async {

    await messaging.requestPermission();

    String? token =
        await messaging.getToken();

    print(
      "FCM TOKEN: $token",
    );
  }
}