import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('assets/download.png'),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                  'Google Workspace',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey.shade700,
                 )
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  List<User> maiList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maiList.add(User(id: 1, time: '10:30 AM', title: 'StockEdge', subtitle:'Bulls make a comeback! Right time to Go Premium With Exciting Holi Offer'));
    maiList.add(User(id: 2, time: '9:14 AM', title: 'Linkedin Job Alerts', subtitle:'"Application developer" roles: 1 new job'));
    maiList.add(User(id: 3, time: '6:27 AM', title: 'Bank of baroda', subtitle:'Statement of your Account for the month of February 2023'));
    maiList.add(User(id: 4, time: '4 Mar', title: 'Team Scaler', subtitle:'What does it take to ace a Tech Interview at Amazone?'));
    maiList.add(User(id: 5, time: '4 Mar', title: 'Kotak Credit Card', subtitle:'Earn upto 8x reward points on your shopping spree'));
    maiList.add(User(id: 6, time: '3 Mar', title: 'Flipkart', subtitle:'Reconciliation Summary on 2023-03-03(20:26:30)'));
    maiList.add(User(id: 7, time: '3 Mar', title: 'Angel One', subtitle:'OTP for Login - 518883'));
    maiList.add(User(id: 8, time: '3 Mar', title: 'SBI Mutual Fund', subtitle:'SBI Mutual Fund - Purchase transaction confirmation'));
    maiList.add(User(id: 9, time: '2 Mar', title: 'Bankalerts', subtitle:'Emi Due Intimation'));
    maiList.add(User(id: 10, time: '2 Mar', title: 'NSE Inspection Dept', subtitle:'NSE Awareness Alert'));
    maiList.add(User(id: 11, time: '1 Mar', title: 'Indeed', subtitle:'Sr.Sales Executive-AGRI-FIN-TRACTOR LOANS AND RETAIL(TEF)'));
    maiList.add(User(id: 12, time: '1 Mar', title: 'Bankalerts', subtitle:'Transaction Success Alert - ATM Cash Withdrawal'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 20,
        backgroundColor: Colors.white,
        child: ListView(
          children: [Container(
            child: Column(
              children: [
                SizedBox(height: 15,),
                ListTile(
                  leading: Image(image: AssetImage('assets/download.png'),width: 80),
                  horizontalTitleGap: -6,
                  title: Text('Gmail',style: TextStyle(fontSize: 30,color: Colors.grey.shade700,fontWeight: FontWeight.w400)),
                ),
                Divider(thickness: 2),
                ListTile(
                  leading: Icon(Icons.all_inbox,color:Colors.grey.shade700),
                  title: Text('All inboxes',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Text('99+',style: TextStyle(color: Colors.grey.shade700)),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.inbox,color:Colors.grey.shade700),
                  title: Text('Primary',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Text('99+',style: TextStyle(color: Colors.grey.shade700)),
                ),
                ListTile(
                  leading: Icon(Icons.person_2_outlined,color:Colors.grey.shade700),
                  title: Text('Social',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Container(
                      height: 18,
                      width: 70,
                      decoration: BoxDecoration(color: Colors.blue.shade800,borderRadius: BorderRadius.circular(20)),
                      child: Text('  99+ new',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600))),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_basket_outlined,color:Colors.grey.shade700),
                  title: Text('Promotions',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Container(
                      height: 18,
                      width: 70,
                      decoration: BoxDecoration(color: Colors.green.shade800,borderRadius: BorderRadius.circular(20)),
                      child: Text('  99+ new',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600))),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.star_border_outlined,color:Colors.grey.shade700),
                  title: Text('Starred',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.watch_later_outlined,color:Colors.grey.shade700),
                  title: Text('Snoozed',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.double_arrow,color:Colors.grey.shade700),
                  title: Text('Important',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Text('99+',style: TextStyle(color: Colors.grey.shade700)),
                ),
                ListTile(
                  leading: Icon(Icons.send_outlined,color:Colors.grey.shade700),
                  title: Text('Sent',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.schedule_send,color:Colors.grey.shade700),
                  title: Text('Scheduled',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.file_copy_outlined,color:Colors.grey.shade700),
                  title: Text('Draft',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                  trailing: Text('3',style: TextStyle(color: Colors.grey.shade700)),
                ),
                ListTile(
                  leading: Icon(Icons.mail_outline,color:Colors.grey.shade700),
                  title: Text('All mails',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.report_gmailerrorred,color:Colors.grey.shade700),
                  title: Text('Spam',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.restore_from_trash,color:Colors.grey.shade700),
                  title: Text('Bin',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.add,color:Colors.grey.shade700),
                  title: Text('Create new',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(Icons.settings,color:Colors.grey.shade700),
                  title: Text('Settings',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.feedback_outlined,color:Colors.grey.shade700),
                  title: Text('Send feedback',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline,color:Colors.grey.shade700),
                  title: Text('Help',style: TextStyle(fontSize: 17,color: Colors.grey.shade700,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 0.50),
                    color: Colors.white,
                borderRadius: BorderRadius.circular(15)
                  ),
                  height: 60,
                 // color: Colors.black,
                  child: ListTile(
                    leading: IconButton(
                      onPressed: _openDrawer,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                          trailing: GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder:(context) {
                                return SimpleDialog(
                                  backgroundColor: Colors.white,
                                  elevation: 20,
                                  shape:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                    title: Container(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage('assets/Person.png'),
                                            ),
                                            title: Text('Smit Sukhadiya',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                            subtitle: Text('smitsukhadiya3344@gmail.com'),
                                          ),
                                          SizedBox(height: 10,),
                                          ElevatedButton(
                                             style: ElevatedButton.styleFrom(
                                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                               backgroundColor: Colors.white,
                                             ),
                                            onPressed: () {
                                              return print('null');
                                            },
                                            child: Text('Manage your Google Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                          ),
                                          SizedBox(height: 10,),
                                          Divider(color: Colors.black,),
                                          ListTile(
                                            leading:Icon(
                                              Icons.cloud_queue_outlined,
                                            ),
                                            title: Text('Storage used: 0% of 15 GB'),
                                          ),
                                          Divider(color: Colors.black,),
                                          ListTile(
                                            leading:Icon(
                                              Icons.person_add_alt_outlined,
                                            ),
                                            title:  Text('Add another account'),
                                          ),
                                          SizedBox(height: 5,),
                                          ListTile(
                                            leading:Icon(
                                              Icons.person_search_outlined,
                                            ),
                                            title: Text('Manage accounts on this device'),
                                          ),
                                          Divider(color: Colors.black,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Privacy Policy',style: TextStyle(fontSize: 12)),
                                              SizedBox(width: 5,),
                                              Text('. Term of service',style: TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                          SizedBox(height: 15,),
                                        ],
                                      ),
                                    ),
                                );
                              },);
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/Person.png'),
                            ),
                          ),
                          shape: InputBorder.none,
                          title:TextField(
                            decoration: InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Search in mail',
                            ),
                          )
                ),
              ),
              ),
              SizedBox(height: 10,),
              Text('ALL INBOXES',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                 itemCount: maiList.length,
                  itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/Person.png'),
                    ),
                    trailing: Text('${maiList[index].time}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    title: Text('${maiList[index].title}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    subtitle: Text('${maiList[index].subtitle}'),
                    isThreeLine: true,
                  );
                },)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class User{
  int id;
  String time;
  String title;
  String subtitle;

  User({required this.id, required this.time, required this.title, required this.subtitle});
}
