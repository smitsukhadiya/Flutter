import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var searchController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref('Post');

  void openBottomShit(BuildContext context, String id, sname, email, number) {
    nameController.text = sname ?? '';
    emailController.text = email ?? '';
    numberController.text = number ?? '';
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter name',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: numberController,
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Enter Number',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.purple.shade400,
                    height: 50,
                    minWidth: double.infinity,
                    child: Text(sname != '' ? 'UPDATE' : 'ADD'),
                    onPressed: () async {
                      String name = nameController.text.trim();
                      String email = emailController.text.trim();
                      String number = numberController.text.trim();
                      if (sname.isEmpty) {
                        addItem(name, email, number);
                      } else {
                        updateItem(id, name, email, number);
                      }
                      nameController.clear();
                      emailController.clear();
                      numberController.clear();
                      Navigator.pop(context);
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     duration: const Duration(seconds: 3),
                      //     backgroundColor : Colors.green,
                      //     shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.only(
                      //             topLeft: Radius.circular(15),
                      //             topRight: Radius.circular(15))),
                      //     content: Row(
                      //       children: const [
                      //         SizedBox(
                      //           height: 20,
                      //           width: 20,
                      //           child: CircularProgressIndicator(
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 15,
                      //         ),
                      //         Text('Data Added',
                      //             style: TextStyle(fontSize: 20)),
                      //       ],
                      //     )));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void addItem(String name, email, number) {
    var id = Random.secure().nextInt(999).toString();
    databaseRef.child(id).set({
      'id': id,
      'name': name,
      'email': email,
      'number': number,
    }).then((value) {
      Fluttertoast.showToast(
          msg: 'Data Added',
          backgroundColor: Colors.green,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: error.toString(),
          backgroundColor: Colors.red,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  void updateItem(String id, name, email, number) {
    databaseRef
        .child(id)
        .update({'name': name, 'email': email, 'number': number});
    Fluttertoast.showToast(
        msg: 'Data Updated',
        backgroundColor: Colors.blue,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  void deleteUser(String id) {
    databaseRef.child(id).remove();
    Fluttertoast.showToast(
        msg: 'Data Deleted',
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase-RealTime-Database'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.lightBlue.shade300,
                hintText: 'Seach Here',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                var id = snapshot.child('id').value.toString();
                var name = snapshot.child('name').value.toString();
                var email = snapshot.child('email').value.toString();
                var number = snapshot.child('number').value.toString();

                if (searchController.text.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(7),
                    child: ListTile(
                        isThreeLine: true,
                        tileColor: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        title: Text(snapshot.child('name').value.toString()),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.child('email').value.toString()),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(snapshot.child('number').value.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopupMenuButton(
                              elevation: 20,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side:
                                      const BorderSide(color: Colors.white30)),
                              onSelected: (value) {
                                if (value == 'Update') {
                                  openBottomShit(
                                      context, id, name, email, number);
                                } else if (value == 'Delete') {
                                       deleteUser(id);
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                      value: 'Update',
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const PopupMenuItem(
                                      value: 'Delete',
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ];
                              },
                              child: const Icon(Icons.more_vert, size: 30),
                            ),
                          ],
                        )),
                  );
                } else if (name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase())) {
                  return Padding(
                    padding: const EdgeInsets.all(7),
                    child: ListTile(
                        isThreeLine: true,
                        tileColor: Colors.blue.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        title: Text(snapshot.child('name').value.toString()),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.child('email').value.toString()),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.child('number').value.toString()),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopupMenuButton(
                              elevation: 20,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side:
                                      const BorderSide(color: Colors.white30)),
                              onSelected: (value) {
                                if (value == 'Update') {
                                  openBottomShit(
                                      context, id, name, email, number);
                                } else if (value == 'Delete') {
                                  deleteUser(id);
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                      value: 'Update',
                                      child: Text(
                                        'Update',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  const PopupMenuItem(
                                      value: 'Delete',
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ];
                              },
                              child: const Icon(Icons.more_vert, size: 30),
                            ),
                          ],
                        )),
                  );
                } else {
                  return const Center(
                    child: Text('No Record Found'),
                  );
                }
                // return Padding(
                //   padding: const EdgeInsets.all(7),
                //   child: ListTile(
                //       isThreeLine: true,
                //       tileColor: Colors.blue.shade400,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(15)),
                //       title: Text(snapshot.child('name').value.toString()),
                //       subtitle: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(snapshot.child('email').value.toString()),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text(snapshot.child('number').value.toString()),
                //         ],
                //       ),
                //       trailing: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           PopupMenuButton(
                //             elevation: 20,
                //             color: Colors.white,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(20),
                //                 side: const BorderSide(
                //                     color: Colors.white30)),
                //             onSelected: (value) {
                //               if (value == 'Update') {
                //                openBottomShit(context);
                //               } else if (value == 'Delete') {}
                //             },
                //             itemBuilder: (context) {
                //               return [
                //                 const PopupMenuItem(
                //                     value: 'Update',
                //                     child: Text(
                //                       'Update',
                //                       style: TextStyle(
                //                           color: Colors.blue,
                //                           fontSize: 18,
                //                           fontWeight: FontWeight.bold),
                //                     )),
                //                 const PopupMenuItem(
                //                     value: 'Delete',
                //                     child: Text(
                //                       'Delete',
                //                       style: TextStyle(
                //                           color: Colors.red,
                //                           fontSize: 18,
                //                           fontWeight: FontWeight.bold),
                //                     )),
                //               ];
                //             },
                //             child: const Icon(Icons.more_vert, size: 30),
                //           ),
                //         ],
                //       )),
                // );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomShit(context, '', '', '', '');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
