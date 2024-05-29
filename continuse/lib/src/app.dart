import 'package:continuse_2/src/config/color/appcolor.dart';
import 'package:continuse_2/src/features/loginscreen/presentation/login_screen.dart';
import 'package:continuse_2/src/features/splashscreen/presentation/splashscreen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        duration: 3,
        navigateAfterSeconds: const LoginScreen(),
        image: Image.asset("assets/applogo.png"),
        backgroundColor: AppColors.backgroundcolor,
        loaderColor: AppColors.backgroundcolor,
      ),
    );
  }
}
