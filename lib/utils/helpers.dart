import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Helpers{
  void  showSnackBar(BuildContext context , String mass , {bool error = false}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mass),
    backgroundColor: error? Colors.red : Colors.green,
    behavior: SnackBarBehavior.floating,
    ));
  }
}