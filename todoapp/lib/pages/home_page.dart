import 'package:flutter/material.dart';
import 'package:todoapp/pages/add_todo_page.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/pages/setting_page.dart';
import 'package:todoapp/sevices/database_sevice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  late Future<List<Task>> _tasksFuture;

  @override
  void initState() {
    super.initState();
    _tasksFuture = _databaseService.getTasks();
  }

  Future<void> _refreshTasks() async {
    setState(() {
      _tasksFuture = _databaseService.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "T O D O  A P P",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // NAVIGATOR SETTING
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),

      // LIST TODO
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: FutureBuilder<List<Task>>(
        future: _tasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tasks available'));
          }

          final tasks = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Column(
                  children: [
                    ListTile(
                      onLongPress: () async {
                        checkDeleteTask(context, task);
                      },
                      title: Text(
                        task.time.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(task.content),
                      trailing: Checkbox(
                        value: task.status == 1,
                        onChanged: (value) {
                          _databaseService.updateTask(
                            task.id,
                            value == true ? 1 : 0,
                          );
                          _refreshTasks();
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),

      // NAVIGATO ADD TODO
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodo()),
          );
          _refreshTasks();
        },
        child: Text(
          'ADD TASK',
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //CHECK DELETE TASK
  Future<dynamic> checkDeleteTask(BuildContext context, Task task) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Do you wan't delete?",
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              _databaseService.deleteTask(task.id);
              Navigator.pop(context);
              _refreshTasks();
            },
            icon: const Icon(
              Icons.check,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
