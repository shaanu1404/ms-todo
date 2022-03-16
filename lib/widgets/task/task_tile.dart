import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String value;
  final void Function()? onLongPress;
  final void Function()? onTap;
  final bool selected;

  const TaskTile({
    Key? key,
    required this.value,
    this.onLongPress,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: const Border(
        left: BorderSide(color: Colors.green, width: 4),
      ),
      title: Text(value, overflow: TextOverflow.ellipsis),
      onLongPress: onLongPress,
      selected: selected,
      onTap: onTap,
    );
  }
}
