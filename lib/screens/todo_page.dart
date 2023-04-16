import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  static const routeName = '/to-do';
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Task> _tasks = [];
  List<String> _hourlyTasks = ["Drink water", "Take a break", "Stretch"];

  void _addTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTaskTitle = '';
          return AlertDialog(
            title: const Text("Add New Task"),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Task Title",
              ),
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text("ADD"),
                onPressed: () {
                  setState(() {
                    _tasks.add(Task(title: newTaskTitle));
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _toggleTask(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Hourly Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _hourlyTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _hourlyTasks[index],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(_tasks[index].title),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      // We don't want to remove hourly tasks
                      if (!_hourlyTasks.contains(_tasks[index].title)) {
                        setState(() {
                          _tasks.removeAt(index);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Cannot delete hourly tasks")));
                      }
                    },
                    child: CheckboxListTile(
                      title: Text(_tasks[index].title),
                      value: _tasks[index].isCompleted,
                      onChanged: (value) {
                        _toggleTask(_tasks[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.blueGrey[700],
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}
