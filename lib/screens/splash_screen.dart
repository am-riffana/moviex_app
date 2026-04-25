import 'package:flutter/material.dart';
import 'package:movieapp/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  LoginScreen()
        )
       );
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 0, 0),
      body: Center(
        child: Image.asset("assets/movie.png",height: 300,),


      ),
    );
  }
}