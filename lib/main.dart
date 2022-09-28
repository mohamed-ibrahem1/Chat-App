import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {

  //الكلام اللي تحت دة واخدة كوبي من ال 
  //FirebaseFire________________________
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterPage.routeId: (context) => const RegisterPage(),
        ChatPage.routeId: (context) => ChatPage(),
      },
      initialRoute: 'LoginPage',
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
