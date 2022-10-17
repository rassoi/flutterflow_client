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
    _eddiMeal = prefs.getBool('ff_eddiMeal') ?? _eddiMeal;
    _Lunch = prefs.getString('ff_Lunch') ?? _Lunch;
    _Snacks = prefs.getString('ff_Snacks') ?? _Snacks;
    _Dinner = prefs.getString('ff_Dinner') ?? _Dinner;
    _upcommingMealTime =
        prefs.getString('ff_upcommingMealTime') ?? _upcommingMealTime;
  }

  late SharedPreferences prefs;

  String _user = '';
  String get user => _user;
  set user(String _value) {
    _user = _value;
    prefs.setString('ff_user', _value);
  }

  String _category = 'All';
  String get category => _category;
  set category(String _value) {
    _category = _value;
    prefs.setString('ff_category', _value);
  }

  bool _eddiMeal = false;
  bool get eddiMeal => _eddiMeal;
  set eddiMeal(bool _value) {
    _eddiMeal = _value;
    prefs.setBool('ff_eddiMeal', _value);
  }

  String Brakefast = 'Brakefast';

  String _Lunch = 'Lunch';
  String get Lunch => _Lunch;
  set Lunch(String _value) {
    _Lunch = _value;
    prefs.setString('ff_Lunch', _value);
  }

  String _Snacks = 'Snacks';
  String get Snacks => _Snacks;
  set Snacks(String _value) {
    _Snacks = _value;
    prefs.setString('ff_Snacks', _value);
  }

  String _Dinner = 'Dinner';
  String get Dinner => _Dinner;
  set Dinner(String _value) {
    _Dinner = _value;
    prefs.setString('ff_Dinner', _value);
  }

  String _upcommingMealTime = '1';
  String get upcommingMealTime => _upcommingMealTime;
  set upcommingMealTime(String _value) {
    _upcommingMealTime = _value;
    prefs.setString('ff_upcommingMealTime', _value);
  }

  String day = 'Today';

  bool Fav = false;
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
