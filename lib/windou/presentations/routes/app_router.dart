import 'package:flutter/material.dart';
import 'package:windou/windou/presentations/screens/Home/home_screen.dart';
import 'package:windou/windou/presentations/screens/account/login_screen.dart';
import 'package:windou/windou/presentations/screens/account/onboarding.dart';
import 'package:windou/windou/presentations/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginScreen.routeName : (context) => LoginScreen(),
  SplashScreen.routeName : (context) => SplashScreen(),
  Onboarding.routeName  : (context) => Onboarding(),  
};