// fluid_nav_bar.dart
import 'package:flutter/material.dart';

class FluidNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FluidNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<FluidNavBar> createState() => _FluidNavBarState();
}

class _FluidNavBarState extends State<FluidNavBar> with SingleTickerProviderStateMixin {
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

  @override
  void didUpdateWidget(covariant FluidNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0D1B2A),
          borderRadius: BorderRadius.circular(50),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double itemWidth = constraints.maxWidth / _navItems.length;
            double circleLeft = itemWidth * widget.currentIndex + itemWidth / 2 - 30;

            return Stack(
              clipBehavior: Clip.none,
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
                      child: Center(
                        child: Icon(
                          _navItems[widget.currentIndex],
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_navItems.length, (index) {
                    return GestureDetector(
                      onTap: () => widget.onTap(index),
                      child: SizedBox(
                        width: itemWidth,
                        height: 70,
                        child: Center(
                          child: Icon(
                            _navItems[index],
                            color: widget.currentIndex == index ? Colors.transparent : Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
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
