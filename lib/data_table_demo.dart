import 'package:flutter/material.dart';
import 'post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() {
    return _DataTableDemoState();
  }
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
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
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortAscending = ascending;
                          _sortColumnIndex = index;

                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }

                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(
                    label: Text('author'),
                  ),
                  DataColumn(
                    label: Text('image'),
                  ),
                ],
                rows: posts.map((post) {
                  return DataRow(
                      //选择框
                      selected: post.selected,
                      onSelectChanged: (bool value) {
                        setState(() {
                          if (post.selected != value) {
                            post.selected = value;
                          }
                        });
                      },
                      cells: [
                        DataCell(
                          Text(post.title),
                        ),
                        DataCell(
                          Text(post.author),
                        ),
                        DataCell(
                          Image.network(post.imageUrl),
                        ),
                      ]);
                }).toList()),
          ],
        ),
      ),
    );
  }
}
