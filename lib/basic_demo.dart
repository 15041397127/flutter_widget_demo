import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(

            image: NetworkImage('http://wx1.sinaimg.cn/large/007NJS1agy1g54thcdwuoj30o2194wp1.jpg'),
          alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeatY
          fit: BoxFit.cover,
          //滤镜
          colorFilter: ColorFilter.mode(
              Colors.greenAccent[400].withOpacity(0.6),
              BlendMode.hardLight
          ),
        ),


      ),

//      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
//            color: Color.fromRGBO(3, 54, 255, 1.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.red[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
//              borderRadius: BorderRadius.circular(16.0),
                //切圆角
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
                //阴影
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 15.0),
                    color: Colors.orange,
                    blurRadius: 25.0,
                    spreadRadius: -9.0,

                  )
                ],
              //盒子形状   BoxShape.circle直接就是圆形
//              shape: BoxShape.circle,
            //渐变 镜像
//            gradient:RadialGradient(
//                colors: [
//                  Color.fromRGBO(7, 102, 255, 1.0),
//                  Color.fromRGBO(3, 28, 128, 1.0),
//                ]
//            ),
            //线性渐变
              gradient:LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,

              ),


            ),

//              border: Border(
//                top: BorderSide(
//                  color:Colors.red[100],
//                  width: 3.0,
//                  style: BorderStyle.solid
//                ),
//                bottom: BorderSide(
//                    color:Colors.red[100],
//                    width: 3.0,
//                    style: BorderStyle.solid
//                ),
//              ),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: '啥玩意儿啊',
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 34.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100,
        ),
        children: [
          TextSpan(
              text: '.net',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);
  final String _author = '新浪微博';
  final String _title = '洋务先驱张之洞';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '''
      $_author -- $_title :来自阿拉斯加对抗俄军前线的F-22，磨砂质感的吸波涂料非常容易挂住空气中的各种颗粒，也极易被机身各种漏液和加油机颜射弄脏，图中可见涂料多处龟裂，足见隐身机维护的不易。F-22的涂料早已不是最新技术，当前F-35使用的新一代涂料重点提高了可维护性，同时美空军还在和厂商探讨研发有色隐身涂料的可行性，未来有可能用于F-35假想敌单位。
      ''',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
