import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:temporary_switch_listview/models/pets.dart';

class PetsProvider extends ChangeNotifier {
  List<Data> _pets = [];
  List<Subcategories> _subpets = [];
  final String api = 'https://mocki.io/v1/c3cb26c7-9956-42cd-8537-c928647ae8d8';

  int get petsCount {
    return _pets.length;
  }

  Future fetchPets() async {
    try {
      final response = await Dio().get(api);
      if (response.statusCode == 200) {
        final data = response.data['data'];

        _pets = List<Data>.from(data.map((pets) => Data.fromJson(pets)));
        _subpets = List<Subcategories>.from(
            data.map((pets) => Subcategories.fromJson(pets)));
      } else {
        print(response.data);
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }

  UnmodifiableListView get pets {
    return UnmodifiableListView(_pets);
  }

  UnmodifiableListView get subpets {
    return UnmodifiableListView(_subpets);
  }
}
