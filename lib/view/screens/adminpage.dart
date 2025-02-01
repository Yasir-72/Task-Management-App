import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

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
  TimeOfDay? _selectedTime;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLabel("Task Name"),
              SizedBox(
                height: 8,
              ),
              _buildTextField(_taskNameController, "Enter Task"),
              _buildLabel("Description"),
              SizedBox(
                height: 8,
              ),
              _buildTextField(_descriptionController, "Enter some text"),
              _buildLabel("Team Members"),
              SizedBox(
                height: 8,
              ),
              _buildMemberDropdown(),
              _buildLabel("Details"),
              Wrap(
                alignment: WrapAlignment.center,
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
                            _endDate = _startDate!
                                .add(const Duration(microseconds: 1));
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
                              _startDate!.add(const Duration(microseconds: 0)),
                          firstDate:
                              _startDate!.add(const Duration(microseconds: 0)),
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
                  DetailCards(
                    _selectedTime == null
                        ? "Select Time"
                        : _selectedTime!.format(context),
                    GestureDetector(
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null && pickedTime != _selectedTime) {
                          setState(() {
                            _selectedTime = pickedTime;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 14),
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

  Widget _buildMemberDropdown() {
    // Convert the _teamMembers list to a list of MultiSelectItems.
    final items = _teamMembers
        .map((member) => MultiSelectItem<Map<String, String>>(
              member,
              "${member['name']} (${member['role']})",
            ))
        .toList();

    return MultiSelectDialogField<Map<String, String>>(
      items: items,
      selectedColor: Color(0xFFD95639),
      listType: MultiSelectListType.LIST,
      title: const Text("Team Members"),
      buttonText: const Text("Select Team Members"),
      initialValue:
          _selectedIndexes.map((index) => _teamMembers[index]).toList(),
      onConfirm: (selectedList) {
        setState(() {
          // Update the set of selected indexes based on the chosen team members.
          _selectedIndexes = selectedList
              .map((member) => _teamMembers.indexOf(member))
              .toSet();
        });
      },
      decoration: BoxDecoration(
        padd
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.transparent),
      ),
    );
  }

  Widget DetailCards(String value, Widget icon) {
    return SizedBox(
      height: 130,
      width: 160,
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
}
