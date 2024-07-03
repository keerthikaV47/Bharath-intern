import 'package:flutter/material.dart';
import 'package:test/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['learn python', false],
    ['learn java', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EBD5),
      appBar: AppBar(
        title: Center(child: const Text("To do list")),
        backgroundColor: Color(0xFF262851),
        foregroundColor: Color(0xFFF4EBD5),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Add more task",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0xFF262851),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFF4EBD5)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFF4EBD5)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                style: TextStyle(
                    color:
                        Colors.white), // This line sets the text color to white
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xFF262851),
            onPressed: saveNewTask,
            child: const Icon(
              Icons.add,
              color: Color(0xFFF4EBD5),
            ),
          ),
        ],
      ),
    );
  }
}
