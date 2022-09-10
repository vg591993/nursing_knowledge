import 'package:flutter/material.dart';

class Conditions with ChangeNotifier {
  Map<String, dynamic> _conditionList = {
    'Allergy and Immunology': {
      'Allergy Pathogensis': {
        'Aeroallergens': {
          'Practice OverView': 'Both',
          'OverView': 'Something',
        }
      }
    },
    'Anesthesilogy': {
      'Crtical Events': {
        'Airway Energencies': {
          'Practice Essentials': 'Airway emegency develops',
          'Problem': 'A difficult airway',
        }
      }
    }
  };
  Map<String, dynamic> get items {
    return _conditionList;
  }
}
