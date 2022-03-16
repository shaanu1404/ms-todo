import 'package:flutter/material.dart';
import 'package:hello_cars/widgets/home/bottom_menu.dart';
import '../widgets/home/user_title_header.dart';
import '../widgets/menuitem.dart';
import '../widgets/home/bottom_navigation.dart';
import '../screens/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  showNewItemModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const BottomMenu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
        ],
        title: const UserTitleHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Divider(thickness: 1),
            MenuItem(
              title: "My Day",
              leadingIcon: Icons.calendar_month,
              count: 8,
              iconColor: Colors.red,
            ),
            MenuItem(
              title: "Important",
              leadingIcon: Icons.star_border,
              count: 4,
              iconColor: Color.fromARGB(255, 255, 141, 41),
            ),
            MenuItem(
              title: "Planned",
              leadingIcon: Icons.date_range,
              count: 12,
              iconColor: Colors.blue,
            ),
            MenuItem(
              title: "Flagged Email",
              leadingIcon: Icons.email_outlined,
              count: 3,
              iconColor: Colors.green,
            ),
            MenuItem(
              title: "Tasks",
              leadingIcon: Icons.home_outlined,
              count: 8,
              iconColor: Colors.grey,
            ),
            Divider(thickness: 1)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        onPressNewItem: () => showNewItemModal(context),
      ),
    );
  }
}
