import 'package:flutter/material.dart';
import 'package:flutter_practical/Resposive%20widget/Resposive%20ui/Desktop_page.dart';
import 'package:flutter_practical/Resposive%20widget/Resposive%20ui/Mobile_page.dart';
import 'package:flutter_practical/Resposive%20widget/Resposive%20ui/Tablet_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ResponsiveLayout(
        mobilepage: MyMobilepage(),
        desktoppage: MyDesktoppage(),
        tabletpage: MyTabletpage(),

      ),

    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  Widget mobilepage;
  Widget tabletpage;
  Widget desktoppage;

  ResponsiveLayout({required this.mobilepage,required this.tabletpage, required this.desktoppage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth<600){
          // mobile
          return mobilepage;
        }else if(constraints.maxWidth<950){
          // Desktop
          return tabletpage;
        }
        else{
          // Desktop
          return desktoppage;
        }
      },
    );
  }
}

/*class MyResponsivePage extends StatelessWidget {
  const MyResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
      width < 600 ? Colors.grey.shade700 : Colors.grey.shade300,
      body: Center(
        child: Text(width.toString()),
      ),
    );
  }
}*/