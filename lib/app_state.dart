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
    _spotifyAuthToken =
        prefs.getString('ff_spotifyAuthToken') ?? _spotifyAuthToken;
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

  String _spotifyConnectionStatus = '';
  String get spotifyConnectionStatus => _spotifyConnectionStatus;
  set spotifyConnectionStatus(String _value) {
    _spotifyConnectionStatus = _value;
  }

  String _spotifyAuthToken = '';
  String get spotifyAuthToken => _spotifyAuthToken;
  set spotifyAuthToken(String _value) {
    _spotifyAuthToken = _value;
    prefs.setString('ff_spotifyAuthToken', _value);
  }

  bool _hasAuthToken = false;
  bool get hasAuthToken => _hasAuthToken;
  set hasAuthToken(bool _value) {
    _hasAuthToken = _value;
  }

  bool _spotifySdkConnected = false;
  bool get spotifySdkConnected => _spotifySdkConnected;
  set spotifySdkConnected(bool _value) {
    _spotifySdkConnected = _value;
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
