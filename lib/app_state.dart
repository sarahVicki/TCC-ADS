import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  List<LatLng> _salaoLocation = [];
  List<LatLng> get salaoLocation => _salaoLocation;
  set salaoLocation(List<LatLng> value) {
    _salaoLocation = value;
  }

  void addToSalaoLocation(LatLng value) {
    salaoLocation.add(value);
  }

  void removeFromSalaoLocation(LatLng value) {
    salaoLocation.remove(value);
  }

  void removeAtIndexFromSalaoLocation(int index) {
    salaoLocation.removeAt(index);
  }

  void updateSalaoLocationAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    salaoLocation[index] = updateFn(_salaoLocation[index]);
  }

  void insertAtIndexInSalaoLocation(int index, LatLng value) {
    salaoLocation.insert(index, value);
  }

  String _ProfEscolhido = '';
  String get ProfEscolhido => _ProfEscolhido;
  set ProfEscolhido(String value) {
    _ProfEscolhido = value;
  }
}
