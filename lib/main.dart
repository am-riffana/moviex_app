import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movieapp/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();        // ✅ init hive
  await Hive.openBox("favorites"); // ✅ open box BEFORE app starts

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setTheme(BuildContext context, bool isDark) {
    _MyAppState? state =
        context.findAncestorStateOfType<_MyAppState>();
    state?.changeTheme(isDark);
  }
}

class _MyAppState extends State<MyApp> {
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool("isDark") ?? true;
    });
  }

  void changeTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDark", value);

    setState(() {
      isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: isDark ? ThemeData.dark() : ThemeData.light(),

      home: SplashScreen(),
    );
  }
}