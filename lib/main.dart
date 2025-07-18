import 'package:cosmo_futsal/features/auth/Login/bloc/login_bloc.dart';
import 'package:cosmo_futsal/features/splash_screen/screen/splash_screen.dart';
import 'package:cosmo_futsal/core/di/injectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await diSetUp() ;

  runApp(const GoalPostApp());
}

class GoalPostApp extends StatelessWidget {
  const GoalPostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
