import 'package:flutter/material.dart';
import 'package:hello_cars/widgets/task/task_tile.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _newTask = TextEditingController();

  List<Map<String, dynamic>> tasks = [
    {"value": "Learn Django", "selected": false},
    {"value": "Learn React Native", "selected": false}
  ];

  _addTaskHandler() {
    if (_newTask.text.trim() == "") return;
    setState(() {
      tasks.add({"value": _newTask.text, "selected": false});
    });
    _newTask.clear();
  }

  _handleDelete() {
    setState(() {
      tasks.removeWhere((element) => element["selected"] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (tasks.any((element) => element["selected"] == true))
            IconButton(
              onPressed: _handleDelete,
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _newTask,
                    decoration: InputDecoration(
                      label: const Text("Add new task"),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: _addTaskHandler,
                      icon: const Icon(Icons.add),
                      label: const Text("Add Task"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) => TaskTile(
                  value: tasks[index]["value"],
                  selected: tasks[index]["selected"],
                  onTap: () {
                    bool areSelected =
                        tasks.every((element) => element["selected"] == false);
                    if (!areSelected) {
                      setState(() {
                        tasks[index]["selected"] = !tasks[index]["selected"];
                      });
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      tasks[index]["selected"] = true;
                    });
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
