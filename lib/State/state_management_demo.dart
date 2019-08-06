import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//使用scoped_model传递数据
class StateMangmentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel(
      model: ConuterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateMangmentDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapperForScopedModel(),
        floatingActionButton: ScopedModelDescendant<ConuterModel>(
          //不需要重建
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.increaseCount,
              ),
        ),
      ),
    );
  }
}

//使用InheritedWidget传递参数
class StatefulManagementDemo extends StatefulWidget {
  @override
  _StatefulManagementDemoState createState() {
    return _StatefulManagementDemoState();
  }
}

class _StatefulManagementDemoState extends State<StatefulManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count++;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StatefulManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _increaseCount();
            }),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用直接用CounterProvider获取
    final int conut = CounterProvider.of(context).count;

    //从父辈那传递回调
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    // TODO: implement build
    return ActionChip(
      onPressed: increaseCount,
      label: Text('$conut'),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  //构造of(context)方法 传递子控件
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //决定通知是否继承子控件
    return true;
  }
}

//使用scoped_model传递数据
class ConuterModel extends Model {
  int _count = 0;

  //getter方法
  int get count => _count;

  void increaseCount() {
    _count += 1;
    //监听小控件的方法
    notifyListeners();
  }
}

class CounterWrapperForScopedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CounterForScopedModel(),
    );
  }
}

class CounterForScopedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<ConuterModel>(
      builder: (context, _, model) => ActionChip(
            onPressed: model.increaseCount,
            label: Text('${model.count}'),
          ),
    );
  }
}
