import 'package:flutter/material.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/sevices/database_sevice.dart';
import 'package:todoapp/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GET DATA
  final DatabaseService _databaseSevice = DatabaseService.instance;
  String? _task;

  @override
  Widget build(BuildContext context) {
    //UI
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "T O D O  A P P",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //LIST TODO
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: FutureBuilder(
        future: _databaseSevice.getTasks(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              Task task = snapshot.data![index];
              return ListTile(
                onLongPress: () {
                  _databaseSevice.deleteTodo(task.id);
                  setState(() {});
                },
                leading: CircleAvatar(child: Text(task.id.toString())),
                title: Text(task.content),
                trailing: Checkbox(
                    value: task.status == 1,
                    onChanged: (value) {
                      _databaseSevice.updateTask(
                        task.id,
                        value == true ? 1 : 0,
                      );
                      setState(() {});
                    }),
              );
            },
          );
        },
      ),

      //ADD TODO
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              titleTextStyle: TextStyle(fontSize: 15),
              title: Text(
                'A D D T A S K',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    maxLength: 123,
                    maxLines: 3,
                    onChanged: (value) {
                      setState(() {
                        _task = value;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: InputBorder.none,
                      hintText: 'Subcribe...',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    nameButton: "DONE",
                    onTap: () {
                      if (_task == null || _task == "") return;
                      _databaseSevice.addTodo(_task!);
                      setState(() {
                        _task = null;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
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
}
