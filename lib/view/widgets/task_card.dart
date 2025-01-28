import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String time;
  final String task;
  final List<String> assignees;

  const TaskCard(
      {required this.time, required this.task, required this.assignees});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFD95639),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 135,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white.withOpacity(0.4)),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    time,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              task,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: assignees
                  .map((avatar) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(avatar),
                        ),
                      ))
                  .toList(),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white.withOpacity(0.4),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon:
                          Icon(Icons.check, color: Color(0xFFD95639), size: 25),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Drag to mark done",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
