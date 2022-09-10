import 'package:flutter/material.dart';

import '../column_builder.dart';
import '../providers/services/drugs.dart';

class DrugDetails extends StatefulWidget {
  final title;
  // final details;

  const DrugDetails({
    Key? key,
    this.title,
    // this.details,
  }) : super(key: key);

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  var _isInit = true;
  var _isLoading = false;
  var details;
  List<dynamic> _points = [];
  // List<dynamic> _details = [];

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Drugs.getDrugDetails(widget.title).then((value) {
        setState(() {
          details = value;
          _points = details.keys.toList();
          _points.removeWhere((element) => element == '_id');

          // _details = details.values.toList();

          print('101-' + _points.toString());
          // print('101-' + _details.toString());
          _isLoading = false;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print(_points);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _points.length,
              itemBuilder: (BuildContext context, int index) {
                final data = details[_points[index]];
                return ExpansionTile(
                  title: Text(_points[index]),
                  children: [
                    data is String
                        ? Text(data)
                        : data is List
                            ? ShowListData(
                                details: data,
                              )
                            : Details(details: data),
                  ],
                );
              }),
    );
  }
}

class ShowListData extends StatelessWidget {
  const ShowListData({
    required this.details,
    Key? key,
  }) : super(key: key);
  final List details;
  @override
  Widget build(BuildContext context) {
    // details.removeWhere((element) => element == '');
    return details.isEmpty
        ? Container()
        : ColumnBuilder(
            crossAxisAlignment: CrossAxisAlignment.start,
            itemCount: details.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 5.0),
                alignment: Alignment.centerLeft,
                child: Text(details[index]),
              );
            },
          );
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required details,
  })  : _details = details,
        super(key: key);

  final _details;

  @override
  Widget build(BuildContext context) {
    final _data = _details == null ? {} : Map<String, dynamic>.from(_details);
    final _points = _data.keys.toList();

    return ColumnBuilder(
      // shrinkWrap: true,
      itemCount: _points.length,
      itemBuilder: (BuildContext context, int index) {
        final _heading = _points[index];
        final _content = _data[_heading];
        return _heading.toString() == 'INITIALIZER' && _content == ''
            ? Container()
            : ListTile(
                title: _heading.toString() == 'INITIALIZER'
                    ? Text(_content.toString())
                    : Text(_heading.toString()),
                subtitle: _heading.toString() == 'INITIALIZER'
                    ? null
                    : _content is String
                        ? Text(_content.toString())
                        : _content is List
                            ? ShowListData(
                                details: _content,
                              )
                            : Details(details: _content),
              );
      },
    );
  }
}
