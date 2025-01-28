import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:task_managment_app/view/widgets/header.dart';
import 'package:task_managment_app/view/widgets/tabs.dart';
import 'package:task_managment_app/view/widgets/task_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int selectedIndex = 0; // Tracks selected tab index
  final List<String> tabs = ["All", "Today's tasks", "Weekly tasks"];

  // Dummy task data
  final List<Map<String, dynamic>> tasks = [
    {
      'time': '04:00 PM',
      'task': 'Make a dribble shot for Hyperactive',
      'assignees': [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/200',
      ],
    },
    {
      'time': '05:00 PM',
      'task': 'Review design mockups',
      'assignees': [
        'https://via.placeholder.com/150',
      ],
    },
    {
      'time': '03:30 PM',
      'task': 'Team meeting on app design updates Team meeting on app design updates Team meeting on app design updates Team meeting on app design updates',
      'assignees': [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/200',
        'https://via.placeholder.com/250',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header widget
              HeaderWidget(
                role: "Employee",
                userName: "Kris",
                avatarUrl: "images/man.png", // Adjust the path to your asset
              ),
              SizedBox(height: 35),
              // Greeting text
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hi Kris,",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD95639),
                      ),
                    ),
                    TextSpan(
                      text: " nice to \nsee you!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Tabs widget
              TabsWidget(
                tabs: tabs,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 20),
              // Task cards with CardSwiper
              Container(
                height: 350,
                width: 400,
                child: CardSwiper(
                  cardsCount: tasks.length,
                  numberOfCardsDisplayed: 3,
                  cardBuilder: (context, index, direction, offset) {
                    final task = tasks[index];
                    return TaskCard(
                      time: task['time'],
                      task: task['task'],
                      assignees: task['assignees'],
                    );
                  },
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  onSwipe: (index, previousIndex, direction) {
                    String swipeDirection;
                    if (direction == CardSwiperDirection.left) {
                      swipeDirection = "left";
                    } else if (direction == CardSwiperDirection.right) {
                      swipeDirection = "right";
                    } else if (direction == CardSwiperDirection.top) {
                      swipeDirection = "top";
                    } else if (direction == CardSwiperDirection.bottom) {
                      swipeDirection = "bottom";
                    } else {
                      swipeDirection = "unknown";
                    }
                    print('Swiped task $index to the $swipeDirection');
                    return true; 
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
