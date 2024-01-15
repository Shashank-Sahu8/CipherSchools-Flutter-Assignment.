import 'package:cipherx/Authentications/Signup.dart';
import 'package:cipherx/Pages/Home.dart';
import 'package:cipherx/Pages/bottom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class islogein extends StatelessWidget {
  const islogein({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            return bottom_navigator();
          } else {
            return sign_up();
          }
        },
      ),
    );
  }
}
