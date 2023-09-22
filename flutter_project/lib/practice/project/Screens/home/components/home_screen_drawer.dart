import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';

class HomeScreenDrawer extends StatefulWidget {
  const HomeScreenDrawer({super.key});

  @override
  State<HomeScreenDrawer> createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
           elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
        child: ListView(
          children: [
            buildUserAccountHeader(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Manage Category',style: TextStyle(fontSize: 16,color: Colors.black),
              ),
              onTap: () {
                Navigator.pushNamed(context,AppRoute.categoryListScreen);
              },
            ),
            ListTile(
              title: Text('HOME',style: TextStyle(fontSize: 16,color: Colors.black),
              ),
            ),
            ListTile(
              title: Text('HOME',style: TextStyle(fontSize: 16,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildUserAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Smit Sukhadiya',style: TextStyle(fontWeight: FontWeight.bold)),
        accountEmail: Text('sukhadiyasmit3344@gmail.com'),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.4),
      ),
      currentAccountPicture:CircleAvatar(
        backgroundImage: AssetImage('assets/Person.png'),
      ),
    );
  }
}
