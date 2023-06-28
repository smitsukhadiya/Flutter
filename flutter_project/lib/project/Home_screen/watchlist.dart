import 'package:flutter/material.dart';

import '../Model/user.dart';

class watchlist extends StatefulWidget {
  const watchlist({Key? key}) : super(key: key);

  @override
  State<watchlist> createState() => _watchlistState();
}

class _watchlistState extends State<watchlist> {
  List<User> userList = [];
  List<User> filteredList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userList = getUserList();
    filteredList = getUserList();
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
            Icons.bookmark_outlined,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black,
        title: Text('Watchlist', style: TextStyle(color: Colors.grey.shade500)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText:'Search here. . . .',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                  )
                )
              ),
              onChanged:(value) {
               setState(() {
                 filteredList = userList.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
               });
              },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                return getListItem(filteredList[index]);
               },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<User> getUserList() {
    List<User> users = [];
    users.add(User(id: 1, name:'INFY', exchange:'NSE',price: 1474.25));
    users.add(User(id: 2, name:'HDFC', exchange:'NSE',price: 2343.50));
    users.add(User(id: 3, name:'TCS', exchange:'BSE',price: 3099.15));
    users.add(User(id: 4, name:'ASTRAL', exchange:'NSE',price: 2150.00));
    users.add(User(id: 5, name:'WIPRO', exchange:'BSE',price: 377.31));
    users.add(User(id: 6, name:'BAJAJFINSV', exchange:'BSE',price: 1688.35));
    return users;

  }

  Widget getListItem(User user) {
    return ListTile(
      trailing: Text(
        user.price.toString(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: Text(
        user.name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(user.exchange),
      leading: Icon(
        Icons.add_circle,
        size:35,
      ),
    );
  }
}