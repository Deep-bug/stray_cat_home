import 'package:flutter/cupertino.dart';
class Counter with ChangeNotifier{
  int _count;
  Counter(this._count);
    void add(){
      _count++;
      notifyListeners();
    }
    // TODO: implement hashCode
  int get count => _count;

}