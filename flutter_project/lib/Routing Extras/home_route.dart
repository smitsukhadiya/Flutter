import 'package:flutter/material.dart';
import 'package:flutter_practical/Routing%20Extras/second_route.dart';
import 'first_route.dart';

class homeroute extends StatelessWidget {
  const homeroute({Key? Key}): super(key: Key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home Route'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () {
            Navigator.push(
           context,
            MaterialPageRoute(
             settings: RouteSettings(
                name: '/first'
              ),
            builder: (context) => firstroute(),
           ),
         );
        },
          child: Text('Push'),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>firstroute(),
                 ),
                );
              },
                child: Text('Push Replacement'),
              ),
            /* ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(
                      name: '/first',
                    ),
                    builder: (context) =>firstroute(),
                  ),
                );
              },
                child: Text('Pop Untill'),
              ),*/
           /* ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(
                        name: 'first',
                    ),
                    builder: (context) =>firstroute(),
                  ),
                );
              },
                child: Text('Push Replacement Name'),
              ),*/
          ],
        ),
      ),
    );
  }
}
