import 'package:flutter/material.dart';
import 'package:instagram_clon/home_page.dart';
import 'package:instagram_clon/account_page.dart';
import 'package:instagram_clon/search_page.dart';
class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectIndex = 0;

  List _pages =[
    HomePage(),
    SearchPage(),
    AccountPage(),
  ];
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
