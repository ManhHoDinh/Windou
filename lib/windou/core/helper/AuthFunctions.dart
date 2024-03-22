import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:windou/windou/core/models/user/user.dart';
import 'package:windou/windou/presentations/screens/Home/home_screen.dart';

import '../../presentations/widgets/dialog.dart';

class AuthServices {
  static UserModel? CurrentUser;
  static signUpUser(String password, String name, String email, String phoneNo,
      BuildContext buildContext) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String uid = userCredential.user!.uid;
      UserModel user = UserModel(
        Id: uid,
        Name: name,
        PhoneNumber: phoneNo,
        Email: email,
      );
      DocumentReference doc =
          FirebaseFirestore.instance.collection("Users").doc(uid);
      await doc
          .set(user.toJson())
          .whenComplete(() => showDialog(
              context: buildContext,
              builder: (context) {
                return DialogOverlay(
                  isSuccess: true,
                  task: 'Create User',
                );
              }))
          .whenComplete(() => Navigator.of(buildContext).pop());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(buildContext).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(buildContext).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      } else {
        ScaffoldMessenger.of(buildContext)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
  }

  static siginWithGoogle( BuildContext context) async {
    try {
          // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

      if (FirebaseAuth.instance.currentUser != null) {
        //await UpdateCurrentUser();
        await showDialog(
                context: context,
                builder: (context) {
                  return DialogOverlay(
                    isSuccess: true,
                    task: 'login',
                  );
                })
            .whenComplete(
                () => Navigator.of(context).pushNamed(HomeScreen.routeName));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //await UpdateCurrentUser();
      if (FirebaseAuth.instance.currentUser != null) {
        //await UpdateCurrentUser();
        await showDialog(
                context: context,
                builder: (context) {
                  return DialogOverlay(
                    isSuccess: true,
                    task: 'login',
                  );
                })
            .whenComplete(
                () => Navigator.of(context).pushNamed(HomeScreen.routeName));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static bool CurrentUserIsManager() {
    try {
      bool result = false;
      //if (AuthServices.CurrentUser!.Position == 'Manager') result = true;
      return result;
    } catch (e) {
      return false;
    }
  }

  static Future UpdateCurrentUser() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      AuthServices.CurrentUser = UserModel(
        Id: value['Id'],
        Name: value['Name'],
        PhoneNumber: value['PhoneNumber'],
        Email: value['Email'],
      );
    });
  }
}
