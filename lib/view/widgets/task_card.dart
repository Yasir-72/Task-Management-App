import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String time;
  final String task;
  final List<String> assignees;

  const TaskCard({
    required this.time,
    required this.task,
    required this.assignees,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  double dragPosition = 0.0;

  void _showTaskCompletedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Task Completed"),
          content: Text("You have successfully completed the task!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Color(0xFFD95639),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
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
                  color: Colors.white.withOpacity(0.5)),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    widget.time,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.task,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: widget.assignees
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

            // Drag to complete the task
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Target Container
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 40), // Leave space for draggable icon
                          Text(
                            "Drag to mark done",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 28), // End Icon
                    ],
                  ),
                ),

                // Draggable Icon
                Positioned(
                  left: dragPosition,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        // Move the icon horizontally within bounds
                        dragPosition += details.delta.dx;
                        dragPosition = dragPosition.clamp(0.0, 240.0);
                      });
                    },
                    onHorizontalDragEnd: (details) {
                      if (dragPosition >= 240.0) {
                        // Task completed
                        _showTaskCompletedDialog();
                        setState(() {
                          dragPosition = 0.0; // Reset position
                        });
                      } else {
                        setState(() {
                          dragPosition = 0.0; // Reset position if incomplete
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFD95639),
                        ),
                        child: IconButton(
                          icon:
                              Icon(Icons.check, color: Colors.white, size: 25),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
