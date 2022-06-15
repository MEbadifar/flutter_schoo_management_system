class User {
  late int id;
  late String name;
  late String family;
  late String mobile;
  late String? email;
  late int type;
  late String token;
  late bool active;
  late String? lastlogin;

  User(
      {required this.id,
      required this.name,
      required this.family,
      required this.mobile,
      this.email,
      required this.type,
      required this.token,
      required this.active,
      this.lastlogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    type = json['type'];
    token = json['token'];
    active = json['active'] == 1;
    lastlogin = json['lastlogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['family'] = family;
    data['mobile'] = mobile;
    data['email'] = email;
    data['type'] = type;
    data['token'] = token;
    data['active'] = active ? 1 : 0;
    data['lastlogin'] = lastlogin;
    return data;
  }

  String get tyoeName => type == 1
      ? 'Admin'
      : type == 2
          ? 'Teacher'
          : 'Student';
}
