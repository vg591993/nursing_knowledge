import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../providers/services/conditions.dart';
import '../providers/services/drugs.dart';
import '../providers/services/procedures.dart';
import '../screens/list_view_page.dart';

class ServicesPage extends StatelessWidget {
  final List _listItem = [
    Icons.medical_services_outlined,
    Icons.medical_services_outlined,
    Icons.medical_services_outlined,
    Icons.medical_services_outlined,
    Icons.medical_services_outlined,
    Icons.local_hospital_outlined,
    Icons.local_hospital_outlined,
    Icons.more_horiz,
  ];
  final List<String> _text = [
    "Drugs",
    "Procedures",
    "Conditions",
    "Calculators",
    "Injection",
    "Health",
    "Pill Indentifier",
    "More",
  ];

  final List<dynamic> page = [
    ListViewPage(title: 'Drugs', items: Drugs().drugList),
    // ListViewPage(title: 'Procedures', items: Procedures().items),
    // ListViewPage(title: 'Conditions', items: Conditions().items),
    // ViewCalculators(),
    // ViewTools(),
    // DrugDetails(),
  ];

  final _iconColor = Colors.green[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEDICAL SERVICES"),
      ),
      body: ListView(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(offset: Offset(0, 1), blurRadius: 2),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    hintText: "Search for Medicines and Health care"),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: _text.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // color: _actionButtonColor,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => page[index]));
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                _listItem[index],
                                color: _iconColor,
                                size: 40,
                              ),
                              Text(
                                _text[index],
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            child: Card(
              child: Center(child: Text('blogs')),
            ),
          ),
          Container(
            height: 250,
            child: Card(
              child: Center(child: Text('blogs')),
            ),
          ),
          Container(
            height: 250,
            child: Card(
              child: Center(child: Text('blogs')),
            ),
          ),
          Container(
            height: 250,
            child: Card(
              child: Center(child: Text('blogs')),
            ),
          ),
        ],
      ),
    );
  }
}
