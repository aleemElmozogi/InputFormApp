import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form/screens/homeScreen/homeScreen.dart';

void main() {
  debugRepaintRainbowEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDcxCeO0f0CKPWj6NdoxEkbBR0JRRLF3hM",
      appId: "1:350913699676:web:a1cf558e425a59337dab99",
      messagingSenderId: "G-11PZSEBXQC",
      projectId: "data-form-1fdaf",
      authDomain: "data-form-1fdaf.firebaseapp.com",
      databaseURL:
          "https://data-form-1fdaf-default-rtdb.europe-west1.firebasedatabase.app",
      storageBucket: "data-form-1fdaf.appspot.com",
      measurementId: "G-11PZSEBXQC",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'HomeScreen',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'HomeScreen': (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => const SecondScreen(),
      },
      localizationsDelegates: const [
        // to make the app RIGHT to LEFT
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
          "fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,

      theme: ThemeData(),
    );
  }
}
