import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';


class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body:RxDartHomeDemo(),


    );
  }
}

class RxDartHomeDemo extends StatefulWidget {
  @override
  _RxDartHomeDemoState createState() {
    return _RxDartHomeDemoState();
  }
}

class _RxDartHomeDemoState extends State<RxDartHomeDemo> {

  PublishSubject<String>_textFieldSubject;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _textFieldSubject = PublishSubject<String>();
    
//    _textFieldSubject.listen((data)=>print(data));
//    _textFieldSubject.map((item)=>'item:$item').listen((data)=>print(data));

    //增加选择条件
//    _textFieldSubject.where((item)=>item.length>9).listen((data)=>print(data));

    //延迟执行 在多次数据请求的时候可以延迟
    _textFieldSubject.debounceTime(Duration(milliseconds: 500)).listen((data)=>print(data));

    
//    Observable<String>_observable = Observable(Stream.fromIterable(['hello','您好']));

    //使用future工厂方法创建
//    Observable<String>_observable = Observable.fromFuture(Future.value('hello~'));
    
    //可迭代的数据
//    Observable<String>_observable = Observable.fromIterable(['hello','您好']);

//    Observable<String>_observable = Observable.just('hello~');

    //间隔时间内重复次数  每隔3秒  返回的是重复的次数
//    Observable<String>_observable = Observable.periodic(Duration(seconds: 3),(x)=>x.toString() );


//    _observable.listen(print);

    /**
     * subjects 控制 Observable subjects类似 streamControlloer
     */

//    PublishSubject<String> _subject = PublishSubject<String>();

    //只打印最后一个
 //   BehaviorSubject<String> _subject = BehaviorSubject<String>();


    //都可以打印出来 可控制最大接受数据的个数
     ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2);

    _subject.add('hello');
    _subject.add('hhhhhh');
    _subject.add('hi');
    _subject.listen((data) => print('listen1:$data'));

//    _subject.add('hello');

    _subject.listen((data) => print('listen1:${data.toUpperCase()}'));

//    _subject.add('hhhhhh');

    _subject.close();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: TextField(
          onChanged: (value){
            _textFieldSubject.add('input:$value');
          },

          onSubmitted: (value){
            _textFieldSubject.add('submint:$value');
          },
          decoration: InputDecoration(
            
            labelText: 'Title',
            filled: true,
          ),
        ),
    );
  }
}
