import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loadingDialogBox(BuildContext context, String text ){

showCupertinoDialog(context: context, builder: (context) {
  
return AlertDialog(

title: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [ CupertinoActivityIndicator()],),

content: Row(mainAxisAlignment: MainAxisAlignment.center ,children: [
  Text(text)
],),

);

},);

  
}