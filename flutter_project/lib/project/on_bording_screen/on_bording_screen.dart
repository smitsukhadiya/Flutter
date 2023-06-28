import 'package:flutter/material.dart';
import 'package:flutter_practical/project/Model/item.dart';
import 'package:flutter_practical/project/on_bording_screen/Componants/indicator.dart';
import 'package:flutter_practical/project/on_bording_screen/Componants/slide_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class onbordingscreen extends StatefulWidget {
  const onbordingscreen({Key? key}) : super(key: key);

  @override
  State<onbordingscreen> createState() => _onbordingscreenState();
}

class _onbordingscreenState extends State<onbordingscreen> {
  @override
  List<item> itemlist = [];
  var currentindex = 0;
  PageController _pageController = PageController();

  void initState() {
    // TODO: implement initState
    super.initState();
    itemlist.add(item(title: "Track and manage your Portfolio", desc: "Your assets at a Flutter.Keep with your stocks,Cryptocurrencies,ETSs, and mutual funds and more.", image: "https://zsktbtpe6w-flywheel.netdna-ssl.com/wp-content/themes/Alphaflow/res/home/img/circle-portfolio.png"));
    itemlist.add(item(title: "Know your true Performance", desc: "Have access to your trading history. Look up dividend growth rates and other historical trends that are automatically incorporated as they happen.", image: "https://devartcdn.azureedge.net/views/content/products/dbforge/postgresql/studio/images/performance-optimization-postgresql.png"));
    itemlist.add(item(title: "Save time and money", desc: "Never miss an important market development. Connect with your accounts for an easy and automatic setup.", image: "https://calamari.io/blog/user/pages/01.blog/07.5-tips-on-improving-work-performance-by-time-tracking-automation/how%20to%20improve%20employees%20productivity.png"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 70,horizontal: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,'/login');
                },
                child:  Text(
                  'SKIP',
                  style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                   ),
                ),
              ),
            ),
          ),
         Padding(padding:EdgeInsets.all(35),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
            setState(() {
              currentindex = value;
            });
            },
            itemCount: itemlist.length,
            itemBuilder: (context, index) {
            return slidescreen(title: itemlist[index].title, desc: itemlist[index].desc, image: itemlist[index].image);
          },),
        ),
      ],
      ),
      bottomSheet: Container(
        color: Colors.black,
       padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
       // margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  for(int i = 0;i<itemlist.length;i++)
                   currentindex ==i? getindicator(true):getindicator(false)
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade600,
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
              onPressed: () async {
                if(currentindex==itemlist.length-1){
                  var prefs = await SharedPreferences.getInstance();
                  var status = await prefs.setBool('isOnBording', true);
                 if (status) {
                   Navigator.pushNamed(context, '/login');
                 }
                }else{
                  _pageController.animateToPage(currentindex+1, duration:Duration(microseconds: 400), curve:Curves.linear);
                }
              },
              child: Text(
                currentindex==itemlist.length-1?"FINISH":"NEXT",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
