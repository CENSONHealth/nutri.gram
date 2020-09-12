import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = "TOKENKEY";
const String _nameKey = "NAMEKEY";
const String _phoneKey = "PHONEKEY";
const String _oboardingKey = "ONBOARDINGKEY";

@lazySingleton
class SharedPreferencesService {
  final SharedPreferences _preferences;
  SharedPreferencesService(this._preferences);
  String get token => _preferences.getString(_tokenKey) ?? "";
  String get name => _preferences.getString(_nameKey) ?? "";
  String get phone => _preferences.getString(_phoneKey) ?? "";

  Future<void> saveData(String token, String name, String phone) async {
    await Future.wait([
      _preferences.setString(_tokenKey, token),
      _preferences.setString(_nameKey, name),
      _preferences.setString(_phoneKey, phone),
    ]);
    return;
  }

  Future<void> saveName(String name) async {
    await _preferences.setString(_nameKey, name);
    return;
  }

  Future<void> savePhone(String phone) async {
    await _preferences.setString(_phoneKey, phone);
    return;
  }

  Future<void> removeToken() async {
    await _preferences.remove(_tokenKey);
  }

  Future<void> removeName() async {
    await _preferences.remove(_nameKey);
  }

  Future<void> removePhone() async {
    await _preferences.remove(_phoneKey);
  }

  Future<void> setOnboardingVisited() async {
    await _preferences.setBool(_oboardingKey, true);
  }

  bool isOnboardingVisited() {
    try {
      return _preferences.getBool(_oboardingKey) ?? false;
    } catch (e) {
      return false;
    }
  }
}
