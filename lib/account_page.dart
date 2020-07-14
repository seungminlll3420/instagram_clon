import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMlHzLpZO5BmjfvHtLulq4XshtUO-Sp8uwOg&usqp=CAU'),
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
              Text('MOOMIN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0 ),
              )
            ],
          ),
          Text('0\n게시물',
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
