import 'package:flutter/material.dart';
import 'dart:async';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    // TODO: implement build
    return Center(
      //根据Stream的值的变化 改更StreamBuilder里的控件变化
      child: StreamBuilder(
          initialData: 0,
          stream: _counterBloc.count,
          builder: (context, snapshot) {
            return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
//            _counterBloc.log();
                _counterBloc.counter.add(1);
              },
            );
          }),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    // TODO: implement build
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
//          _counterBloc.log();
          _counterBloc.counter.add(1);
        });
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  const CounterProvider({Key key, this.child, this.bloc
//    @required Widget child,
      })
      : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  //用stream输出数据
  final _countController = StreamController<int>();

  Stream<int> get count => _countController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _countController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _countController.close();
  }

  void log() {
    print('BLoC');
  }
}
