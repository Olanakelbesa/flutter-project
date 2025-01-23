import 'package:ecom_mcp/constants.dart';
import 'package:ecom_mcp/screens/LoginandSignUp/signin.dart';
import 'package:ecom_mcp/service/Auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _pwdControl = TextEditingController();

  bool circular = false;

  AuthClass authClass = AuthClass();

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
                      await firebaseAuth.createUserWithEmailAndPassword(
                        email: _emailControl.text,
                        password: _pwdControl.text,
                      );
                      setState(() {
                        circular = false;
                      });
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignIn()),
                        (route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                      setState(() {
                        circular = false;
                      });
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
                              'Sign Up',
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
                  () async {
                    await authClass.googleSignIn(context);
                  },
                ),
                SizedBox(height: 10),
                buttonItem(
                  'images/telephone.png',
                  'Continue with Phone Number',
                  () {},
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => SignIn()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: kprimaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputItem(
    String itemHintText, bool isPassword, TextEditingController controller) {
  return TextField(
    controller: controller,
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

Widget buttonItem(String itemsImage, String itemsText, Function onTap) {
  return InkWell(
    onTap: () => onTap(),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromARGB(255, 198, 198, 198),
          width: 1,
        ),
      ),
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
