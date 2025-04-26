import 'package:flutter/material.dart';
import '../widgets/fluid_nav_bar.dart'; 
import 'messages_page.dart';
import 'notifications_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    if (index == _currentIndex) return; // Don't navigate if already on this page
    setState(() => _currentIndex = index);

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

  Widget _buildTaskCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 8, backgroundColor: Colors.white),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("Rank & File",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("1", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(
                child: Text("Task in progress", style: TextStyle(color: Colors.white70)),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.check, size: 16, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 12),
          const Text("ainekills\nDeadline: September 12, 2025",
              style: TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(12),
      child: Text(title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("+ New Task", style: TextStyle(color: Colors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.check_box_outlined, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text("Mark as completed", style: TextStyle(color: Colors.grey.shade600)),
                      ],
                    )
                  ],
                ),
                _buildTaskCard(),
                const SizedBox(height: 24),
                const Text("Projects", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 6),
                const Text("+ New Project", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                _buildProjectCard("Project 1", 'assets/project1.jpg'),
                _buildProjectCard("Project 2", 'assets/project2.jpg'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FluidNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
