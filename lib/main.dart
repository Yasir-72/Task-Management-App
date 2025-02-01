import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_managment_app/firebase_options.dart';
import 'package:task_managment_app/view/screens/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        checkboxTheme: CheckboxThemeData(
            checkColor: MaterialStateProperty.all(Color(0xFFD95639)),
            fillColor: MaterialStateProperty.all(Color(0xFFD95639))),
        primaryColor: Color(0xFFD95639), // Header background color
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Color(0xFFD95639), // Button text color
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Color(0xFFD95639), // **Header background color**
          onPrimary: Colors.white, // **Header text color**
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      home: LoginPage(),
    );
  }
}
