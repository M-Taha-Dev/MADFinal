import 'package:flutter/material.dart';
import './controllers/login_controller.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(

      // body of our ui

      body: loginUI(),
    );
  }

  // creating a function loginUI

  loginUI() {

    // loggedINUI
    // loginControllers

    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in
      if (model.userDetails != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControllers(context);
      }
    });
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      // our ui will have 3 children, name, email, photo , logout button

      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 50,
        ),

        Text(model.userDetails!.displayName ?? ""),
        Text(model.userDetails!.email ?? ""),

        // logout
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<LoginController>(context, listen: false).logout();
            })
      ],
    );
  }

  loginControllers(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: ElevatedButton(
                child: Text('Google'),
                onPressed: () {
                  Provider.of<LoginController>(context, listen: false)
                      .googleLogin();
                },
              ),
              onTap: () {

              }),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              child: ElevatedButton(
                onPressed: () {  Provider.of<LoginController>(context, listen: false)
                    .facebooklogin(); },
                child: Text('Facebook'),

              ),
              onTap: () {
                Provider.of<LoginController>(context, listen: false)
                    .facebooklogin();
              }),
        ],
      ),
    );
  }
}
