import 'package:flutter/material.dart';
import 'package:ecom_mcp/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the default back button
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigates back
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black, // Adjust color as per your theme
                  ),
                ),
                const Text(
                  "Notifications",
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
      ),
      body: const Center(
        child: Text("Notification Page"),
      ),
    );
  }
}
