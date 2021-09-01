import 'dart:collection';

// GLOBAL VARIABLES
String expressionStr = '0.0';
String resultStr = '0.0';

// STACK
class Stack {
  final _stack = Queue();

  void push(element) {
    _stack.addLast(element);
  }

  pop() {
    final topElement = _stack.last;
    _stack.removeLast();
    return topElement;
  }

  top() {
    return _stack.last;
  }

  bool contains(element) {
    if(_stack.contains(element)){
      return true;
    }else{
      return false;
    }
  }

  bool get isEmpty => _stack.isEmpty;

  void clear() {
    _stack.clear();
  }

}
