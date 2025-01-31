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

  Set<int> _selectedIndexes = {}; // Store selected indexes
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLabel("Task Name"),
            _buildTextField(_taskNameController, "Enter Task"),
            _buildLabel("Description"),
            _buildTextField(_descriptionController, "Enter some text"),
            _buildLabel("Team Members"),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _teamMembers.length,
                itemBuilder: (context, index) => _buildMemberCard(index),
              ),
            ),
            _buildLabel("Details"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailCards(
                  _startDate == null
                      ? "Start Date"
                      : "${_startDate!.toLocal()}".split(' ')[0],
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedStartDate = await showDatePicker(
                        context: context,
                        initialDate: _startDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(3000),
                      );
                      if (pickedStartDate != null) {
                        setState(() {
                          _startDate = pickedStartDate;
                          _endDate = _startDate!.add(const Duration(days: 1));
                        });
                      }
                    },
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                DetailCards(
                  _endDate == null
                      ? "End Date"
                      : "${_endDate!.toLocal()}".split(' ')[0],
                  GestureDetector(
                    onTap: () async {
                      if (_startDate == null) return;
                      DateTime? pickedEndDate = await showDatePicker(
                        context: context,
                        initialDate: _endDate ??
                            _startDate!.add(const Duration(days: 1)),
                        firstDate: _startDate!.add(const Duration(days: 1)),
                        lastDate: DateTime(3000),
                      );
                      if (pickedEndDate != null) {
                        setState(() {
                          _endDate = pickedEndDate;
                        });
                      }
                    },
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 12),
                  backgroundColor: const Color(0xFFD95639)),
              child: const Text(
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

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildMemberCard(int index) {
    final member = _teamMembers[index];
    bool isSelected = _selectedIndexes.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedIndexes.remove(index);
          } else {
            _selectedIndexes.add(index);
          }
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: const AssetImage("images/man.png"),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  member['name']!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  member['role']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndexes.remove(index);
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget DetailCards(String value, Widget icon) {
  return SizedBox(
    height: 120,
    width: 175,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.grey[200],
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD95639),
              ),
              child: IconButton(
                icon: icon,
                onPressed: () {},
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
