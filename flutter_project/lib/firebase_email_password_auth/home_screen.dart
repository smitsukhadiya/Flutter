import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/firebase_email_password_auth/controller.dart';
import 'package:flutter_practical/firebase_email_password_auth/login_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Hello, ${Get.arguments}',
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.off(const LoginScreen());
                  },
                  icon: const Icon(Icons.settings_power)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ctrl.openBottomShit(context, null);
            },
            child: const Icon(Icons.add),
          ),
          body: StreamBuilder(
            stream: ctrl.items.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const BouncingScrollPhysics(),
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot? documentSnapshot =
                        streamSnapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(7),
                      child: ListTile(
                          isThreeLine: true,
                          tileColor: Colors.blue.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text(documentSnapshot['name']),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(documentSnapshot['email']),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(documentSnapshot['number']),
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
                                    side: const BorderSide(
                                        color: Colors.white30)),
                                onSelected: (value) {
                                  if (value == 'Update') {
                                    ctrl.openBottomShit(context,
                                        documentSnapshot); /*ctrl.doc[index]*/
                                    // print('SIZE ${ctrl.doc}');
                                  } else if (value == 'Delete') {
                                    ctrl.deleteUser(documentSnapshot.id);
                                    // ctrl.deleteUser(ctrl.collection,ctrl.doc[index]['name']);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration:
                                                const Duration(seconds: 2),
                                            backgroundColor: Colors.red,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            content: Row(
                                              children: const [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text('Data Deleted',
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ],
                                            )));
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
                  },
                );
              }
            },

            //FirebaseFirestore.instance.collection(ctrl.collection).snapshots(),

            /* builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                 ctrl.doc = snapshot.data!.docs;
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const BouncingScrollPhysics(),
                  itemCount: ctrl.doc.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7),
                      child: ListTile(
                          isThreeLine: true,
                          tileColor: Colors.blue.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text(ctrl.doc[index]['name']),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ctrl.doc[index]['email']),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(ctrl.doc[index]['number']),
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
                                    side: const BorderSide(
                                        color: Colors.white30)),
                                onSelected: (value) {
                                  if(value == 'Update'){
                                      ctrl.openBottomShit(context,ctrl.doc[index]);
                                      print('SIZE ${ctrl.doc}');
                                  }else if(value == 'Delete'){
                                   ctrl.deleteUser(ctrl.collection,ctrl.doc[index]['name']);
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                       duration: const Duration(seconds: 2),
                                       backgroundColor: Colors.red,
                                       shape: const RoundedRectangleBorder(
                                           borderRadius: BorderRadius.only(
                                               topLeft: Radius.circular(15),
                                               topRight: Radius.circular(15))),
                                       content: Row(
                                         children: const [
                                           SizedBox(
                                             width: 20,
                                             height: 20,
                                             child: CircularProgressIndicator(
                                               color: Colors.white,
                                             ),
                                           ),
                                           SizedBox(
                                             width: 15,
                                           ),
                                           Text('Data Deleted',
                                               style: TextStyle(fontSize: 20)),
                                         ],
                                       )));
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
                  },
                );
              }
            },*/
          ),
        );
      },
    );
  }
}
