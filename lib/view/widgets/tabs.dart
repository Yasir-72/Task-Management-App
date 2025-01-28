import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabChange;

  const TabsWidget({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(tabs.length, (index) {
        return GestureDetector(
          onTap: () => onTabChange(index),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? Color(0xFFD95639)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : Colors.black,fontSize: 16,
              ),
            ),
          ),
        );
      }),
    );
  }
}
