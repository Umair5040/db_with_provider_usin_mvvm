import 'package:db_with_provider_usin_mvvm/screens/home%20page/home_page.dart';
import 'package:db_with_provider_usin_mvvm/screens/intro%20page/intro_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings rs){

switch (rs.name) {
  case IntroPage.pageName:
    return CustomNaviationAnimation(child: const IntroPage());
  case HomePage.pageName:
  return CustomNaviationAnimation(child: const HomePage());
    
  default:
  return CustomNaviationAnimation(child: Scaffold(body: Center(child: Text('ERROR FOUND DURING NAVIGATION'),)));
}


}


class CustomNaviationAnimation extends PageRouteBuilder  {
  
final Widget child;

CustomNaviationAnimation({required this.child}): super(pageBuilder: (context, animation, secondaryAnimation) {
return child;
},

transitionsBuilder: (context, animation, secondaryAnimation, child) {

  return FadeTransition(opacity: animation.drive(Tween(begin: 0.0, end: 1.0)), child:  child,);
},
);


}