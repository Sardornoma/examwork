import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../model/user_model.dart';

class Auth {
  var db = FirebaseDatabase.instance.ref();

  Future<bool> checkUser(String phone) async {
    phone = phone.replaceAll('-', '');
    phone = phone.replaceAll(' ', '');
    phone = phone.replaceAll('+998', '');
    print(phone);
    var res = await FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(phone)
        .get();
    if (res.exists) {
      return true;
    }
    return false;
  }

  Future createUser(UserData user) async {
    user.phone = user.phone.replaceAll('-', '');
    user.phone = user.phone.replaceAll(' ', '');
    user.phone = user.phone.replaceAll('+998', '');
    print(user.phone);
    await db.child('Users').child(user.phone).set(user.toMap());
  }

  Future<bool> loginUser(String phone,String password) async {
    phone = phone.replaceAll('-', '');
    phone = phone.replaceAll(' ', '');
    phone = phone.replaceAll('+998', '');
    var res = await db.child('Users').child(phone).get();
    if (res.exists) {
      var json = (res.value as Map);
      if(json['password'].toString().trim() == password){
        return true;
      }
    }
    return false;
  }
}
