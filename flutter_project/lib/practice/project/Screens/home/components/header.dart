import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/project/components/custom_rounded_icon.dart';
import 'package:flutter_practical/practice/project/components/search_field.dart';

class LayoutHeader extends StatefulWidget {
  const LayoutHeader({super.key});

  @override
  State<LayoutHeader> createState() => _LayoutHeaderState();
}

class _LayoutHeaderState extends State<LayoutHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeRoundedIcon(iconData:Icons.menu,onPress: () {
                Scaffold.of(context).openDrawer();
        },),
        SizedBox(width: 14,),
        Expanded(
            child: SearchField()),
        SizedBox(width: 14,),
        CustomeRoundedIcon(iconData:Icons.shopping_cart,onPress: () {

        },),
      ],
    );
  }
}
