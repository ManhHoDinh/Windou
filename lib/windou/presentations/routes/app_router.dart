import 'package:flutter/material.dart';
import 'package:windou/windou/presentations/screens/Home/home_screen.dart';
import 'package:windou/windou/presentations/screens/Home/navigation_home.dart';
import 'package:windou/windou/presentations/screens/account/login_screen.dart';
import 'package:windou/windou/presentations/screens/account/onboarding.dart';
import 'package:windou/windou/presentations/screens/account/signUp_screen.dart';
import 'package:windou/windou/presentations/screens/splash/splash_screen.dart';
import 'package:windou/windou/presentations/screens/transaction/transaction_screen.dart';

import '../screens/detect/choose_image_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName : (context) => LoginScreen(),
  SplashScreen.routeName : (context) => SplashScreen(),
  Onboarding.routeName  : (context) => Onboarding(),  
  SignUpScreen.routeName : (context) => SignUpScreen(),
  NavigationHome.routeName  : (context) => NavigationHome(),
  ChooseImageScreen.routeName  : (context) => ChooseImageScreen(),
  
};
