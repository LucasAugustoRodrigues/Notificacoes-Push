import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // ignore: deprecated_member_use
  final token = await FirebaseMessaging.instance.getToken();
  debugPrint('FCM_TOKEN $token');
  FirebaseMessaging.onMessage.listen((message) {
    debugPrint(
      'FCM_MSG ${message.notification?.title} | ${message.notification?.body} | ${message.data}',
    );
  });
  runApp(const AgendaApp());
}

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda Cultural',
      home: Scaffold(
        appBar: AppBar(title: const Text('Agenda Cultural')),
        body: const Center(child: Text('Em breve: a agenda da semana em Belém.')),
      ),
    );
  }
}
