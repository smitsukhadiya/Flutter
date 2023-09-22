import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();

  final CollectionReference items =
      FirebaseFirestore.instance.collection('user');

  // final collection = 'user';
  var userDoc;
  var doc;

  Future<void> registerUser(String email, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser(String email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

/*  Future<void> deleteUser(String collection, String name) async {
    await FirebaseFirestore.instance.collection(collection).doc(name).delete();
  }*/

  Future<void> deleteUser(String productId) async {
    await items.doc(productId).delete();
  }

  /* void updateUser(String collection, String doc, newUserName, newUserEmail,
      newUserNumber) async {
    await FirebaseFirestore.instance.collection(collection).doc(doc).update(
        {'name': newUserName, 'email': newUserEmail, 'number': newUserNumber});
  }*/

  Future<void> updateUser(String name, email, number, productId) async {
    await items
        .doc(productId)
        .update({'name': name, 'email': email, 'number': number});
  }

  Future<void> addUser(String name, email, number) async {
    await items.doc(userDoc.toString()).set({'name': name, 'email': email, 'number': number});
  }

  void openBottomShit(BuildContext context,[DocumentSnapshot? documentSnapshot]) {
    nameController.text =
        documentSnapshot != null ? documentSnapshot['name'] : '';
    emailController.text =
        documentSnapshot != null ? documentSnapshot['email'] : '';
    numberController.text =
        documentSnapshot != null ? documentSnapshot['number'] : '';

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
                    child: Text(documentSnapshot != null ? 'UPDATE' : 'ADD'),
                    onPressed: () async {
                      String name = nameController.text.trim();
                      String email = emailController.text.trim();
                      String number = numberController.text.trim();

                       userDoc = Random.secure().nextInt(999).toString();

                      documentSnapshot != null
                          ? updateUser(name, email, number, documentSnapshot.id)
                          : addUser(name, email, number);
                      /* await FirebaseFirestore.instance
                              .collection(collection)
                              .doc(userDoc)
                              .set({
                              'name': name,
                              'email': email,
                              'number': number
                            });*/

                      nameController.clear();
                      emailController.clear();
                      numberController.clear();
                      update();
                      Get.back();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: documentSnapshot != null
                              ? Colors.blue
                              : Colors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          content: Row(
                            children: [
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                  documentSnapshot != null
                                      ? 'Data Updated'
                                      : 'Data Added',
                                  style: const TextStyle(fontSize: 20)),
                            ],
                          )));
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
}
