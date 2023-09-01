import 'package:flutter/material.dart';
import 'package:shopio/components/user.dart';
import 'package:shopio/model/category.dart';
import 'package:shopio/screen/categoryadd/categoryadd.dart';
import 'package:shopio/screen/categorylist/categorylist.dart';
import 'package:shopio/screen/homescreen/homescreen.dart';
import 'package:shopio/screen/productadd/productadd.dart';
import 'package:shopio/screen/productlist/productlist.dart';
import '../screen/onBordingScreen/onbordingscreen.dart';
import '../screen/signin/SIGN-IN_SCREEN.dart';
import '../screen/signup/signup.dart';
import '../screen/splashscreen/splashscreen.dart';

class AppRoute {
  static const splashscreen = '/';
  static const onboradingscreen = '/onbording';
  static const signinscreen = "/signinscreen";
  static const signupscreen = "/signupscreen";
  static const homescreen = "/homescreen";
  static const categorylist = "/categorylistscreen";
  static const categoryadd = "/categoryaddscreen";
  static const productlist = "/productlistscreen";
  static const productadd = "/productaddscreen";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case onboradingscreen:
        return MaterialPageRoute(builder: (context) => OnBordingScreen());
      case signinscreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );
      case signupscreen:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      // case homescreen:
      //   if(arguments is User){
      //     User user=arguments as User;
      //     return MaterialPageRoute(builder: (context) => HomeScreen(user),);
      //   }
      case homescreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case categorylist:
        return MaterialPageRoute(
          builder: (context) => CategoryList(),
        );

      case categoryadd:
        Category? category =
            settings.arguments != null ? settings.arguments as Category : null;

        return MaterialPageRoute(
          builder: (context) => CategoryAdd(
            category: category,
          ),
        );

      case productlist:
        return MaterialPageRoute(builder: (context) => ProductListScreen(),);

      case productadd:
        return MaterialPageRoute(builder: (context) => ProductAdd(),);
    }
  }
}
