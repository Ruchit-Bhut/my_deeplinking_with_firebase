/*
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_notification/firebase_options.dart';
import 'package:my_notification/screen/home_screen.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
  await Firebase.initializeApp();
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
       );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
*/


/*

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:my_notification/firebase_options.dart';
import 'package:my_notification/screen/home_screen.dart';
import 'package:my_notification/screen/message_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  handleNotificationClick(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      handleDynamicLink(dynamicLinkData);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });

    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      handleDynamicLink(initialLink);
    }
  }

  void handleDynamicLink(PendingDynamicLinkData data) {
    final Uri deepLink = data.link;
    if (deepLink != null) {
      final queryParams = deepLink.queryParameters;
      if (queryParams.containsKey('id')) {
        final id = queryParams['id'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageScreen(id: id!),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

void handleNotificationClick(RemoteMessage message) {
  if (message.data.containsKey('link')) {
    final Uri deepLink = Uri.parse(message.data['link']);
    if (deepLink != null) {
      final queryParams = deepLink.queryParameters;
      if (queryParams.containsKey('id')) {
        final id = queryParams['id'];
        // Navigate to the MessageScreen with the provided ID
        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => MessageScreen(id: id!),
          ),
        );
      }
    }
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
*/


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_notification/firebase_options.dart';
import 'package:my_notification/refer_page/refer_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReferPage(),
    );
  }
}