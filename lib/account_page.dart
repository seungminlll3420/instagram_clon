import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AccountPage extends StatefulWidget {
  final FirebaseUser user;
  AccountPage(this.user);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _postCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firestore.instance.collection('post').where('email', isEqualTo: widget.user.email)
    .getDocuments()
    .then((snapShot){
      setState(() {
        _postCount = snapShot.documents.length;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  _buildAppBar(),
      body: _buildBody(),
    );
  }

   Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
      IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){}),
    ],
     );
   }

   Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl), // 여기선 widget.으로 접근한다. 그 이유는 위 user를 가져온 곳이 StatelessWidget 클래스라서.
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.white,

                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(onPressed: null,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(widget.user.displayName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0 ),
              )
            ],
          ),
          Text('$_postCount\n게시물',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15)
          ),
          Text('0\n팔로워',
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15)
          ),
          Text('0\n팔로잉',
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15)
          ),

        ],
      ),
    );
   }
}
