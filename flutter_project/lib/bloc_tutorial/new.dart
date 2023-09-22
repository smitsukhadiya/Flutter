import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const New(),
    );
  }
}

class New extends StatelessWidget {
  const New({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade700,
      body: Column(
        children: [
          Container(
            height: 180,
            color: Colors.orange.shade700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome Ana',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(
                      height: 5,
                    ),
                    Text('What would you like to play?',
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
