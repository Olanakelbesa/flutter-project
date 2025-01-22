import 'package:ecom_mcp/constants.dart';
import 'package:ecom_mcp/screens/LoginandSignUp/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signout extends StatelessWidget {
  const Signout({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate the user back to the login page
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (builder) => SignIn()), (route) => false);
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            
            onPressed: () {
              _signOut(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              foregroundColor: Colors.white,
              elevation: 5,
            ),
            child: const Text('Sign Out')),
      ),
    );
  }
}
