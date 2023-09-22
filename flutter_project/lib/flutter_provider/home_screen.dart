import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(builder: (context, value, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.openBottomShit(context);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Provider App'),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: value.itemList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(7),
              child: ListTile(
                isThreeLine: true,
                tileColor: Colors.blue.shade400,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                title: Text(value.itemList[index].name),
                subtitle:Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.itemList[index].email),
                    const SizedBox(height: 10,),
                    Text(value.itemList[index].number),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },);
  }
}
