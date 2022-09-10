import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Drugs with ChangeNotifier {
  final _drugIds = [
    'childrens-triaminic-flu-cough-fever-childrens-tylenol-plus-cough-runny-nose-acetaminophen-chlorpheniramine-dextromethorphan-999369',
  ];

  // Map<String, Map<String, dynamic>> _drugs = {
  //   drugId:
  //       getDrugDetails(
  //           'childrens-triaminic-flu-cough-fever-childrens-tylenol-plus-cough-runny-nose-acetaminophen-chlorpheniramine-dextromethorphan-999369'),
  // };
  Map<String, Map<String, String>> _items = {
    'abatacept': {
      'Dosage & Indication': 'Injection,Iyophilized powder for reconsitution',
      'Interaction': 'Cntradicated...',
      'Adverse Effects': "Headacge(18%),Nasopharyngits(12%)",
      'Warning': 'None Listed by the manfucaturer',
      'Pregnancy':
          'Healthcare professional are encouraged to register patients and pregant women.',
      'Pharmacology': 'chemeric protein',
      'Adminstration':
          'Reconstitute each vial contents with 10ml sterile water for injection uisng Only the silicions-free.',
      'Image': 'Loading',
      'Formulary': 'Orenica,Orencia ClickJet'
    },
    'abacavir': {
      'Dosage & Indication':
          'Indicated for treatment of HIV infection in combination with other antirevorial agents.',
      'Interaction': 'Cntradicated...',
      'Adverse Effects': 'Nausea,Heache',
      'Warning': 'Hyoersentivity reactions',
      'Pregnancy':
          'Healthcare professional are encouraged to register patients and pregant women.',
      'Pharmacology':
          'Gaunsoine analog that inhibits HIV-1 reverse transcriptes by completing with dGTP.',
      'Adminstration':
          'Reconstitute each vial contents with 10ml sterile water for injection uisng Only the silicions-free.',
      'Image': 'Loading',
      'Formulary': 'Orenica,Orencia ClickJet'
    },
  };

  Map<String, Map<String, String>> get items {
    return _items;
  }

  List<String> get drugList {
    return _drugIds;
  }

  static Future<Map<String, dynamic>> getDrugDetails1(String drug) async {
    Map<String, dynamic> drugData = {};

    drug = "ultram-conzip-tramadol-343324";

    final url =
        'https://data.mongodb-api.com/app/application-0-otump/endpoint/readData?id=$drug';
    // final url = 'https://api.fda.gov/drug/label.json?search=openfda.brand_name.exact:$drug&limit=1';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    final extractedData = json.decode(response.body);

    drugData = Map<String, dynamic>.from(extractedData);
    // extractedMap

    return drugData;
  }

  static Future<Map<String, dynamic>> getDrugDetails(String drug) async {
    Map<String, dynamic> drugData = {};

    final data = await rootBundle.loadString('assets/data.txt');
    print(data);
    final extractedData = json.decode(data.toString());
    drugData = Map<String, dynamic>.from(extractedData);

    Map<String, dynamic> drugData2 = {};
    for (String key in drugData.keys) {
      if(drugData[key].toString().startsWith("{") && drugData[key].toString().endsWith("}")){
        final extractedData2 = json.decode(drugData[key].toString());
        drugData2[key] = Map<String, dynamic>.from(extractedData2);
      }else{
        drugData2[key] = drugData[key];
      }
    }
    return drugData2;
  }
}
