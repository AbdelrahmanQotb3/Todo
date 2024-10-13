import 'package:flutter/material.dart';
import 'package:todo_cashing/ui/screens/Home/Home.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child : Image.asset("assets/images/Splash.png"),
      ),
    );
  }
}
