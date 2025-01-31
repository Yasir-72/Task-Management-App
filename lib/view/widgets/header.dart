import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeaderWidget extends StatelessWidget {
  final String role;
  final String userName;
  final String avatarUrl;

  const HeaderWidget(
      {required this.role, required this.userName, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Color(0xFFD95639),
          ),
          child: Row(
            children: [
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  icon: Icon(Icons.person, color: Color(0xFFD95639), size: 30),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                role,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.notification_add,
                color: Color(0xFFD95639),
                size: 35,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(avatarUrl),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
