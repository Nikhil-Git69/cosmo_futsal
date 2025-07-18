import 'package:cosmo_futsal/features/onboarding/screens/onboarding_screen.dart';
import 'package:cosmo_futsal/features/onboarding/screens/onboarding_screentest2.dart';
import 'package:cosmo_futsal/features/onboarding/screens/onboarding_screentest.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> OnboardingfirstScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[

          SizedBox(height: 300),

          Center(
            child: Text("GoalPost",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
          )



        ],
      ),
    );
  }
}
