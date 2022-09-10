import 'package:flutter/material.dart';
import 'package:medical_services/providers/services/drugs.dart';
import './view_details.dart';
import 'drug_details.dart';

class ListViewPage extends StatefulWidget {
  final title;
  final List? items;
  ListViewPage({
    Key? key,
    this.title,
    this.items,
  }) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var itemDetails = {};
  var _isLoading = false;
  var _isInit = true;
  var _isDetail = true;

  // void getData(_itemName) async {
  //   itemDetails = await Drugs.getDrugDetails(_itemName);
  // }

  // @override
  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Drugs.getDrugDetails(widget.title)
  //         .then((value) => itemDetails = value);
  //     // if (itemDetails.entries.first.value is String) {
  //     // _isDetail = true;
  //     // }
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final List _itemNames = widget.items ?? [];
    // print(_itemNames);
    // getData(_itemNames[0]);

    print(_itemNames);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[900],
        title: Text(widget.title),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _itemNames.isEmpty
              ? Center(
                  child: Text("No Information Available"),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _itemNames.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Card(
                      child:
                          //  ExpansionTile(
                          //   //_itemNames[index] //items![_itemNames[index]]
                          //   title:
                          ListTile(
                        onTap: () async {
                          // var _drugData =
                          //     await Drugs.getDrugDetails(_itemNames[index]);
                          print(_isDetail);
                          if (_isDetail) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DrugDetails(
                                  title: _itemNames[index],
                                  // details: _drugData,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListViewPage(
                                      title: _itemNames[index],
                                      items: widget.items![_itemNames[index]],
                                    )));
                          }
                        },
                        title: Text(
                          _itemNames[index],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      //   children: [
                      //     Text(
                      //       _itemNames[index],
                      //       style: TextStyle(fontSize: 20),
                      //     ),
                      //     Container(
                      //       child: ViewDetails(
                      //         title: _itemNames[index],
                      //         details: _itemNames[index],
                      //       ),
                      //     )
                      //   ],
                      // ),
                    );
                  },
                ),
    );
  }
}
