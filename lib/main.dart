import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vote_app/views/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/homepage', page: () => const HomePage()),
      ],
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 4),
          () {
        Get.off(
            () => const HomePage(),
          duration: const Duration(seconds: 4),
          curve: Curves.easeInOut,
          transition: Transition.fadeIn,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade600,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: -440, end: 0),
              builder: (context, val, widget) => Transform.translate(
                offset: Offset(0, val),
                child: Image.asset(
                  'assets/images/vote.png',
                  filterQuality: FilterQuality.high,
                  scale: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Voting app",
                  curve: Curves.easeInOut,
                  cursor: '',
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.arya(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

