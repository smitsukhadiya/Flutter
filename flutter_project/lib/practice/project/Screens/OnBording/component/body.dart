import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/Routes/app_route.dart';
import 'package:flutter_practical/practice/project/Screens/OnBording/component/indicator.dart';
import 'package:flutter_practical/practice/project/Screens/OnBording/component/slide_view.dart';

import '../../../model/item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> itemList = [];
  int currentIndex = 0;
  final _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemList.add(  Item(
        title: 'Select Item',
        desc:
        'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
        image: 'assets/onboarding.jpg'),
    );
    itemList.add(
      Item(
          title: 'Purchase',
          desc:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
          image: 'assets/onboarding.jpg'),
    );
    itemList.add(
      Item(
          title: 'Delivery',
          desc:
          'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
          image: 'assets/onboarding.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
      child: Scaffold(
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for(int i = 0;i< itemList.length;i++)
                  if(i == currentIndex)
                    getIndicator(true)
                  else
                    getIndicator(false)
              ],
            ),
            ElevatedButton(onPressed: () {
              if(currentIndex == itemList.length -1){
                Navigator.pushReplacementNamed(context,AppRoute.login);
              }else{
                currentIndex++;
                _pageController.animateToPage(currentIndex, duration:Duration(microseconds: 3), curve: Curves.linear);
              }

            }, child:Text(currentIndex==itemList.length -1? 'FINISH':'NEXT')),
          ],
        ),

        body: PageView.builder(
          controller:_pageController,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: itemList.length,
          itemBuilder: (context, index) {
          return Slideview(itemList[index]);
        },),
      ),
    );
  }
}
