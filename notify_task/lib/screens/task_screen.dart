import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Taskly extends StatefulWidget {
  static String id = 'task screen';

  const Taskly({super.key});
  @override
  State<Taskly> createState() => _TasklyState();
}

class _TasklyState extends State<Taskly> {
  late double _devheigt, _devwid;
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  final TextEditingController txtfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _devheigt = MediaQuery.of(context).size.height;
    _devwid = MediaQuery.of(context).size.width;
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
      body: _buildBody(context), //taskView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context); // buttonDilog(),
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: users.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No tasks yet!'),
          );
        }

        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var user = snapshot.data!.docs[index];
              return ListTile(
                title: Text(user['name']),
                onTap: () {
                  // Implement update or delete functionality
                },
              );
            });
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Data'),
          content: TextField(
            controller: txtfield,
            decoration: InputDecoration(
              labelText: 'Enter Data',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String txtfile = txtfield.text;
                _addData(txtfile);

                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addData(String addTask) {
    try {
      // Get data from text field
      FirebaseFirestore.instance.collection('users').add({'name': addTask});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add task: $e'),
      ));
    }
  }
  // Widget buttonDilog() {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       addTask;
  //     },
  //     backgroundColor: Colors.red,
  //     child: const Icon(
  //       Icons.add_task,
  //       color: Colors.white,
  //     ),
  //   );
  // }

  // void addTask(Todo todoTask) => FirebaseApi.createTodo(todoTask);

  // Widget myList(List<DocumentSnapshot> todoList) {
  //   return ListView.builder(
  //     itemCount: todoList.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       var task = todoList[index];
  //       var timestamp = task['timestamp']
  //           .toDate(); // Convert Firestore timestamp to DateTime
  //       var formattedTimestamp = DateFormat('yyyy-MM-dd HH:mm:ss')
  //           .format(timestamp); // Format the DateTime
  //       return ListTile(
  //         title: Text(
  //           task['content'],
  //           style: TextStyle(decoration: TextDecoration.lineThrough),
  //         ),
  //         subtitle: Text(formattedTimestamp),
  //         trailing: Icon(
  //           Icons.check_box_outlined,
  //           color: Colors.red,
  //         ),
  //         onTap: () {},
  //         onLongPress: () {},
  //       );
  //     },
  //   );
  // }

  // Widget taskView() {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance.collection('TodoList').snapshots(),
  //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Text('Error: ${snapshot.error}'),
  //         );
  //       }
  //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
  //         return Center(
  //           child: Text('No tasks found.'),
  //         );
  //       }
  //       return myList(snapshot.data!.docs);
  //     },
  //   );
  // }
}
