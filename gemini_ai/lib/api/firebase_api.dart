import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gemini_ai/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fCTMToken = await _firebaseMessaging.getToken();

    print("Token:  ${fCTMToken}");
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) {}
    navigatorKey.currentState
        ?.pushNamed('/notification_screen', arguments: message);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
