class UserData {
  String name;
  String phone;
  String password;

  UserData({
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'password': this.password,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'],
      password: map['password'],
      phone: map['phone'],
    );
  }
}
