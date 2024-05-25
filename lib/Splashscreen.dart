import 'dart:async';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ymca_all_in_one/Index.dart';
import 'Authentication/Phone.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    Timer(const Duration(seconds: 4), () async {
      final prefs = await SharedPreferences.getInstance();
      final bool? repeat = prefs.getBool('repeat');
      if (repeat == true) {
        if(mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const Index()));
        }

      } else {
        if(mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Phone()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _animation,
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Colors.transparent,
            //           Colors.transparent,
            //         ],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //         stops: [0.1, 0.9],
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.menu_book_sharp, size: 80,color: Colors.lightBlue,),
                  const SizedBox(height: 16),
                   Text(
                    "ResourceHub",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
