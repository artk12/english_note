

import 'package:flutter/cupertino.dart';

class RefreshProvider extends ChangeNotifier{

  void refresh(){
    notifyListeners();
  }
}