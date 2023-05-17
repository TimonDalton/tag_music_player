import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _spotifyAccountStatus =
        prefs.getInt('ff_spotifyAccountStatus') ?? _spotifyAccountStatus;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _basePage = 0;
  int get basePage => _basePage;
  set basePage(int _value) {
    _basePage = _value;
  }

  int _spotifyAccountStatus = 0;
  int get spotifyAccountStatus => _spotifyAccountStatus;
  set spotifyAccountStatus(int _value) {
    _spotifyAccountStatus = _value;
    prefs.setInt('ff_spotifyAccountStatus', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
