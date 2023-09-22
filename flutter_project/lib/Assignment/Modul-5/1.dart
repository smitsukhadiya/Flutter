import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      //s  useMaterial3: true,
      ),
      title: 'Material App',
      home: d1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _d1State extends State<d1> {
  List<Task> taskList = [];
  List<Task> filteredList = [];

  @override
  Widget build(BuildContext context) {
    filteredList.sort((a, b) => a.date.compareTo(b.date));
    // taskList.sort((a, b) => a.time.compareTo(b.time)); to sort time wise uncomment me !
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        title: const Text('Task Management (D1)'),
        elevation: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Task By Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: const Icon(Icons.manage_search),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      filteredList.clear();
                      filteredList.addAll(taskList);
                    } else {
                      filteredList = taskList
                          .where((element) => element.name
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                  });
                },
              ),
            ),
            const Divider(thickness: 1.5),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListItem(context, filteredList[index]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        child: const Icon(Icons.edit_note_sharp, color: Colors.white),
        onPressed: () async {
          var task = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DataScreen(),
              ));
          if (task != null) {
            setState(() {
              filteredList = [];
              taskList.add(task);
              filteredList.addAll(taskList);
            });
          }
        },
      ),
    );
  }

  Widget ListItem(BuildContext context, [Task? task]) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
      child: ListTile(
        isThreeLine: true,
        textColor: Colors.white,
        title: Text('${task?.name}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${task?.description}'),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: priorityColor(task), shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('${task?.priority} Priority'),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${task?.date}'),
                Text('${task?.time}'),
              ],
            ),
            PopupMenuButton(
              elevation: 20,
              shadowColor: priorityColor(task),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.white30)),
              color: priorityColor(task),
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) async {
                if (value == 'Update') {
                  Task mTask = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataScreen(task: task),
                      ));
                  setState(() {
                    filteredList.clear();
                    var index = taskList
                        .indexWhere((element) => element.id == mTask.id);
                    taskList[index] = mTask;
                    filteredList.addAll(taskList);
                  });
                } else if (value == 'Delete') {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.delete),
                            const Text('Are You Sure Want To Delete?',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    side: const BorderSide(
                                        color: Colors.grey, width: 1),
                                    backgroundColor: Colors.grey.shade900,
                                    elevation: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('cencel')),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    side: const BorderSide(
                                        color: Colors.grey, width: 1),
                                    backgroundColor: Colors.grey.shade900,
                                    elevation: 20,
                                  ),
                                  onPressed: () {
                                    deleteTask(task);
                                  },
                                  child: const Text('Delete'))
                            ],
                          ),
                        ],
                      );
                    },
                  );
                } else if (value == 'Complate Task') {
                  setState(() {
                    task?.taskD = true;
                  });
                }
              },
              itemBuilder: (context) {
                return task?.taskD == false
                    ? [
                        const PopupMenuItem(
                            value: 'Update',
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        const PopupMenuItem(
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        const PopupMenuItem(
                            value: 'Complate Task',
                            child: Text(
                              'Complate Task',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ]
                    : [
                        const PopupMenuItem(
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ];
              },
            ),
          ],
        ),
        tileColor: tileColor(task),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Color? priorityColor(Task? task) {
    if (task?.priority == 'High') {
      return Colors.red;
    } else if (task?.priority == 'Average') {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  void deleteTask(Task? task) {
    setState(() {
      filteredList.clear();
      taskList.removeWhere((element) => element.id == task?.id);
      filteredList.addAll(taskList);
      Navigator.pop(context);
    });
  }

  tileColor(Task? task) {
    if (task?.taskD == false) {
      return Colors.blue.shade900;
    } else if (task?.taskD == true) {
      return Colors.grey.shade800;
    }
  }
}

class DataScreen extends StatefulWidget {
  final Task? task;

  const DataScreen({Key? key, this.task}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState(task);
}

class d1 extends StatefulWidget {
  @override
  State<d1> createState() => _d1State();
}

class _DataScreenState extends State<DataScreen> {
  Task? task;

  _DataScreenState(this.task);

  late TextEditingController nameController;
  late TextEditingController desController;
  late TextEditingController dateController;
  late TextEditingController timeController;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  var priority = [
    'High',
    'Average',
    'Low',
  ];

  String dropDownvalue = 'High';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: task?.name);
    desController = TextEditingController(text: task?.description);
    dateController = TextEditingController(text: task?.date);
    timeController = TextEditingController(text: task?.time);
    dropDownvalue = task?.priority ?? 'High';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        dateController.text =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        timeController.text =
            '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}  ${pickedTime.period.name.toUpperCase()}';
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  textCapitalization: TextCapitalization.words,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon:
                        const Icon(Icons.drive_file_rename_outline_sharp),
                    hintText: 'Name :',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: desController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.description),
                    hintText: 'Description :',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.date_range_sharp),
                    hintText: 'Pick Date',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.none,
                  readOnly: true,
                  onTap: () {
                    _selectTime(context);
                  },
                  controller: timeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(Icons.access_time),
                    hintText: 'Select Time',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'set priority',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: DropdownButton(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: Colors.grey,
                      elevation: 200,
                      icon: const Icon(Icons.settings_accessibility),
                      onChanged: (value) {
                        setState(() {
                          dropDownvalue = value! as String;
                        });
                      },
                      value: dropDownvalue,
                      items: priority.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: const BorderSide(color: Colors.grey, width: 1),
                        backgroundColor: Colors.grey.shade900,
                        elevation: 20,
                        padding: const EdgeInsets.fromLTRB(140, 20, 140, 20)),
                    onPressed: () {
                      var name = nameController.text;
                      var description = desController.text;
                      var date = dateController.text;
                      var time = timeController.text;
                      var dd = dropDownvalue;
                      if (task == null) {
                        addTask(context, name, description, date, time, dd);
                      } else {
                        Task Utask = Task(
                            id: task!.id,
                            name: name,
                            description: description,
                            date: date,
                            time: time,
                            priority: dd,
                            taskD: false);
                        updateTask(context, Utask);
                      }
                    },
                    child: Text(task != null ? 'Update' : 'Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(BuildContext context, String name, String description,
      String date, String time, String dd) {
    setState(() {
      var id = Random().nextInt(9999);
      var task = Task(
          id: id,
          name: name,
          description: description,
          date: date,
          time: time,
          priority: dd,
          taskD: false);
      nameController.clear();
      desController.clear();
      dateController.clear();
      timeController.clear();
      Navigator.pop(context, task);
    });
  }

  void updateTask(BuildContext context, Task task) {
    Navigator.pop(context, task);
  }
}

class Task {
  int id;
  String name;
  String description;
  String date;
  String time;
  String priority;
  bool taskD = false;

  Task(
      {required this.id,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      required this.priority,
      required this.taskD});

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, date: $date, time: $time, priority: $priority,taskD : $taskD)';
  }
}
