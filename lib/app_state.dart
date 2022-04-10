import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _user = prefs.getString('ff_user') ?? _user;
    _category = prefs.getString('ff_category') ?? _category;
  }

  SharedPreferences prefs;

  String _user = '';
  String get user => _user;
  set user(String _value) {
    _user = _value;
    prefs.setString('ff_user', _value);
  }

  String _category = '';
  String get category => _category;
  set category(String _value) {
    _category = _value;
    prefs.setString('ff_category', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
