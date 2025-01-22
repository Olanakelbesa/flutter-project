import 'package:ecom_mcp/constants.dart';
import 'package:ecom_mcp/screens/LoginandSignUp/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ecom_mcp/screens/nav_bar_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _pwdControl = TextEditingController();

  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo1.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                inputItem('Email...', false, _emailControl),
                SizedBox(height: 10),
                inputItem('Password...', true, _pwdControl),
                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    setState(() {
                      circular = true;
                    });
                    try {
                      await firebaseAuth.signInWithEmailAndPassword(
                        email: _emailControl.text,
                        password: _pwdControl.text,
                      );
                      print(_emailControl.text);
                      print(_pwdControl.text);
                      setState(() {
                        circular = false;
                      });
                      Navigator.pushAndRemoveUntil(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                              builder: (builder) => BottomNavBar()),
                          (route) => false);
                      // print(userCredential.user?.email);
                    } catch (e) {
                      // Handle sign-up errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                      print(e.toString());
                      setState(() {
                        circular = false;
                      });
                      print(e.toString());
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: circular
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buttonItem(
                  'images/google_icon.png',
                  'Continue with Google',
                ),
                SizedBox(
                  height: 10,
                ),
                buttonItem(
                  'images/telephone.png',
                  'Continue with Phone Number',
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (builder) => SignUp()),
                            (route) => false);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: kprimaryColor),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: kprimaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for standard text input
Widget inputItem(
    String itemHintText, bool isPassword, TextEditingController conttoller) {
  return TextField(
    controller: conttoller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: itemHintText,
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: kprimaryColor,
          width: 2,
        ),
      ),
    ),
  );
}

Widget buttonItem(
  String itemsImage,
  String itemsText,
) {
  return InkWell(
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 198, 198, 198),
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(itemsImage, width: 20, height: 20),
          SizedBox(width: 10),
          Text(
            itemsText,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
