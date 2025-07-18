// import 'package:cosmo_futsal/constants/app_colors.dart';
// import 'package:cosmo_futsal/constants/paddings.dart';
// import 'package:cosmo_futsal/core/common/buttons/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:cosmo_futsal/constants/app_textstyles.dart';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cosmo_futsal/core/common/buttons/primary_button.dart';
// import 'package:cosmo_futsal/core/common/buttons/secondary_button.dart';
// import 'package:cosmo_futsal/features/onboarding/models/onboading_model.dart';
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//
//   int _currentIndex = 0;
//
//   final List<String> titles = [
//     'Find Futsal!',
//     'Book Instantly!',
//
//   ];
//
//   final List<OnboardingItem> onboardingItems = [
//     OnboardingItem(
//       title: "FIND FUTSAL",
//       subtitle: "Book Near You Instantly",
//       imagePath: 'assets/futsal_ground.jpeg',
//       buttonText: "Next",
//     ),
//     OnboardingItem(
//       title: "JOIN MATCHES",
//       subtitle: "Team Up With Friends",
//       imagePath: 'assets/futsal_ground2.jpeg',
//       buttonText: "Next",
//     ),
//
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Column(
//         children: [
//           SizedBox(height: 75,),
//
//           Center(
//             child: Container(
//               height: 75,
//               child: Image.asset('assets/football.png'),
//             ),
//           ),
//
//           Center(
//             child: Text("GoalPost", style: AppTextStyles.headerBlack),
//           ),
//
//           SizedBox(height: 60),
//
//           CarouselSlider(
//             items: onboardingItems.map((item) {
//               return Image.asset(item.imagePath, height: 250);
//                 }).toList(),
//             options: CarouselOptions(
//               height: 200,
//               enlargeCenterPage: false ,
//               autoPlay: false,
//               aspectRatio: 16 / 9,
//               viewportFraction: 1,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//             ),
//           ),
//
//           SizedBox(height: 30),
//           Text(
//             titles[_currentIndex],
//             style: AppTextStyles.headerBlack,
//           ),
//           SizedBox(height: 30),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(titles.length, (index) {
//               return AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.symmetric(horizontal: 4),
//                 width: _currentIndex == index ? 12 : 8,
//                 height: _currentIndex == index ? 12 : 8,
//                 decoration: BoxDecoration(
//                   color: _currentIndex == index ? Colors.grey[800] : Colors.grey[400],
//                   shape: BoxShape.circle,
//                 ),
//               );
//             }),
//           ),
//
//           SizedBox(height: 30),
//
//         Padding(
//           padding: AppPaddings.buttonsPadding,
//           child: PrimaryButton(text: "LogIn", onPressed: (){}),
//         ),
//
//           SizedBox(height: 20),
//
//           Padding(
//             padding: AppPaddings.buttonsPadding,
//             child: SecondaryButton(text: "Signup", onPressed: (){}),
//           ),
//
//           SizedBox(height: 20),
//
//           Text("Or Login using: ", style: AppTextStyles.greysubheader,),
//
//           SizedBox(height: 20),
//
//
//
//         ],
//       ),
//
//     );
//   }
// }
