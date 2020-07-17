import 'package:flutter/material.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {
    final FirebaseUser user;
    TabPage(this.user);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectIndex = 0;

  List _pages;

  @override
  void initState() {  // 생성자 다음으로 실행됨 초기화 할때 주로 사용
    // TODO: implement initState
    super.initState();
    _pages =[
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:_pages[_selectIndex]),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectIndex,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('Account_circle')),
      ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
