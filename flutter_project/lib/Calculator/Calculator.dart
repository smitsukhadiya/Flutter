import 'package:flutter/material.dart';
import 'package:flutter_practical/Calculator/Componant/button.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var que = '';
  var ans = '';
  List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '∻',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '',
    '=',
  ];
  bool getcolor(String text){
      if(text=='∻' || text=='X' || text=='-' || text=='+' || text=='=')
        return true;
      else
        return false;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                width:400,
               color: Colors.black,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [

                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                      que,
                       style: TextStyle(
                         fontSize: 35,
                         color: Colors.white
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.bottomRight,
                     child: Text(
                       ans,
                       style: TextStyle(
                           fontSize: 40,
                           color: Colors.white,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ),
                 ],
               ),
              ),
            ),
            Container(
              color: Colors.black,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
                itemBuilder: (context, index) {
                  if(buttons[index] =='AC'){
                    return mybutton(
                      ontapped: (){
                        setState(() {
                          que = '';
                          ans = '';
                        });
                      },
                      buttontext: buttons[index],
                      color:Colors.grey,
                      textcolor: Colors.white,
                    );
                  }else if (buttons[index] =='DEL'){
                    return  mybutton(
                      ontapped: (){
                        setState(() {
                        que = que.substring(0,que.length-1);
                        });
                      },
                  buttontext: buttons[index],
                  color:Colors.grey,
                  textcolor: Colors.white,
                  );
                  }else if (buttons[index] =='%'){
                    return mybutton(
                      ontapped:(){
                        setState(() {
                          que+= buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color:Colors.grey,
                      textcolor: Colors.white,
                    );
                  } else if (buttons[index] =='=') {
                    return mybutton(
                      ontapped: () {
                        setState(() {
                          equalsbuttonclicked();
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.orange,
                      textcolor: Colors.white,
                    );
                  } else {
                    return mybutton(
                      ontapped:(){
                        setState(() {
                          que+= buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color:getcolor(buttons[index])?Colors.orange:Colors.grey.shade700,
                      textcolor: Colors.white,
                    );
                  }
               },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalsbuttonclicked() {
    var finalquestion = que;
    finalquestion = finalquestion.replaceAll('X','*');
    finalquestion = finalquestion.replaceAll('∻','/');
    Parser p = Parser();
    Expression exp = p.parse(finalquestion);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL,cm);
    ans = result.toString(); // convert double to string
  }
}

