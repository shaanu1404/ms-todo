import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function() onPressNewItem;

  const BottomNavigation({
    Key? key,
    required this.onPressNewItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onPressNewItem,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add),
                SizedBox(width: 4),
                Text("New Item")
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.addchart_outlined,
            ),
            color: Colors.green,
            splashColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
