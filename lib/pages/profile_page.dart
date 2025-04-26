//profile_page.dart
import 'package:flutter/material.dart';
import '/widgets/fluid_nav_bar.dart'; // Make sure you import your custom navbar

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool pushNotification = true;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Engr. Ohb L. Batumbakal',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Professional Civil Engineer',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    infoTile(Icons.phone, '+63 987-654-3210'),
                    const SizedBox(height: 10),
                    infoTile(Icons.email, 'engrkIbo@sample.com'),
                    const SizedBox(height: 30),
                    buildToggle("Push notification", pushNotification, (val) {
                      setState(() => pushNotification = val);
                    }),
                    const SizedBox(height: 10),
                    buildToggle("Dark Mode", darkMode, (val) {
                      setState(() => darkMode = val);
                    }),
                    const SizedBox(height: 30),
                    actionTile('Register as Admin', Colors.white),
                    const SizedBox(height: 10),
                    actionTile('Logout', Colors.redAccent),
                    const SizedBox(height: 80), // To make space for navbar
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FluidNavBar(
                currentIndex: 3,
                onTap: (index) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToggle(String title, bool value, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const Spacer(),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.orange,
          )
        ],
      ),
    );
  }

  Widget infoTile(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
          const Icon(Icons.edit, color: Colors.white54),
        ],
      ),
    );
  }

  Widget actionTile(String text, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
