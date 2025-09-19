import 'package:db_with_provider_usin_mvvm/screens/home%20page/home_page.dart';
import 'package:db_with_provider_usin_mvvm/utils/constant_imgs_paths.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static const pageName = 'intro_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {


@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(HomePage.pageName, (route) => false,);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(app_logo, height: 200, fit: BoxFit.fitHeight),
              const SizedBox(height: 70),
              context.read<Widget>(),
            ],
          ),
        ),
      ),
    );
  }
}
