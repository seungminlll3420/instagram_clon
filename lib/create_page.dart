import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CreatePage extends StatefulWidget {
  final FirebaseUser user;
  CreatePage(this.user);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();   //  입력창 생성자
  File _image;
  @override
  void dispose() {   // 화면 전환시(_CreatePageState 클래스 소멸시 ) 위 입력창 메모리 해제를 위해
    // TODO: implement dispose
    textEditingController.dispose(); // 아래를 실행
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
  // 이미지 업로드 방식은 직접적으로 DB에 넣지 않는다. 그 이유는 비효율적이라서,
  // 그래서 firebase_storage라는 곳에 사진을 올리고 진짜 DB는 이미지가 저장된 firebase_storage의 url만 저장된다.
  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: (){  // 이미지 업로드
              final firebaseStorageRef = FirebaseStorage.instance  //
                  .ref()
                  .child('post')  // 저장할 폴더?라고 생각하면 될듯.
                  .child('${DateTime.now().millisecondsSinceEpoch}.png');  // 사진 이름(시간으로 이름을 정함)

              final task = firebaseStorageRef.putFile(  //파일 업로드
                _image, StorageMetadata(contentType: 'image/png'));  // 어떤 데이터인지를 정함

              task.onComplete.then((value){  // future 롤 업데이트 그래서 then 씀
                var downloadUrl = value.ref.getDownloadURL();  //
                downloadUrl.then((url){   // url을 얻었다면
                  var doc = Firestore.instance.collection('post').document(); //이제 데이터를 쓸려고함, 문서 형태고 씀씀
                  doc.setData({  // 제이슨 형태로 널어주자.
                    'id': doc.documentID,
                    'photoUrl': url.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayname': widget.user.displayName,
                    'userPhitUrl': widget.user.photoUrl
                  }).then((onValue){ // 비동기 형태
                    Navigator.pop(context); // 화면 닫고 이전 화면으로 감
                  });
                });
             });
            },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(   // 스크롤 가능
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(_image),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
            controller: textEditingController, //입력창
          )
        ],
      ),
    );
  }
  Future _getImage() async {

    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);  // await <-  비동기인 상태가 될수 있도록 함(카메라 클릭할때까지 기다림)
   setState(() {

     _image = image;

   });


  }

}

