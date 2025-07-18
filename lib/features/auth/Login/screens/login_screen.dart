import 'dart:developer';
import 'package:cosmo_futsal/constants/app_colors.dart';
import 'package:cosmo_futsal/constants/app_textstyles.dart';
import 'package:cosmo_futsal/constants/paddings.dart';
import 'package:cosmo_futsal/core/common/buttons/primary_button.dart';
import 'package:cosmo_futsal/core/common/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosmo_futsal/features/auth/Login/bloc/login_bloc.dart';
import 'package:flutter/services.dart';
import 'package:cosmo_futsal/core/common/fields/cust_textfields.dart';
import 'package:cosmo_futsal/core/helpers/validation/form_Validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();


  bool rememberMe = false;

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
        } else if (state is UserLoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                state.errorModel.message ?? "Unknown error occurred")),
          );
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: AppPaddings.top60,
                        child: Image.asset('assets/flat_icons/football.png', height: 50),
                      ),

                      Text("GoalPost", style: AppTextStyles.headerBlack,),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: AppPaddings.left30top10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "Log in to your", style:AppTextStyles.headerBlack),
                  ),
                ),
                Padding(
                  padding: AppPaddings.left30,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Account", style: AppTextStyles.headerBlack),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Enter your email and password to log in",
                        style: AppTextStyles.blacksubheader),
                  ),
                ),
                Padding(
                  padding: AppPaddings.leftright30,
                  child: Container(
                    height: 480,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: AppPaddings.left20top10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                "Email or Username", style: AppTextStyles.greysubheader),
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.leftright20,
                          child: CustomTextField(
                            controller: EmailController,
                            validator: formValidators.validateUsername,
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.horizontal20,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                "Password", style: AppTextStyles.greysubheader),
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.leftright20,
                          child: CustomTextField(
                            controller: PasswordController,
                            isPassword: true,
                            validator: formValidators.validatePassword,
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: AppPaddings.horizontal10,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    activeColor: AppColors.Primary,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  Text("Remember me",
                                      style: AppTextStyles.blacksubheader),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: AppPaddings.horizontal20,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text("Forgot Password?",
                                    style: AppTextStyles.blacksubheader),
                              ),
                            ),
                          ],
                        ),

                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                    child: CircularProgressIndicator()),
                              );
                            }
                            return Row(
                              children: [
                                Padding(
                                  padding: AppPaddings.leftright20,
                                  child: SizedBox(
                                    width: 325,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!
                                            .validate()) {
                                          BlocProvider
                                              .of<LoginBloc>(context)
                                              .add(
                                            UserLoginEvent(formData: {
                                              'username': EmailController.text
                                                  .trim(),
                                              'password': PasswordController
                                                  .text.trim(),
                                            }),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        backgroundColor: AppColors
                                            .Primary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                      ),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: AppPaddings.right20,
                                //   child: SizedBox(
                                //     width: 50,
                                //     child: PrimaryButton(icon: Icon(Icons.fingerprint, color: Colors.white , size: 25,), onPressed: (){}),
                                //   ),
                                // ),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(indent: 20, endIndent: 20)),
                            Text(
                              "Or with",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                              ),
                            ),
                            Expanded(
                                child: Divider(indent: 20, endIndent: 20)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            label: Text("Sign In with Google", style: AppTextStyles.blacksubheader,),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 24),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(width: 80),
                            Text("Don't have an account?"),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Text("Sign Up",
                                  style: AppTextStyles.blacksubheader),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

