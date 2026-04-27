import 'package:flutter/material.dart';
import 'package:movieapp/screens/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox("favorites");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,),
      home:SplashScreen() ,
    );
  }
}