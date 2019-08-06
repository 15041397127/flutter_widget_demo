import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() {
    return _StreamDemoHomeState();
  }
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;

  //使用StreamController控制stream
  StreamController<String> _streamDemo;

  //使用sink 往stream添加数据
  StreamSink _sinkDemo;
  String _data =  '...';



  @override
  void dispose() {
    // TODO: implement dispose
    //移除stream
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('Create a Stream');
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    //使用StreamController  //只有一次订阅
//    _streamDemo = StreamController<String>();

    //多次订阅
    _streamDemo = StreamController.broadcast();

    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream');

    //监听steam
//    _streamDemoSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
    //使用StreamController 多次订阅
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
       _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);


    print('Initialize completed');
  }

  void onDone() {
    print('Done!');
  }

  void onError(error) {
    print('Error:$error');
  }

  void onData(String data) {
    print('$data');
  }

  void onDataTwo(String data) {
    setState(() {
      _data = data;
    });
    print('onDataTwo:$data');
  }



  void _pauseStream(){

    print('Pause subscription');
    //暂停订阅
    _streamDemoSubscription.pause();
  }

  void _reumeStream(){

    print('Reume subscription');
    //恢复订阅
    _streamDemoSubscription.resume();
  }


  void _cancelStream(){

    print('Cancel subscription');
    //取消订阅
    _streamDemoSubscription.cancel();
  }

  //使用StreamController控制stream
  void _addDataToStream() async{
    
    print('Add data to stream');

    String data = await fetchData();

//    _streamDemo.add(data);
     _sinkDemo.add(data);
    
  }

  Future<String> fetchData() async {
    //异步延迟
    await Future.delayed(Duration(seconds: 3));

//    final String error = "something";
//
//    try {
//
//    } catch (error) {
//      throw error;
//    }

//    throw 'something is hanppen';

    return 'hello~';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context,snapshot){
                return Text('${snapshot.data}');
              },
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Pause'),
                    onPressed: _pauseStream,
                  ),
                  FlatButton(
                    child: Text('Reume'),
                    onPressed: _reumeStream,
                  ),
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: _cancelStream,
                  ),
                  FlatButton(
                    child: Text('Add'),
                    onPressed: _addDataToStream,
                  ),

                ],
              ),

            ],
          ),
      )

    );
  }
}
