import 'package:flutter/material.dart';

import 'common/screens/home_screen.dart';


class FBcrud extends StatelessWidget {
  const FBcrud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFire Samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'OpenSans',
      ),
      // home: SignInScreen(),
      home: const HomeScreen(),
    );
  }
}
