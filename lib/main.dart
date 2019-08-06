import 'package:flutter/material.dart';
import 'drawer_demo.dart';
import 'bottom_navgation_bar_demo.dart';
import 'basic_demo.dart';
import 'layout_demo.dart';
import 'view_demo.dart';
import 'sliver_demo.dart';
import 'form.dart';
import 'material_compoments.dart';
import 'State/state_management_demo.dart';
import 'stream/stream_demo.dart';
import 'rxdart/rxdart_demo.dart';
import 'bloc/bloc_demo.dart';
import 'http/http_demo.dart';
import 'animation/animation_demo.dart';
import 'i18n/i18n_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'i18n/map/localization_demo.dart';
import 'i18n/intl/zx_demo_localizations.dart';//使用art创建的dart

//单元测试
import 'test/test_demo.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      locale: Locale('en','US'), //应用当前使用的语言

    //设置当前语言
//     localeResolutionCallback: (Locale locale,Iterable<Locale>supportedLocales){
//
//       return Locale('en','US');
//
//     },
      //国际化配置
      localizationsDelegates:[
        //添加本地资源的 语言
//        LocallizationsDelegateDemo(),
        LocallizationsDelegateDemo(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ] ,
      supportedLocales: [

        Locale('en','US'),
        Locale('zh','CN'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Material Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          //点击高亮颜色
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          //水波纹颜色
          splashColor: Colors.white70,
          accentColor: Colors.deepOrange,
      ),

//      home: Home(),
    //初始根路由
//      initialRoute: '/',

      initialRoute: '/unitTest',
      routes:{
        '/':(context) => Home(),
        '/form':(context) => FormDemo(),
        '/mdc':(context) => MarerialCompents(),
        '/state_managment':(context)=> StateMangmentDemo(),
        '/stream':(context)=> StreamDemo(),
        '/redart':(context)=> RxDartDemo(),
        '/bloc':(context)=> BlocDemo(),
        '/http':(context)=> HttpDemo(),
        '/animation':(context)=> AnimationDemo(),
        '/i18n':(context)=> I18nDemo(),
        '/unitTest':(context)=> TestDemo(),
      },
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Material Demo'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                debugPrint('哈哈哈');
              },
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_quilt),)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
//            Icon(
//              Icons.local_florist,
//              size: 128.0,
//              color: Colors.black12,
//            ),
           BasicDemo(),
           LayoutDemo(),
           ViewDemo(),
           SliverDmo(),
//            Icon(
//              Icons.change_history,
//              size: 128.0,
//              color: Colors.black12,
//            ),
//            Icon(
//              Icons.directions_bike,
//              size: 128.0,
//              color: Colors.black12,
//            )

          ],
        ),
        drawer: DrawerDemo(),
//        endDrawer:Text('侧拉抽屉'),
        bottomNavigationBar: BottomNavagtionBarDemo(),
      ),
    );
  }
}
