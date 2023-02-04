import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:  Image(
        image: AssetImage('assets/images/home_page.png'),
        height: 1500,
      ),),
      
    );
  }
}