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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Task Name",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              ),
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
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _descriptionController,
              decoration: _textfield("Enter some text"),
            ),
            const SizedBox(height: 15),
            const Text(
              "Team Members",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),
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
