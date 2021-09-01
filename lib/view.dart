import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart';

class View extends StatefulWidget {
  final onButtonPress;

  const View({this.onButtonPress});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {

  // STYLING
  final expressionStrTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Crushnumberinggothic',
    fontSize: 25.0,
  );
  final titleTextStyle = TextStyle(
    color: Colors.green,
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 4.0,
  );
  //============================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            //1. Container for expressionStr
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                expressionStr,
                textAlign: TextAlign.right,
                style: expressionStrTextStyle,
              ),
            ),


            //2. Container for resultStr
            Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.grey[850],

              child: Text(
                resultStr,
                textAlign: TextAlign.right,

                style: TextStyle(
                  color: (resultStr == 'invalid entry') || (resultStr == 'error') || (resultStr == 'Infinity')  ? Colors.red : Colors.green,
                  fontFamily: (resultStr == 'invalid entry') || (resultStr == 'error') || (resultStr == 'Infinity') ? 'Montserrat' : 'Crushnumberinggothic',
                  fontSize: (resultStr == 'invalid entry') || (resultStr == 'error') || (resultStr == 'Infinity') ? 20.0 : 25.0,
                ),
              ),
            ),


            //3. ROW1 => 7| 8 | 9 | ( | )
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  ButtonWidget(str: '7', buttonType: "num", onButtonPress: widget.onButtonPress),
                  ButtonWidget(str: '8', buttonType: "num", onButtonPress: widget.onButtonPress),
                  ButtonWidget(str: '9', buttonType: "num", onButtonPress: widget.onButtonPress),
                  ButtonWidget(str: '\u2768', buttonType: "text", onButtonPress: widget.onButtonPress),
                  ButtonWidget(str: '\u2769', buttonType: "text", onButtonPress: widget.onButtonPress),
                ],
            ),


            //4. ROW2 =>  4 | 5 | 6 | * | /
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ButtonWidget(str: '4', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '5', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '6', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '\u00D7', buttonType: "text", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '\u00F7', buttonType: "text", onButtonPress: widget.onButtonPress),
              ],
            ),


            //5. ROW3 => 1 | 2 | 3 | + | -
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ButtonWidget(str: '1', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '2', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '3', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '\u002B', buttonType: "text", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '\u2212', buttonType: "text", onButtonPress: widget.onButtonPress),
              ],
            ),


            //6. ROW4 => . | 0 | CE | AC | =
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ButtonWidget(str: '.', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '0', buttonType: "num", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: 'CE', buttonType: "CE", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: 'AC', buttonType: "AC", onButtonPress: widget.onButtonPress),
                ButtonWidget(str: '=', buttonType: "=", onButtonPress: widget.onButtonPress),
              ],
            ),
          ],

        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final str;
  final buttonType;
  final onButtonPress;

  ButtonWidget({this.str, this.buttonType, this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Text(
          str,
          style: buttonType == 'num' ?

          TextStyle(
            color: Colors.white54,
            fontFamily: 'Crushnumberinggothic',
            fontSize: 30.0,
          )

              :
          TextStyle(
            color: (buttonType == 'CE') || (buttonType == 'AC') ? Colors.red : Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),

        ),

        onPressed: (){
          onButtonPress(str);
        },
      ),
    );
  }
}





