import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/SignIn.dart';
import 'screens/SignUp.dart';
import 'screens/HomePage.dart';
import 'screens/confirmation_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCI7Vp18JyMg5nHR2Us4ZFUJUDOwrIHP50',
      appId: 'com.example.first_app',
      messagingSenderId:
          '52096088446-t43vjbr6gnaio6cvttrkp9bip2e75gv5.apps.googleusercontent.com',
      projectId: 'food-app-7',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(),
      //home: welcome(),
      //home: SignIn(),
      //home: SignUp(),
      home: HomePage(),
      //home: AddToCart(),
      //home: Confirmation(),
    );
  }
}
