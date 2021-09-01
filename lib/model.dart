import 'globals.dart';
//1. Concatenation Function
conCat(str){
  if(expressionStr == '0.0'){
    expressionStr = str;
  } else{
    try{
      int.parse(str);
      expressionStr = expressionStr + str;
    } catch(err) {
      if(str == '.'){
        expressionStr = expressionStr + str;
      }else {
        expressionStr = expressionStr + ' ' + str + ' ';
      }
    }
  }
}

//2. Clear Entry
clearEntry(){
  if(expressionStr[expressionStr.length-1] == ' '){
    expressionStr = expressionStr.substring(0, expressionStr.length-2);
  }else {
    expressionStr = expressionStr.substring(0, expressionStr.length-1);
  }
}

//3. Clear All
clearAll(){
  expressionStr = '0.0';
  resultStr = '0.0';
}

//4. Evaluate
evaluate(){
  if(isExpressionStringValid() == false){
    return;
  }
  // removing '=' at the end of the string
  var str = expressionStr.substring(0, expressionStr.length-2);


  // Step i. Splitting
  var splitString = str.split(' ');
  splitString.removeWhere((value) => value == '');

  print('Split string: ');
  print(splitString);

  // Step ii. Infix to Postfix Conversion
  var operatorStack = Stack();
  var postfixList = [];

  // scan the token list from Left to Right
  for(var i=0; i<splitString.length; i++){
    try{
      double.parse(splitString[i]);

      // if token is an operand (a double); Append it to the the postfix list
      postfixList.add(splitString[i]);
    }catch(err){

      // if token is an operator; Push to stack
      pushOntoOperatorStack(operatorStack, postfixList, splitString[i]);
    }
  }

  // empty the operatorStack while appending the the operators to the postfixList
  while(!operatorStack.isEmpty){
    postfixList.add(operatorStack.pop());
  }

  print('Postfix: ');
  print(postfixList);

  // Step iii. Evaluate the postfix expression
  try {
    postfixEvaluation(postfixList);
  } catch(err) {
    print('Postfix evaluation error: ');
    print(err);
    resultStr = 'error';
    return;
  }

  print('Result: ');
  print(resultStr);
}

pushOntoOperatorStack(stack, list, str){
  if (stack.isEmpty == true) {
    stack.push(str);
    return;
  }

  else if(str == '\u2768'){ // ( => Opening brackets
    stack.push(str);
  }

  else if(str == '\u2769'){ // ) => Closing brackets
    var poppedValue = stack.pop();

    while(poppedValue != '\u2768' && stack.isEmpty != true){
      list.add(poppedValue);

      poppedValue = stack.pop();
    }
  }

  else {
    if (precedenceCheck(stack.top(), str) == true) { // 'str' is of higher precedence
      stack.push(str);
      return;
    } else {
      list.add(stack.pop());
      pushOntoOperatorStack(stack, list, str);
    }
  }
}

precedenceCheck(str1, str2){
  // returns TRUE when str2 is of higher precedence

  // OPERATORS: '\u00F7': Division   |   '\u00D7': Multiplication    |   '\u002B': Addition    |   '\u2212': Subtraction

  if(str2 == '\u00F7'){
    return true;
  } else if(str2 == '\u00D7' && (str1 == '\u002B' || str1 == '\u2212')){
    return true;
  }else if(str2 == '\u002B' && ( str1 == '\u2212')){
    return true;
  }else if(str2 == '\u2212'){
    return true;
  }else if(str1 == '\u2768'){
    return true;
  }else {
    return false;
  }
}

postfixEvaluation(list){
  var numberStack = Stack();

  double operand1;
  double operand2;

  var resultTemp;

  for(var i = 0; i<list.length; i++){
    try {
      // push numbers onto the numberStack
      double.parse(list[i]);
      numberStack.push(list[i]);

    }catch(err) { // //if operator:
      // pop the top two numbers in the numberStack
      operand1 = double.parse(numberStack.top().toString());
      numberStack.pop();
      operand2 = double.parse(numberStack.top().toString());
      numberStack.pop();

      // perform operation
      resultTemp = calculate(operand2, operand1, list[i]);

      // push the result back onto the numberStack
      numberStack.push(resultTemp);
    }
  }

  resultStr = numberStack.pop().toString();
}

calculate(num2, num1, operator){
  if(operator == '\u00F7'){ // division
    return num2 / num1;
  }
  else if(operator == '\u00D7'){  // multiplication
    return num2 * num1;
  }
  else if(operator == '\u002B'){  //addition
    return num2 + num1;
  }
  else if(operator == '\u2212'){  //subtraction
    return num2 - num1;
  }
}

isExpressionStringValid(){
  if(expressionStr.contains('\u00F7  \u00F7') || expressionStr.contains('\u00D7  \u00D7') ||
      expressionStr.contains('\u00F7  \u00D7') || expressionStr.contains('\u00D7  \u00F7')){

    // expressions like  6 * * 6 are INVALID
    resultStr = 'invalid entry';
    return false;
  }

  else{
    if(
    expressionStr.contains('\u002B  \u002B') || expressionStr.contains('\u002B  \u2212') ||
        expressionStr.contains('\u2212  \u2212') || expressionStr.contains('\u2212  \u002B')
    ){
      // expressions like  6 + - 6 are VALID
      expressionStr = expressionStr.replaceAll('\u002B  \u002B', '\u002B'); // + + = +
      expressionStr = expressionStr.replaceAll('\u002B  \u2212', '\u2212'); // + - = -
      expressionStr = expressionStr.replaceAll('\u2212  \u2212', '\u2212'); // - - = -
      expressionStr = expressionStr.replaceAll('\u2212  \u002B', '\u002B'); // - + = +
    }
    return true;
  }
}