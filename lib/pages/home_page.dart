import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<IconData> _navItems = [
    Icons.home,
    Icons.chat_bubble_outline,
    Icons.notifications_none,
    Icons.person_outline,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeOutBack))
        .animate(_controller);
    _controller.forward();
  }

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      bottomNavigationBar: _fluidNavBar(_navItems),
    );
  }

  Widget _fluidNavBar(List<IconData> items) {
    return BottomAppBar(
      color: const Color(0xFF0D1B2A),
      child: SizedBox(
        height: 70,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double itemWidth = constraints.maxWidth / items.length;
            double circleLeft = itemWidth * _currentIndex + itemWidth / 2 - 25;

            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutBack,
                  left: circleLeft,
                  top: 10,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(items.length, (index) {
                    return IconButton(
                      icon: Icon(
                        items[index],
                        color: _currentIndex == index ? Colors.black : Colors.white,
                      ),
                      onPressed: () => _onItemTapped(index),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
