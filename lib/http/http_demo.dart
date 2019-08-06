import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('HttpDemo'), elevation: 0.1,),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() {
    return _HttpDemoHomeState();
  }
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchPosts().then((value) => print(value));

    final post = {
      'title': 'hello',
      'decrition': '初次见面',
    };
    print(post['title']);
    print(post['decrition']);

    final postJson = json.encode(post);
    print(postJson);

    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']);
    print(postJsonConverted['decrition']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title:${postModel.title},description:${postModel.description}');
    print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
        'https://resources.ninghao.net/demo/posts.json');

    if (response.statusCode == 200) {
      final resposeBody = json.decode(response.body);

      //将网络数据转成 list的 model数据
      List<Post>posts = resposeBody['posts'].map<Post>((item) =>
          Post.fromJson(item)).toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }

    print('statusCode:${response.statusCode}');
    print('body:${response.body}');
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(

      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data:${snapshot.data}');
        print('connectionState:${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),

              );
            }).toList(),
        );
      },

    );
  }
}

class Post {

  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(this.title,
      this.description,
      this.id,
      this.author,
      this.imageUrl);

  //接受map类型数据  转换成post的型数据
  Post.fromJson(Map json)
      :title = json['title'],
        description = json['description'],
        id = json['id'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  // 转成json串
  Map toJson() =>
      {
        'title': title,
        'description': description,
      };
}
