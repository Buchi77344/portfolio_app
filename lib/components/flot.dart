import 'package:flutter/material.dart';

class FloatingBounceButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const FloatingBounceButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<FloatingBounceButton> createState() => _FloatingBounceButtonState();
}

class _FloatingBounceButtonState extends State<FloatingBounceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // move vertically (Y-axis)
    _animation = Tween<double>(begin: -4, end: 4).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value), // vertical movement
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                backgroundColor: const Color.fromARGB(255, 26, 102, 164),
              ),
              onPressed: widget.onPressed,
              child: const Icon(Icons.add, size: 60, color: Colors.white,),
            ),
          ),
        );
      },
    );
  }
}
