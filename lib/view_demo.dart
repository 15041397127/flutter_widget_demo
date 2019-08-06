import 'package:flutter/material.dart';
import 'post.dart';
import 'dart:io';
import 'network_image_ssl.dart';

class ViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuliderDemo();
  }
}

class GridViewBuliderDemo extends StatelessWidget {


  Widget _gridItemBuilder(BuildContext context,int index){

    return Container(

//      child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),

      child: Image(image: NetworkImageSSL(posts[index].imageUrl), fit: BoxFit.cover)

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//            crossAxisCount: 3,
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//        ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

          maxCrossAxisExtent: 150.0,
                   crossAxisSpacing: 8.0,
           mainAxisSpacing: 8.0,
      ),
        itemBuilder: _gridItemBuilder);
  }
}



class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buliderTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.orange[300],
        alignment: Alignment(0.0, 0.0),

        child: Text(
          'Item:$index',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      //交叉轴最大尺寸
      maxCrossAxisExtent:100.0 ,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
//      scrollDirection: Axis.horizontal,
      children: _buliderTitles(100),
    );
  }
}


class GridViewCountDemo extends StatelessWidget {

  List<Widget> _buliderTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),

        child: Text(
          'Item:$index',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
//      scrollDirection: Axis.horizontal,
      children: _buliderTitles(100),
    );
  }
}


class PageViewBulidDemo extends StatelessWidget {
  Widget _pageItemBulider(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            left: 8.0,
            bottom: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  posts[index].title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  posts[index].author,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBulider,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      scrollDirection: Axis.horizontal,
//       pageSnapping: false, 没意义
      // reverse: true,倒叙显示
      onPageChanged: (currentPage) {
        debugPrint('page:$currentPage');
      },
      controller: PageController(
          //初始页面
          initialPage: 1,
          //是否记住页面
//        keepPage: false,
          //占用比 以后可会用到轮播图
          viewportFraction: 0.85),

      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'THREE',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
