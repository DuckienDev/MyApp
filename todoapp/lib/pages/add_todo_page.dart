import 'dart:developer';
import 'package:flutter/material.dart';
import '../sevices/database_sevice.dart';
import 'package:todoapp/widgets/button_widget.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final DatabaseService _databaseSevice = DatabaseService.instance;
  String? _task;
  late int _hour;
  late int _minute;
  String _period = '';
  @override
  Widget build(BuildContext context) {
    //UI
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,

      //APP BAR
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'A D D T A S K',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //BODY
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TEXT SET TIME
            Text(
              'SET TIME',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //TIME
            TimePicker(
              onChange: (timeOfDay) {
                setState(() {
                  _hour = getFormatedHourFromTimeOfDay(timeOfDay);
                  _minute = getFormatedMinuteFromTimeOfDay(timeOfDay);
                });
              },
              options: TimePickerOptions.byDefault(
                height: 150,
                itemExtent: 30,
                diameterRatio: 1,
                selectedRowHeight: 60,
                fontOpacity: 1,
                fontColor: Theme.of(context).colorScheme.surface,
                labelSize: 25,
                numberSize: 25,
                amPmSize: 15,
                amPmWidth: 25,
                wheelWidth: 50,
                selectedRowHorizontalPadding: double.maxFinite,
                selectedRowHorizontalBorderRadius: 30,
                selectedRowForegroundColor:
                    Theme.of(context).colorScheme.tertiary,
                selectedRowBackgroundColor:
                    Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 20),
            //TEXT ADD TASK
            Text(
              'ADD TASK',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //ADD TODO
            Column(
              children: [
                //TASK
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
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.surface),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    hintText: 'Subcribe...',
                  ),
                ),
                const SizedBox(height: 20),
                //  BUTTON DONE
                ButtonWidget(
                  nameButton: "DONE",
                  onTap: () {
                    addTaskFunction();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //ADD TASK FUNC
  void addTaskFunction() {
    if (_task == null || _task == "") return;
    _hour <= 12 ? _period = 'AM' : _period = 'PM';

    _databaseSevice.addTodo(_task!, _hour, _minute, _period);
    setState(() {
      _task = null;
      _hour = 0;
      _minute = 0;
      _period = '';
    });
    Navigator.pop(context);
  }

  //GET TIME
  int getFormatedHourFromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod - 12;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period.name.toUpperCase();

    String time = '$hour:$minute $period';
    log(time);
    return hour;
  }

  int getFormatedMinuteFromTimeOfDay(TimeOfDay timeOfDay) {
    final minute = timeOfDay.minute;
    return minute;
  }
}
