import 'package:flutter/material.dart';
import 'package:task_managment_app/view/screens/adminpage.dart';
import 'package:task_managment_app/view/screens/homepage.dart';
import 'package:task_managment_app/view/screens/userpage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const UserPage(),
    const AdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? _buildActiveIcon(Icons.home, "Home")
                  : const Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? _buildActiveIcon(Icons.person, "Employee")
                  : const Icon(Icons.person),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? _buildActiveIcon(Icons.settings, "Setting")
                  : const Icon(Icons.settings),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveIcon(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}