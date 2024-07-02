import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:taskly/Task.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _devheigt, _devwid;
  String? taskContent;
  Box? box;
  @override
  void initState() {
    super.initState();
    // Initialize the box in initState
    _initBox();
  }

  Future<void> _initBox() async {
    try {
      box = await Hive.openBox('tasks');
    } catch (e) {
      print('Error opening box: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _devheigt = MediaQuery.of(context).size.height;
    _devwid = MediaQuery.of(context).size.width;
    //print("value== $taskContent");

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _devheigt * 0.15,
        title: const Text(
          'Tasky __ !!',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 39,
          ),
        ),
      ),
      body: taskView(),
      floatingActionButton: buttonDilog(),
    );
  }

  Widget myList() {
    // Check if box is null before accessing its values
    if (box == null) {
      return const Center(
        child: Text('Error: Box is null'),
      );
    }
    List tasks = box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        var task = Task.fromMap(tasks[index]);
        return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
                decoration: task.done ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(task.timestamp.toString()),
          trailing: Icon(
            task.done
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank,
            color: Colors.red,
          ),
          onTap: () {
            task.done = !task.done;
            box!.putAt((index), task.toMap());
            setState(() {});
          },
          onLongPress: () {
            box!.deleteAt(index);
            setState(() {});
          },
        );
      },
    );
  }

  Widget taskView() {
    return FutureBuilder(
        future: Hive.openBox('tasks'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return myList();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buttonDilog() {
    return FloatingActionButton(
      onPressed: addTask,
      backgroundColor: Colors.red,
      child: const Icon(
        Icons.add_task,
        color: Colors.white,
      ),
    );
  }

  void addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add new Task !"),
          content: TextField(
            onSubmitted: (_) {
              if (taskContent != null) {
                var task = Task(
                    content: taskContent!,
                    timestamp: DateTime.now(),
                    done: false);
                box!.add(task.toMap());
                setState(() {
                  taskContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (value) {
              setState(() {
                taskContent = value;
              });
            },
          ),
        );
      },
    );
  }
}
