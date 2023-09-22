import 'package:flutter/material.dart';

import 'list_model.dart';

class ListProvider extends ChangeNotifier{

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();

  List<ListModel> itemList = [];

  void openBottomShit(BuildContext context) {
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
                    color: Colors.blue,
                    height: 50,
                    minWidth: double.infinity,
                    child: const Text('Add'),
                    onPressed: () {
                      String name = nameController.text.trim();
                      String email = emailController.text.trim();
                      String number = numberController.text.trim();

                      itemList.add(
                          ListModel(name: name, email: email, number: number));
                      nameController.clear();
                      emailController.clear();
                      numberController.clear();
                     notifyListeners();
                     Navigator.pop(context);
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