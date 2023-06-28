import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_network_request/http_header/Model/Citys.dart';
import 'package:flutter_network_request/http_header/Model/County.dart';
import 'package:flutter_network_request/http_header/Model/States.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:http_header(),
    );
  }
}
class http_header extends StatefulWidget {
  const http_header({Key? key}) : super(key: key);

  @override
  State<http_header> createState() => _http_headerState();
}

class _http_headerState extends State<http_header> {
   List<County> countyList = [];
   List<States> stateList = [];
   List<Citys> cityList = [];
   var county = null;
   var state = null;
   var city = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCountyList();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Http_Header'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: Text('Select Your Country'),
              value: county,

              items:countyList.map ((e) =>DropdownMenuItem(
                value: e.countryName,
                  child: Text('${e.countryName}'),
              )).toList(),

              onChanged: (value) {
                   setState(() {
                     county = value;
                     loadStateList(county);
                   });
            },),
            SizedBox(height: 15,),
            DropdownButton(
              hint: Text('Select Your State'),
              value: state,

              items : stateList.map((e) =>DropdownMenuItem(
                value: e.stateName,
                child: Text('${e.stateName}'),
              )).toList(),

              onChanged: (value) {
                setState(() {
                  state = value;
                  loadCityList(state);
                });
              },),
            SizedBox(height: 15,),
            DropdownButton(
              hint: Text('Select Your City'),
              value: city,

              items : cityList.map((e) =>DropdownMenuItem(
                value: e.cityName,
                child: Text('${e.cityName}'),
              )).toList(),

              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },),
          ],
        ),
      ),
    );
  }

  Future<void> loadCountyList() async {

    var Headers =<String,String> {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJwcml0aTEyM0BnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiJWTVdla01QQnFEcFNaY19GcTFqNGZINmpVLWdVRU1qQVdpY3JYUFJ0czZteVJaY21YUXNxM19zR29LSURNamFhM3RjIn0sImV4cCI6MTY3NTc2NzQ4MH0.0MdImoEiTdIWbuE12qMXLe0sfcqxfPup2BfkqUASQBw',
      'Accept': 'application/json',
    };

    var res = await get(Uri.parse("https://www.universal-tutorial.com/api/countries"),
     headers: Headers
    );
    if(res.statusCode==200){
      setState(() {
        countyList = (jsonDecode(res.body) as List).map((e) => County.fromJson(e)).toList();
      });
    }else{
      throw Exception('failed to load country list');
    }
  }

  Future<void> loadStateList(county) async {
    state = null;
    var Headers =<String,String> {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJwcml0aTEyM0BnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiJWTVdla01QQnFEcFNaY19GcTFqNGZINmpVLWdVRU1qQVdpY3JYUFJ0czZteVJaY21YUXNxM19zR29LSURNamFhM3RjIn0sImV4cCI6MTY3NTc2NzQ4MH0.0MdImoEiTdIWbuE12qMXLe0sfcqxfPup2BfkqUASQBw',
      'Accept': 'application/json',
    };

    var res = await get(Uri.parse("https://www.universal-tutorial.com/api/states/$county"),
        headers: Headers
    );
    if(res.statusCode==200){
      setState(() {
        stateList = (jsonDecode(res.body) as List).map((e) => States.fromJson(e)).toList();
      });
    }else{
      throw Exception('failed to load country list');
    }
  }

  Future<void> loadCityList(state) async {
    city = null;
    var Headers =<String,String> {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJwcml0aTEyM0BnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiJWTVdla01QQnFEcFNaY19GcTFqNGZINmpVLWdVRU1qQVdpY3JYUFJ0czZteVJaY21YUXNxM19zR29LSURNamFhM3RjIn0sImV4cCI6MTY3NTc2NzQ4MH0.0MdImoEiTdIWbuE12qMXLe0sfcqxfPup2BfkqUASQBw',
      'Accept': 'application/json',
    };

    var res = await get(Uri.parse("https://www.universal-tutorial.com/api/cities/$state"),
        headers: Headers
    );
    if(res.statusCode==200){
      setState(() {
        cityList = (jsonDecode(res.body) as List).map((e) => Citys.fromJson(e)).toList();
      });
    }else{
      throw Exception('failed to load country list');
    }
  }
}
