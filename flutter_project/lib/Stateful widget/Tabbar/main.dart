import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabBar Widget ',
      home:tabbarexample(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class tabbarexample extends StatefulWidget {
  const tabbarexample({Key? key}) : super(key: key);

  @override
  State<tabbarexample> createState() => _tabbarexampleState();
}

class _tabbarexampleState extends State<tabbarexample> with TickerProviderStateMixin{
late  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this)..addListener(() {
      print('User at index: ${_tabController.index }');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.train),
              text: 'Train',
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              text: 'Bus',
            ),
            Tab(
              icon: Icon(Icons.flight),
              text: 'Flight',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child:Text('Train',style: TextStyle(fontSize: 30)),
          ),
          Center(
            child:Text('Bus',style: TextStyle(fontSize: 30)),
          ),
          Center(
            child:Text('Flight',style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}
