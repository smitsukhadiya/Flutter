import 'package:flutter/material.dart';
import 'package:flutter_practical/Routing%20Extras/third_route.dart';

class secondroute extends StatelessWidget {
  const secondroute({Key? Key}) :super(key: Key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Second Route',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                     /* settings: RouteSettings(
                        name: '/second',
                      ),*/
                      builder: (context) => thirdroute(),
                      ),
                    );
                  },
                child: Text('Go to Third'),
              ),
            ],
          ),
        ),
    );
  }
}
