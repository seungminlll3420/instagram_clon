import 'package:flutter/material.dart';
import 'package:instagram_clon/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clon/tab_page.dart';
// 보여질 페이지를 정하는 페이지

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      builder: (BuildContext context, AsyncSnapshot snapshot){

        if(snapshot.hasData){
          return TabPage(snapshot.data);
        }else{
          return LoginPage();
        }
      },
    );
  }
}
