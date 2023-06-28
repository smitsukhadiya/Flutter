import 'dart:ffi';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int _selectedDestination = 0;

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
     appBar: AppBar(
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
      ),
      drawer: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            builMenuItem(context),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  builMenuItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Wrap(
        runSpacing: 0,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
                'Home',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: Icon(Icons.home),
            selected: _selectedDestination == 0,
            selectedColor: Colors.black,
            selectedTileColor: Colors.grey.shade300,
            onTap: () => selectDestination(0),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
                'Profile & Settings',
              style: TextStyle(
                color: Colors.black,
            ),),
            leading: Icon(Icons.account_circle),
            selected: _selectedDestination == 1,
            selectedColor: Colors.black,
            selectedTileColor: Colors.grey.shade300,
            onTap: () => selectDestination(1),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
              'Fund detail',
              style: TextStyle(
                color: Colors.black,
            ),),
            leading: Icon(Icons.wallet),
            selected: _selectedDestination == 2,
            selectedColor: Colors.black,
            selectedTileColor: Colors.grey.shade300,
            onTap: () => selectDestination(2),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
              'Notification',
              style: TextStyle(
                color: Colors.black,
            ),),
            leading: Icon(Icons.notifications_active),
            selected: _selectedDestination == 3,
            selectedColor: Colors.black,
            selectedTileColor: Colors.grey.shade300,
            onTap: () => selectDestination(3),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            title: Text(
                'Price Alerts',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: Icon(Icons.alarm),
            selected: _selectedDestination == 4,
            selectedColor: Colors.black,
            selectedTileColor: Colors.grey.shade300,
            onTap: () => selectDestination(4),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text(
                'Rate Us',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
                'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Logout',
            style: TextStyle(
              color: Colors.black,
            ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

buildHeader(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
     // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          CircleAvatar(
          backgroundColor: Colors.grey,
            radius:45,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              'Smit Sukhadiya',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            'smitsukhadiya3344@gmail.com',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
}
}
