import 'package:flutter/material.dart';

void snackbar( BuildContext context,String title, {Color color=Colors.green, Duration duration= const Duration(seconds: 1)}){

ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title), backgroundColor: color, duration: duration, margin: EdgeInsets.symmetric(vertical: 50),behavior: SnackBarBehavior.floating, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),));

}