import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Moominstagram Clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),

      ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView( // 스크롤 가능
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Moominstagram에 오신 것을 환영합니다.',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)), // 간격 주는 방법 1 패딩 설정
                  Text(
                    '사진과 동영상을 보려면 팔로우하세요',
                  ),
                  Padding(padding: EdgeInsets.all(14.0)),
                  SizedBox(  // 감싸고 있는 위젯의 사이즈를 조절할 수 있음
                    width: 240.0,
                    child: Card(
                      elevation: 4.0, // 윤각?
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl), // 이미지 넣는 방법 1
                              )
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                           Text(
                               user.email,
                             style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            Text(user.displayName),
                            Padding(padding: EdgeInsets.all(5.0)),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                             children: <Widget>[

                               SizedBox(
                                 width: 60,
                                 height: 60,
                                 child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMlHzLpZO5BmjfvHtLulq4XshtUO-Sp8uwOg&usqp=CAU', fit: BoxFit.cover,), // 이미지 넣는 방법 2
                               ),
                               Padding(padding: EdgeInsets.all(1.0)),
                               SizedBox(
                                 width: 60,
                                 height: 60,
                                 child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR4o4tnvsv46hRFbzTlkfIEp-sWGK5iANl3fw&usqp=CAU', fit: BoxFit.cover,),
                               ),
                               Padding(padding: EdgeInsets.all(1.0)),
                               SizedBox(
                                 width: 60,
                                 height: 60,
                                 child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT8RhyK0voTNFjDO2FkTBFeptH381DSolKYlQ&usqp=CAU', fit: BoxFit.cover,),
                               )
                             ],
                           ),
                            Padding(padding: EdgeInsets.all(3.0)),
                            Text('Facebook 친구'),
                            Padding(padding: EdgeInsets.all(3.0)),
                           RaisedButton(
                               onPressed: (){},
                             child: Text('팔로우'),
                             color: Colors.blueAccent,
                             textColor: Colors.white,
                           ),
                            Padding(padding: EdgeInsets.all(3.0)),

                          ],
                        ),
                      ),
                    ),
                  )
            ],
          ),
        ),
      )),
    );
  }
}
