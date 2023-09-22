import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practical/bloc_tutorial/list_bloc/list_bloc.dart';
import 'package:flutter_practical/bloc_tutorial/list_bloc/list_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<ListModel> listModel = [];
  final ListBloc listBloc = ListBloc();

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
                  BlocBuilder<ListBloc, ListState>(
                    bloc:listBloc,
                    builder: (context, state) {
                      return MaterialButton(
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
                          if(state is ListAddingState){
                            print(listModel.length);
                            return listModel.add(ListModel(name: name, email: email, number: number));
                          }
                        },
                      );
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomShit(context);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(17),
        physics: BouncingScrollPhysics(),
        itemCount: listModel.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

            title: Text(listModel[index].name),
          ),
        );
      },),
    );
  }
}
