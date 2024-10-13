import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cashing/ui/providers/list_provider.dart';
import 'package:todo_cashing/ui/screens/Home/Home.dart';
import 'package:todo_cashing/ui/screens/Splash/splash_screen.dart';
import 'package:todo_cashing/ui/screens/auth/login/login.dart';
import 'package:todo_cashing/ui/screens/auth/register/register.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBkPtFcNmgXm-TtG9YWS_zwDUjV3oICe2M",
          appId: "todocashing",
          messagingSenderId: "todocashing",
          projectId: "todocashing"
      )
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (_) => ListProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO-DO",
      // theme: AppTheme.LightTheme,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.LightTheme,
      routes: {
        Home.routeName: (_) => Home(),
        SplashScreen.routeName : (_) => SplashScreen(),
        Login.routeName : (_) => Login(),
        Register.routeName : (_) => Register()
      },
      initialRoute: Register.routeName,
    );
  }
}
