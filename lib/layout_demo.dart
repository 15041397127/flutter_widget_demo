import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          StackDemo(),
        ],
      ),
    );
  }
}

//IconBadge(Icons.pool),
//IconBadge(Icons.beach_access,size: 64.0,),
//IconBadge(Icons.airplanemode_active),

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200.0,
        maxWidth: 200.0,
      ),
      child: Container(
        color: Color.fromRGBO(77, 33, 254, 1.0),
      ),
    );
  }
}

class AspectRatioDemo extends StatelessWidget {
  //定义宽高比
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            //子部件对齐
            alignment: Alignment(0.0, -0.8),
//              alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 53, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 53, 255, 1.0),
//                   borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 54, 255, 1.0)
              ]),
            ),
            child: Icon(
              Icons.brightness_2,
              color: Colors.white,
              size: 32.0,
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          top: 120.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        Positioned(
          right: 70.0,
          top: 180.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 18.0,
          ),
        ),
        Positioned(
          right: 30.0,
          top: 230.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 12.0,
          ),
        ),
        Positioned(
          right: 90.0,
          bottom: 20.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 12.0,
          ),
        ),
        Positioned(
          right: 4.0,
          top: -4.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 10.0,
          ),
        ),
        Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
