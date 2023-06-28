import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:Phone(),
    );
  }
}
class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Reqcall();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('phone call'),
      ),
      body: Center(
         child:  ListView.builder(
           itemCount: 20,
           itemBuilder: (context, index) {
             return Column(
               children: [
                 ListTile(
                   leading: Icon(Icons.phone_forwarded),
                   title: Text('Contact ${index+1}'),
                   subtitle: Text('Mobile ${index+1}'),
                   trailing:Text('00:00 AM'),
                 ),
               ],
             );
           },),
        ),
    );
  }

  _Reqcall() async {
    var status = await Permission.phone.status;
    if(status.isGranted){
      print('permission granted');
    }else if(status.isDenied){
      var stat = await Permission.phone.request().isGranted;
      if(stat){
        print('permission was granted');
      }else if(await Permission.phone.shouldShowRequestRationale){
        print('navigate to setting');
        openAppSettings();
      }else{
        print('permission denied');
        openAppSettings();
      }
    }
  }
}
