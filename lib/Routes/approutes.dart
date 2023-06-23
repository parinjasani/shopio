import 'package:flutter/material.dart';
import '../screen/onBordingScreen/onbordingscreen.dart';
import '../screen/signin/SIGN-IN_SCREEN.dart';
import '../screen/signup/signup.dart';
import '../screen/splashscreen/splashscreen.dart';
class AppRoute{
  static const splashscreen='/';
  static const onboradingscreen='/onbording';
  static const signinscreen="/signinscreen";
  static const signupscreen="/signupscreen";
  
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){
      case splashscreen:
      return MaterialPageRoute(builder: (context) => SplashScreen()
    );
      case onboradingscreen:
          return MaterialPageRoute(builder: (context) => OnBordingScreen());
      case signinscreen:
        return MaterialPageRoute(builder: (context) => SignInScreen(),);
      case signupscreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen(),);
    }
  }
}
