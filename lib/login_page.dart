import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Instagram Clon',
              style: TextStyle(
                fontSize: 40.0, fontWeight: FontWeight.bold
              ),
              
            ),
            Padding(padding: EdgeInsets.all(40)),
            SignInButton(
              Buttons.GitHub, onPressed: () {},
            ),
            Padding(padding: EdgeInsets.all(50)),
          ],
        ),
      )
    );
  }
}
