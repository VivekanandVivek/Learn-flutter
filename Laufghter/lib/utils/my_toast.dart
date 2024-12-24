import 'package:fluttertoast/fluttertoast.dart';

class MyToast {

  static toast(String mssg){
    Fluttertoast.showToast(msg: mssg
    );
  }

}