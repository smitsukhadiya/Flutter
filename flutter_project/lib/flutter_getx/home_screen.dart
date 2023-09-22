import 'package:flutter/material.dart';
import 'package:flutter_practical/flutter_getx/controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (ctrl) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ctrl.openBottomShit(context);
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text('Get X App'),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: ctrl.itemList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(7),
                child: ListTile(
                  isThreeLine: true,
                  tileColor: Colors.blue.shade400,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  title: Text(ctrl.itemList[index].name),
                  subtitle:Column(
                    mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(ctrl.itemList[index].email),
                  const SizedBox(height: 10,),
                  Text(ctrl.itemList[index].number),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
