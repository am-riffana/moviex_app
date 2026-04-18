import 'package:flutter/material.dart';
import 'package:movieapp/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final email=TextEditingController();
  final pass=TextEditingController();

  void chechklogin(){
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (_)=>HomeScreen()));  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 0, 0, 0),const Color.fromARGB(255, 161, 0, 0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        ),
         child: Center(
          child: Padding(
            padding:  EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 Icon(
                  Icons.movie_sharp,
                  size: 90,
                  color: Colors.white,
                ),

                 SizedBox(height: 15),

                 Text(
                  "Welcome ",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                 SizedBox(height: 25),

                TextField(
                  controller: email,
                  style:  TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon:  Icon(Icons.email, color: Colors.white),
                  ),
                ),

                 SizedBox(height: 25),
                 TextField(
                  controller: pass,
                  style:  TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon:  Icon(Icons.password, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: chechklogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),  
                    ),      
                    child:  Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );  
}
}