import '../data_model/user.dart';

class UserRepo {
  static Future<User> authenticate(String mobile, String pass) async {
    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mobile == "3" && pass == "2") {
        Map<String, dynamic> _res = {
          "id": 1,
          "name": "hassan",
          "family": "hassani",
          "mobile": "12345",
          "type": 1,
          "active": 1
        };
        return User.fromJson(_res);
      }
      throw Exception('mobile/password was wrong');
    });
  }
}
