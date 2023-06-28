import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permission Handler',
      home:Permissionhandlerpage(),
    );
  }
}
class Permissionhandlerpage extends StatefulWidget {
  const Permissionhandlerpage({Key? key}) : super(key: key);

  @override
  State<Permissionhandlerpage> createState() => _PermissionhandlerpageState();
}

class _PermissionhandlerpageState extends State<Permissionhandlerpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
    title: Text('Material App Bar'),
     ),
      body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: () {
               _requestForCalenderPermission();
             }, child: Text('Request for calender Permission')
             ),
           ],
         ),
    ),
   );
  }

  Future<void> _requestForCalenderPermission() async {
    var status = await Permission.calendar.status;
    if(status.isGranted){
      print('permission granted');
    }else if(status.isDenied){
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      var stat = await Permission.calendar.request().isGranted;
      if(stat){
        print('permission was granted');
      }else if(await Permission.calendar.shouldShowRequestRationale){
        print('Navigate to setting');
        //first show alert dialog and navigate to app settings fro permission
        openAppSettings();
      } else {
        // show dialog and navigate to app settings
        // first show alert dialog and navigate to app settings for permission
        print('Permission denied');
        openAppSettings();
      }
    }
  }
}
