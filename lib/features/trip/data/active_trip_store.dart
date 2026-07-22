import 'package:shared_preferences/shared_preferences.dart';

class ActiveTripStore {
  static const _keyPrefix = 'selected_trip_id_';

  Future<String?> read(String userId) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('$_keyPrefix$userId');
  }

  Future<void> write({required String userId, required String? tripId}) async {
    final preferences = await SharedPreferences.getInstance();
    final key = '$_keyPrefix$userId';
    if (tripId == null) {
      await preferences.remove(key);
      return;
    }
    await preferences.setString(key, tripId);
  }
}
