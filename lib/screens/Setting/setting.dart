import 'package:ecom_mcp/screens/LoginandSignUp/signout.dart';
import 'package:ecom_mcp/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mcp/constants.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: kcontentColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the default back button
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => BottomNavBar()));
                  // Navigates back
                },
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black, // Adjust color as per your theme
                    ),
                  ),
                ),
              ),
              const Text(
                "Setting",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black, // Adjust color as per your theme
                ),
              ),
              const SizedBox(width: 40), // To balance the alignment
            ],
          ),
        ),
      ),
      body: const Center(
        child: Signout(),
      ),
    );
  }
}
