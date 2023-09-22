import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/sqflite_database/database_helper.dart';
import 'package:flutter_practical/practice/sqflite_database/item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseHelper db = DatabaseHelper();

  List<ItemModel> itemList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  void openBottomShit(BuildContext context, [ItemModel? itemModel]) {
    nameController.text = itemModel != null ? itemModel.name : '';
    emailController.text = itemModel != null ? itemModel.email : '';
    numberController.text = itemModel != null ? itemModel.number : '';
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
                    child: Text(itemModel != null ? 'UPDATE' : 'Add'),
                    onPressed: () {
                      String name = nameController.text.trim();
                      String email = emailController.text.trim();
                      String number = numberController.text.trim();
                      ItemModel mitemModel = ItemModel(
                          id: itemModel?.id,
                          name: name,
                          email: email,
                          number: number);
                      itemModel != null
                          ? updateItem(mitemModel)
                          : addItem(name, email, number);
                      itemModel!=null ?
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.blue,
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
                              Text('Item Updated',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ))) :
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
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
                              Text('Item Added',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          )));
                      getItem();
                      nameController.clear();
                      emailController.clear();
                      numberController.clear();
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

  Future<void> addItem(String name, email, number) async {
    await db.insert(ItemModel(name: name, email: email, number: number));
  }

  Future<void> deleteItem(int id) async {
    await db.delete(id);
    getItem();
  }

  Future<void> updateItem(ItemModel itemModel) async {
    await db.update(itemModel);
    getItem();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItem();
  }

  void getItem() async {
    itemList = (await db.getItem())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomShit(context, null);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Sqflite Databse'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: itemList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(7),
            child: ListTile(
                isThreeLine: true,
                tileColor: Colors.blue.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text(itemList[index].name),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemList[index].email),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(itemList[index].number),
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
                          side: const BorderSide(color: Colors.white30)),
                      onSelected: (value) {
                        if (value == 'Update') {
                          openBottomShit(context, itemList[index]);
                        } else if (value == 'Delete') {
                          deleteItem(itemList[index].id!);
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
                                  Text('Item Deleted',
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
      ),
    );
  }
}
