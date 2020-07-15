import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CreatePage extends StatefulWidget {
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

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: (){},
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

