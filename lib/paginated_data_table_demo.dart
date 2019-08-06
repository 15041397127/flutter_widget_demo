import 'package:flutter/material.dart';
import 'post.dart';

class PostsDataSource extends DataTableSource {
  List<Post> _posts = posts;

  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => _posts.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    final Post post = _posts[index];
    // TODO: implement getRow
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(
          Text(post.title),
        ),
        DataCell(
          Text(post.author),
        ),
        DataCell(
          Image.network(post.imageUrl),
        ),
      ],
    );
  }

  void _sort(getField(post),bool ascending){
    _posts.sort((a,b){
      if(!ascending){
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);

    });

    //监听通知 排序
    notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() {
    return _PaginatedDataTableDemoState();
  }
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  final PostsDataSource _postsDataSource = PostsDataSource();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              header: Text('Posts'),
              source: _postsDataSource,
              //每页显示几个
              rowsPerPage: 5,
              //选择对第几列排序
              sortColumnIndex: _sortColumnIndex,
              //选择是升序还是降序排序
              sortAscending: _sortAscending,
              //定制全选功能
//                onSelectAll: (bool vale){},
              columns: [
                DataColumn(
                    label: Text('tilte'),
                    //表格排序
                    onSort: (int columnindex, bool ascending) {
                      //获取用post.title 来排序
                      _postsDataSource._sort((post) => post.title.length,ascending);
                      setState(() {
                        _sortAscending = ascending;
                        _sortColumnIndex = columnindex;
                      });
                    }),
                DataColumn(
                  label: Text('author'),
                ),
                DataColumn(
                  label: Text('image'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
