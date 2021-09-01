import 'package:flutter/material.dart';
import 'view.dart';
import 'model.dart';

class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  onButtonPress(str){
    if(str == 'CE'){  // Clear Entry
      clearEntry();
    }
    else if(str == 'AC') {  // All Clear
      clearAll();
    }
    else if(str == '='){  // Evaluate
      conCat(str);
      evaluate();
    }
    else {
      conCat(str);
    }

    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return View(
      onButtonPress: onButtonPress,
    );
  }
}


