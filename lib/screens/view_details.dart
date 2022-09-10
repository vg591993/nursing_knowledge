import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  final title;
  final details;

  const ViewDetails({
    Key? key,
    this.title,
    this.details,
  }) : super(key: key);

//   @override
//   _ViewDetailsState createState() => _ViewDetailsState();
// }

// class _ViewDetailsState extends State<ViewDetails> {
  // List<ExpansionItem> work = <ExpansionItem>[
  //   ExpansionItem(header: "header", body: "This is the First Header"),
  //   ExpansionItem(header: "header1", body: "This is the Second Header"),
  //   ExpansionItem(header: "header2", body: "This is the Third Header"),
  // ];

  @override
  Widget build(BuildContext context) {
    // final _drugs = Provider.of<Medicines>(context).items;

    final List<String> _points = details.keys.toList();
    final List<String> _details = details.values.toList();
    // final List values = widget.items!.keys.toList();
    print(_points);

    // print(widget);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue[900],
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: _points.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              title: Text(_points[index]),
              children: [Text(_details[index])],
              // Container(
              //   child: ListTile(
              //     leading: Text(_points[index]),
              // trailing: Text(values[index]),
              // ),
              // ),
            );
          }),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: ExpansionPanelList(
      //         expansionCallback: (int index, bool isExpanded) {
      //           setState(() {

      //             work[index].isExpanded = !work[index].isExpanded;
      //           });
      //         },
      //         children: work.map((ExpansionItem item) {
      //           return ExpansionPanel(
      //               headerBuilder: (BuildContext context, bool isExpanded) {
      //                 return Container(
      //                   child: Text(item.header),
      //                 );
      //               },
      //               isExpanded: item.isExpanded,
      //               body: Container(
      //                 child: Text(item.body),
      //               ));
      //         }).toList(),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

// class ExpansionItem {
//   bool isExpanded;
//   final String header;
//   final String body;

//   ExpansionItem(
//       {required this.header, required this.body, this.isExpanded: false});
// }




  // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(top: 5),
        //         child: Card(
        //           child: ListTile(
        //             title: Text(
        //               widget.title,
        //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //             ),
        //             // subtitle: Text('Orenica, Orenica Clickjet'),
        //           ),
        //         ),
        //       ),
        //       Card(
        //         child: ListTile(
        //             onTap: () {},
        //             title: Text(
        //               "Health Directory",
        //               style: TextStyle(fontSize: 15.0),
        //             ),
        //             subtitle:
        //                 Text("Need to make a referral? Serach by specialty."),
        //             trailing: Icon(
        //               Icons.arrow_forward,
        //               size: 15.0,
        //             )),
        //       ),
        //       Card(
        //         child: ListView.builder(
        //           shrinkWrap: true,
        //           itemCount: _points.length,
        //           itemBuilder: (BuildContext ctx, int index) {
        //             return ListTile(
        //               onTap: () {},
        //               leading: Text(
        //                 _points[index],
        //                 style: TextStyle(fontSize: 18.0),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),