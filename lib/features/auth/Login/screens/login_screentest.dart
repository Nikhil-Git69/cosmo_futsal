import 'package:cosmo_futsal/constants/app_colors.dart';
import 'package:cosmo_futsal/constants/app_textstyles.dart';
import 'package:cosmo_futsal/constants/paddings.dart';
import 'package:cosmo_futsal/core/common/buttons/cust_button.dart';
import 'package:cosmo_futsal/core/common/buttons/secondary_button.dart';
import 'package:cosmo_futsal/core/common/fields/cust_textfields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 80),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    'assets/flat_icons/football.png',
                    height: 75,
                  ),
                ),
              ),

              Text("GoalPost", style: AppTextStyles.headerBlack),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.Primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: AppPaddings.left20top10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "Email", style: AppTextStyles.fieldlabel),
                    ),
                  ),
                CustomTextField(controller: EmailController),
                  Padding(
                    padding: AppPaddings.left20top10,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "Password", style: AppTextStyles.fieldlabel),
                    ),
                  ),
                CustomTextField(controller: PasswordController, isPassword: true,),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            activeColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),

                          Text("Remember me",
                              style: AppTextStyles.fieldlabel),
                        ],
                      ),


                      Padding(
                        padding: EdgeInsets.only(left: 130),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Text("Forgot Password?",
                              style: AppTextStyles.fieldlabel),
                        ),
                      ),
                    ],
                  ),

                  CustButton(text: 'Login', onPressed: (){},
                  backgroundColor: Colors.white),
                  SizedBox(height: 8),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(indent: 20, endIndent: 20)),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                          child: Divider(indent: 20, endIndent: 20)),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Center(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      label: Text("Sign In with Google", style: AppTextStyles.fieldlabel,),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 24),
                      ),
                    ),
                  ),

                  SizedBox(height: 50,),
                  Row(
                    children: [
                      SizedBox(width: 80),
                      Text("Don't have an account?", style: AppTextStyles.subTextWhite,),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Text("Sign Up",
                            style: AppTextStyles.subTextUnderline),
                      ),
                    ],
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
