import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
      ),

      body: tasks.isEmpty
          ? const Center(
        child: Text(
          'No tasks yet',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Icon(
                tasks[index]['completed']
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: tasks[index]['completed']
                    ? Colors.green
                    : Colors.grey,
              ),

              title: Text(
                tasks[index]['title'],
                style: TextStyle(
                  decoration: tasks[index]['completed']
                      ? TextDecoration.lineThrough
                      : null,
                  fontWeight: FontWeight.w600,
                ),
              ),

              subtitle:
              Text(tasks[index]['description'] ?? ''),

              onTap: () {
                setState(() {
                  tasks[index]['completed'] =
                  !tasks[index]['completed'];
                });
              },

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit,
                        color: Colors.blue),
                    onPressed: () async {
                      final updatedTask =
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddTaskScreen(
                                  task: tasks[index]),
                        ),
                      );

                      if (updatedTask != null) {
                        setState(() {
                          tasks[index] = updatedTask;
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete,
                        color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              title: const Text(
                                  'Delete Task'),
                              content: const Text(
                                  'Are you sure you want to delete this task?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(
                                          context),
                                  child:
                                  const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      tasks.removeAt(
                                          index);
                                    });
                                    Navigator.pop(
                                        context);
                                  },
                                  child:
                                  const Text('Delete'),
                                ),
                              ],
                            ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const AddTaskScreen(),
            ),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
