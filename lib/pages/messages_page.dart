import 'package:flutter/material.dart';
import '../widgets/fluid_nav_bar.dart';
import 'home_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final List<Map<String, String>> chats = [
    {"name": "Foreman 001", "message": "tinakas yung mga bakal sa site", "time": "18m"},
    {"name": "Architect 011", "message": "I updated the blueprint and applied the reco...", "time": "45m"},
    {"name": "Client 001", "message": "Can you give me an update for the project?", "time": "5h"},
    {"name": "Client 003", "message": "I am interested on renovating our guest hou...", "time": "9h"},
    {"name": "Client 004", "message": "I need suggestions for building a new store", "time": "12h"},
    {"name": "Foreman 002", "message": "pagod na ko boss....nabuhos na lahat", "time": "12h"},
  ];

  int _currentIndex = 1;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return; // Don't navigate if already on this page
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsPage()),
        );
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
      backgroundColor: const Color(0xFF2E2E2E),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Chats", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(chats[index]["name"]!),
                    subtitle: Text(chats[index]["message"]!),
                    trailing: Text(chats[index]["time"]!, style: const TextStyle(color: Colors.grey)),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: FluidNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
