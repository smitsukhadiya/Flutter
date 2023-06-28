import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:d8(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class d8 extends StatefulWidget {
  const d8({Key? key}) : super(key: key);

  @override
  State<d8> createState() => _d8State();
}

class _d8State extends State<d8> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:showExit,
      child: Scaffold(
        appBar: AppBar(
          title: Text('D8'),
          actions: [
           PopupMenuButton(
             onSelected:(result){
           if(result=='profile'){
             Navigator.push(context,MaterialPageRoute(builder: (context) =>  profilescreen(),));
           }else if(result=='logout'){
            showExit();

           }
             },
               itemBuilder: (context) =>[
             PopupMenuItem(
               value: 'profile',
                 child: Text('Profile')
             ),
             PopupMenuItem(
               value: 'logout',
                 child: Text('Logout')
             ),
            ]
           ),
          ],
        ),
        body: Center(
          child: Container(
            child: Text('Home Screen'),
          ),
        ),
      ),
    );
  }

  Future<bool> showExit() async {
    return await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Exit App'),
        content: Text('Do You Want To Exit an App?'),
        actions: [
          ElevatedButton(onPressed: () => Navigator.of(context).pop(false),
              child: Text('NO')),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true),
              child: Text('YES')),
        ],
      );
     },
    )??false;
  }


}
class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset("assets/Person.png"),
              radius: 100,
            ),
            SizedBox(height: 20,),
            Text('Sugandh Gupta',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            SizedBox(height: 10,),
            Text('sugandh9090@gmail.com',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
            SizedBox(height: 10,),
            Text('1800-20152533513',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

