import 'package:cosmo_futsal/constants/app_textstyles.dart';
import 'package:cosmo_futsal/core/common/buttons/primary_button.dart';
import 'package:cosmo_futsal/core/common/buttons/secondary_button.dart';
import 'package:cosmo_futsal/features/auth/Login/screens/login_screen.dart';
import 'package:cosmo_futsal/features/auth/Login/screens/login_screentest.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingfirstScreen extends StatefulWidget {
  const OnboardingfirstScreen({super.key});

  @override
  State<OnboardingfirstScreen> createState() =>
      _OnboardingfirstScreen();
}

class _OnboardingfirstScreen
    extends State<OnboardingfirstScreen> {
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/images/futsal_ground4.jpeg',
    'assets/images/futsal_ground7.jpeg',
    'assets/images/futsal_ground5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CarouselSlider(
            items: imagePaths
                .map(
                  (path) => SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  path,
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.35 + 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagePaths.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 12 : 8,
                  height: _currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.white : Colors.white54,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Book,',
                          style:  AppTextStyles.OnboardBlack,
                        ),
                         TextSpan(
                          text: " Play,",
                          style: AppTextStyles.OnboardBlack,
                        ),
                        TextSpan(
                          text: ' Repeat!',
                          style: AppTextStyles.OnboardGreen,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text("Play smarter with Goal Post — explore courts, organize matches, and connect with players nearby."),
                  SizedBox(
                   child: PrimaryButton(text: "Get Started", onPressed: (){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                   }),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
