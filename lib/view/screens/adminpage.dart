import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Map<String, String>> _teamMembers = [
    {'name': 'You', 'role': 'Designer'},
    {'name': 'Colin', 'role': 'Designer'},
    {'name': 'Max', 'role': 'Manager'},
    {'name': 'Ali', 'role': 'Manager'},
    {'name': 'Yasir', 'role': 'Manager'},
    {'name': 'Hasan', 'role': 'Manager'},
    {'name': 'Zaid', 'role': 'Manager'},
    {'name': 'Raza', 'role': 'Manager'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Task Name",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _taskNameController,
              decoration: _textfield("Enter Task"),
            ),
            const SizedBox(height: 15),
            const Text(
              "Description",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descriptionController,
              decoration: _textfield("Enter some text"),
            ),
            const SizedBox(height: 15),

            // team member section

            const Text(
              "Team Members",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150, // Adjust height for avatar and text
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _teamMembers.length,
                itemBuilder: (context, index) {
                  final member = _teamMembers[index];
                  return _buildMemberCard(member);
                },
              ),
            ),

            // details section
            Center(
              child: const Text(
                "Details",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                DetailCards("12:00 AM", "12 March 2023"),
                DetailCards("12:00 AM", "12 March 2023"),
              ],
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 14),
                  backgroundColor: Color(0xFFD95639)),
              child: Text(
                "Create Task",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _textfield(String hint) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      fillColor: Colors.grey[200],
      filled: true,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildMemberCard(Map<String, String> member) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("images/man.png"),
          ),
          const SizedBox(height: 5),
          Text(
            member['name']!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            member['role']!,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

Widget DetailCards(String time, String date) {
  return SizedBox(
    height: 175, // Adjust size if needed
    width: 175,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.grey[200],
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFD95639)),
              child: IconButton(
                icon: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Spacer(),
            Text(
              time,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(date,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                )),
          ],
        ),
      ),
    ),
  );
}
