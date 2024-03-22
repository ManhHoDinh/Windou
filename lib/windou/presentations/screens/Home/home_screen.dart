import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/helper/AuthFunctions.dart';
import '../account/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = 'home_screen';
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body:  Center(
        child: GestureDetector(
          onTap: () {
            FirebaseAuth.instance.signOut();
                  AuthServices.CurrentUser = null;
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
          },
          child: Text('Go to Login Screen'),
        )
      ),
    );
  }
}