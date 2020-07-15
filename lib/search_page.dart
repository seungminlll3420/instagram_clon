import 'package:flutter/material.dart';
import 'create_page.dart';
class SearchPage extends StatefulWidget {
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));   // 페이지 이동방법....
        },
    
    

        child: Icon(Icons.create),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
//   Widget _buildAppBar() {
//    return AppBar(
//      centerTitle: true,
//      title: Text(
//        'Instagram',
//        style: TextStyle(
//            fontWeight: FontWeight.bold
//        ),
//      ),
//    );
//   }
//
  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          childAspectRatio: 1.0, // 이미지 크기(정사각형)
          mainAxisSpacing: 1.0,  // 이미지 사이 규격
          crossAxisSpacing: 1.0 ), // 이미지 사이 규격
          itemCount: 6,            // 이미지 개수
        itemBuilder: (context, index){
          return _buildListItem(context, index);
         }
    );



  }

Widget _buildListItem(BuildContext context, int index) {
  return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMlHzLpZO5BmjfvHtLulq4XshtUO-Sp8uwOg&usqp=CAU', fit: BoxFit.cover,);
}

