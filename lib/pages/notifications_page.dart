import 'package:flutter/material.dart';
import '../widgets/fluid_nav_bar.dart';
import 'home_page.dart';
import 'messages_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _currentIndex = 2;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);

    // Navigate to the correct page
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MessagesPage()),
        );
        break;
      case 2:
        // Already on NotificationsPage, no need to navigate
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1D1D),
      bottomNavigationBar: FluidNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    _buildNotificationTile(
                        'Client 001',
                        'Updated project details to extend duration.',
                        'assets/profile1.jpg',
                        '18m'),
                    _buildNotificationTile(
                        'Architect 001',
                        'Blueprints for the new project sent!\nSet a meeting with the client this afternoon.',
                        'assets/profile2.jpg',
                        '4h'),
                    _buildNotificationTile(
                        'Client 002',
                        'Requested a meeting tomorrow morning at 8 am.',
                        'assets/profile3.jpg',
                        '4h'),
                    _buildNotificationTile(
                        'Architect 1',
                        'Updated blueprint changes.',
                        'assets/profile4.jpg',
                        '5h'),
                    _buildNotificationTile(
                        'Architect 1',
                        'Removed blueprint from the project.',
                        'assets/profile4.jpg',
                        '5h'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(String name, String message, String imagePath, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade300, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 4),
                Text(message, style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
