import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() {
    return _AnimationDemoHomeState();
  }
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;

  //非线性动画
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
//      //初始默认值
//      value: 32.0,
//      //开始值
////      lowerBound: 0.0,
//      lowerBound: 32.0,
//      // 结束值
//      upperBound: 100.0,
      duration: Duration(milliseconds: 500),
      //显示帧
      vsync: this,
    );

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    //设置动画范围值(数字,颜色)
//    animation =  Tween(begin: 32.0,end: 100.0).animate(animationController);
//    animationColor = ColorTween(begin: Colors.red,end: Colors.red[900]).animate(animationController);

    animation = Tween(begin: 32.0, end: 100.0).animate(curvedAnimation);
    animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(curvedAnimation);

    //监听动画值
//    animationController.addListener(() {
//      print('${animationController.value}');
//
//      setState(() {});
//    });

    //动画运行状态
    animationController.addStatusListener((AnimationStatus statue) {
      if (statue == AnimationStatus.completed) {
        animationController.reverse();
      } else if (statue == AnimationStatus.dismissed) {
        animationController.forward();
      }
      print(statue);
    });

    //开始动画
//    animationController.forward();
  }

  //销毁
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
//      child: ActionChip(
//          label: Text('${animationController.value}'),
//          onPressed: () {
//            animationController.forward();
//          }),

//      child: IconButton(
//          icon: Icon(Icons.favorite),
//          color: animationColor.value,
//          iconSize: animation.value,
//          onPressed: () {
//             animationController.forward();
//
////            if(animationController.status == AnimationStatus.completed){
////              animationController.reverse();
////            }
//
////            switch (animationController.status) {
////              case AnimationStatus.completed:
////                animationController.reverse();
////                break;
////              case AnimationStatus.reverse:
////                animationController.forward();
////                break;
////              default:
////                animationController.forward();
////            };
//          },
//          ),

      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationController,
      ),
    );
  }
}

//AnimatedWidget 动画值有变化就自动重建自己的小控件
class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(Icons.favorite),
      color: animations[1].value,
      iconSize: animations[0].value,
      onPressed: () {
        controller.forward();
      },
    );
  }
}
