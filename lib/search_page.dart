import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/detail_post_page.dart';
import 'create_page.dart';
class SearchPage extends StatefulWidget {
  final FirebaseUser user;
  SearchPage(this.user);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));   // 페이지 이동방법....
        },
    
    

        child: Icon(Icons.create),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('post').snapshots(), // post 폴더 안 데이터가 변경이 되면 실행

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData){ // 데이터가 없으면
          return Center(child: CircularProgressIndicator()); //로딩화면
        }else{  // 데이터가 있다면
          var items = snapshot.data?.documents ?? []; // documents 모든 데이터를 가져옴 // 그 비어있음면 [] NULL을 넣어줌
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
                  childAspectRatio: 1.0, // 이미지 크기(정사각형)
                  mainAxisSpacing: 1.0,  // 이미지 사이 규격
                  crossAxisSpacing: 1.0 ), // 이미지 사이 규격
              itemCount: items.length,            // 이미지 개수
              itemBuilder: (context, index){
                return _buildListItem(context, items[index]); // 하나하나 이미지 만드는 부분
              }
          );
        }
      },
    );



  }

Widget _buildListItem(context, document) { // 타입이 모호한 경우 쓰지 않아도 됨.
  return Hero(
    tag: document['photoUrl'],
    child: Material(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailPostPage(document);
          }));
        },
        child: Image.network(
          document['photoUrl'],
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

