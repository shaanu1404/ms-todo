import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final int count;
  final Color iconColor;

  const MenuItem({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.count,
    this.iconColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      trailing: Text(
        count.toString(),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }
}
