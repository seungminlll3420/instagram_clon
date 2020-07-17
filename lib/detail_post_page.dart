import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  final dynamic document;
  DetailPostPage(this.document);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
            padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(document['photoUrl']),
                  ),
                  Padding(padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(document['email'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(document['displayname'])
                    ],
                  ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: document['photoUrl'],
                child: Image.network(document['photoUrl'])),

            Padding(padding: EdgeInsets.all(8),
             child: Text(document['contents']),)
          ],
        ),
      )
    );
  }
}
