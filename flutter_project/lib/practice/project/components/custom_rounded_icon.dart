import 'package:flutter/material.dart';

class CustomeRoundedIcon extends StatelessWidget {

  IconData iconData;
  VoidCallback onPress;

  CustomeRoundedIcon({required this.iconData,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed:onPress,
        elevation: 5,
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Icon(iconData,color: Colors.black45),
      ),
    );
  }
}
