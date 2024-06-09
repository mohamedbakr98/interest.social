import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedGenre = '';
  String get selectedGenre => _selectedGenre;
  set selectedGenre(String value) {
    _selectedGenre = value;
  }

  DocumentReference? _ViewedCardRef;
  DocumentReference? get ViewedCardRef => _ViewedCardRef;
  set ViewedCardRef(DocumentReference? value) {
    _ViewedCardRef = value;
  }
}
