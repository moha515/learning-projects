import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Taskly extends StatefulWidget {
  static String id = 'task screen';

  const Taskly({Key? key}) : super(key: key);

  @override
  State<Taskly> createState() => _TasklyState();
}

class _TasklyState extends State<Taskly> {
  late double _devHeight, _devWidth;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        toolbarHeight: _devHeight * 0.15,
        title: const Text(
          'Tasky __ !!',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 39,
          ),
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
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
            return _buildTaskTile(user);
          },
        );
      },
    );
  }

  Widget _buildTaskTile(DocumentSnapshot user) {
    return ListTile(
      title: Text(user['name']),
      onTap: () {
        // Implement update or delete functionality
      },
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Task"),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter task name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addTask(_textFieldController.text);
                _textFieldController.clear();
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addTask(String taskName) {
    // Add logic to add task to Firestore
  }
}
