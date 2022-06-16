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
          "active": 1,
          "token": "0E984725-C51C-4BF4-9960-E1C80E27ABA0"
        };
        return User.fromJson(_res);
      }
      throw Exception('mobile/password was wrong');
    });
  }

  static Future<User> verifyByToken(String token) async {
    return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token == "0E984725-C51C-4BF4-9960-E1C80E27ABA0") {
        Map<String, dynamic> _res = {
          "id": 1,
          "name": "hassan",
          "family": "hassani",
          "mobile": "12345",
          "type": 1,
          "active": 1,
          "token": "0E984725-C51C-4BF4-9960-E1C80E27ABA0"
        };
        return User.fromJson(_res);
      }
      throw Exception('mobile/password was wrong');
    });
  }
}
