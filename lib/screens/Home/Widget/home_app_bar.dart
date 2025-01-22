import 'package:ecom_mcp/screens/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:ecom_mcp/screens/Notification/notification.dart';
import 'package:ecom_mcp/constants.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("images/profilepic.jpg"),
          ),
        ),
        SizedBox(width: 10),
        // Title Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jan 21, 2025",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Row(
              children: const [
                Text(
                  'Hello, ',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  'Olana',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: kprimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Notification Icon Button
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: kcontentColor, // Ensure this constant is defined
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage(),),);
            },
            iconSize: 30,
            icon: const Icon(Icons.notifications_outlined),
          ),
        ),
      ],
    );
  }
}
