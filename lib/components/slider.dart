import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TaskSlider extends StatefulWidget {
  const TaskSlider({super.key});

  @override
  State<TaskSlider> createState() => _TaskSliderState();
}

class _TaskSliderState extends State<TaskSlider> {
  final PageController _controller = PageController(viewportFraction: 0.82);

  final List<String> _animations = [
    "lottie/task4.json",
    "lottie/task2.json",
    "lottie/task3.json",
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 3, 29, 52),
            Color.fromARGB(255, 2, 18, 24),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- Carousel ---
          SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.45,
            child: PageView.builder(
              controller: _controller,
              itemCount: _animations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Lottie.asset(
                        _animations[index],
                        fit: BoxFit.contain,
                        repeat: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // --- Horizontal Dot Indicator ---
          SmoothPageIndicator(
            controller: _controller,
            count: _animations.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 12,
              expansionFactor: 3,
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
