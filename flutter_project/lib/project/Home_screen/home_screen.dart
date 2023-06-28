import 'package:flutter/material.dart';
import 'package:flutter_practical/project/Home_screen/account.dart';
import 'package:flutter_practical/project/Home_screen/home.dart';
import 'package:flutter_practical/project/Home_screen/portfolio.dart';
import 'package:flutter_practical/project/Home_screen/watchlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int _selectedindex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedindex = index;
     }
    );
  }
  List<Widget> _widgetOptions = [
    home(),
    watchlist(),
    portfolio(),
    account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              switch(value){
                case'logout':
                  {
                    var prefs = await SharedPreferences.getInstance();
                    var status = await prefs.remove('isLogin');
                    if(status)
                    Navigator.pushNamed(context, '/login');
                  }
              }
            },
            itemBuilder: (context) {
            return [
              PopupMenuItem(
                 value: 'logout',
                  child: Text('Logout')),
            ];
          },)
        ],
      ),
     /* appBar: AppBar(
        centerTitle: true,
       leading: Padding(
         padding: EdgeInsets.symmetric(horizontal: 130),
         child: Icon(
            color: Colors.grey.shade500,
            Icons.home_filled,
          ),
       ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black,
        title: Text('Home', style: TextStyle(color: Colors.grey.shade500)),
      ),*/
      body: _widgetOptions.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
           backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outlined),
           label: 'Watchlist',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfolio',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Account',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.grey.shade500,
      // type:BottomNavigationBarType.shifting,
       selectedLabelStyle: TextStyle(
         fontWeight: FontWeight.bold,
       ),
       currentIndex:_selectedindex,
        onTap:_onItemTapped,
      ),
    );
  }
}
