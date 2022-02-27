import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projectflutter_2022/Login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const FirebaseOptions (
          apiKey: "AIzaSyC3T_a9X-AaULbdZKBPWlsYkDm-sOEPIKA",
          authDomain: "fluttterproject2022.firebaseapp.com",
          projectId: "fluttterproject2022",
          storageBucket: "fluttterproject2022.appspot.com",
          messagingSenderId: "733647817453",
          appId: "1:733647817453:web:777a2dbd2ed62c2a42dae4",
          measurementId: "G-8NNQ3KP02X"
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  MaterialColor generateMaterialColorFromColor(Color color) {
    return MaterialColor(color.value, {
      50: Color.fromRGBO(color.red, color.green, color.blue, 0.1),
      100: Color.fromRGBO(color.red, color.green, color.blue, 0.2),
      200: Color.fromRGBO(color.red, color.green, color.blue, 0.3),
      300: Color.fromRGBO(color.red, color.green, color.blue, 0.4),
      400: Color.fromRGBO(color.red, color.green, color.blue, 0.5),
      500: Color.fromRGBO(color.red, color.green, color.blue, 0.6),
      600: Color.fromRGBO(color.red, color.green, color.blue, 0.7),
      700: Color.fromRGBO(color.red, color.green, color.blue, 0.8),
      800: Color.fromRGBO(color.red, color.green, color.blue, 0.9),
      900: Color.fromRGBO(color.red, color.green, color.blue, 1.0),
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: generateMaterialColorFromColor(Color(0xFFc57037))),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
