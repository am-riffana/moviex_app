import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

           CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage("assets/profile.jpeg"),
),

             

             SizedBox(height: 15),

            // 👤 NAME
            const Text(
              "Rifana",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

             SizedBox(height: 5),

             Text(
              "rifanasherin80@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

             SizedBox(height: 30),

            ListTile(
              leading:  Icon(Icons.person),
              title:  Text("Edit Profile"),
              trailing:  Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading:  Icon(Icons.settings),
              title:  Text("Settings"),
              trailing:  Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

            ListTile(
              leading:  Icon(Icons.info),
              title:  Text("About App"),
              trailing:  Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),

             Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  LoginScreen(),
                    ),
                  );
                },
                child:  Text(
                  "Logout",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}