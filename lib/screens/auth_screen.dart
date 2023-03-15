import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:exes/client/authentification.dart';
import 'package:exes/model/user_model.dart';
import 'package:exes/utils/constants.dart';
import 'package:exes/widgets/loading.dart';

import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Auth auth = Auth();
  bool? isLogin;
  bool isRegister = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constant.bgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.055),
                padding: const EdgeInsets.all(8),
                width: size.width * 0.4,
                child: Image.network(
                    "https://cdn.paycom.uz/documentation_assets/payme_03.png?target=_blank"),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Telefon raqam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                            TextField(
                              controller: loginController,
                              keyboardType: TextInputType.number,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '+998 ## ###-##-##',
                                  filter: {"#": RegExp(r'[0-9]')},
                                )
                              ],
                              onChanged: (value) async {
                                if (value.length == 17) {
                                  loading(context);
                                  bool res = await auth.checkUser(value);
                                  print(res);
                                  isLogin = res;
                                  passwordController.clear();
                                  Navigator.pop(context);
                                }
                              },
                              onSubmitted: (value) async {
                                if (value.length == 17) {
                                  loading(context);
                                  bool res = await auth.checkUser(value);
                                  print(res);
                                  Navigator.pop(context);
                                }
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 16),
                                fillColor: Constant.textBackColor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Constant.textBackColor,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isLogin != null
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      isLogin != null
                                          ? isLogin == true
                                              ? "Parolingizni kiriting"
                                              : "Parol oylab toping"
                                          : '',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                  TextField(
                                    controller: passwordController,
                                    obscureText: showPassword,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                    onChanged: (value) async {},
                                    onSubmitted: (value) async {},
                                    decoration: InputDecoration(
                                      suffix: InkWell(
                                          onTap: () {
                                            showPassword = !showPassword;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            showPassword
                                                ? CupertinoIcons.eye
                                                : CupertinoIcons.eye_slash,
                                            color: Colors.white,
                                          )),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 16),
                                      fillColor: Constant.textBackColor,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: Constant.textBackColor,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
              isLogin != null && !isLogin!
                  ? isRegister
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '''"Ro'yxatdan o'tish" tugmasini bosgan holda Siz''',
                              children: [
                                TextSpan(
                                    text:
                                        '\nfoydalanish sahrtlarini qabul qilgan xisoblanasiz',
                                    style: TextStyle(
                                        color: Constant.BottonColor,
                                        decoration: TextDecoration.underline))
                              ],
                            ),
                          ),
                        )
                  : Container(),
              Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constant.BottonColor,
                          fixedSize: Size(size.width * .9, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () async {
                        if (isLogin != null && !isLogin!) {
                          setState(() {
                            isRegister = true;
                          });
                          await auth.createUser(UserData(
                              name: '',
                              phone: loginController.text.trim(),
                              password: passwordController.text.trim()));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false);
                        } else {
                          var res = await auth.loginUser(
                              loginController.text.trim(),
                              passwordController.text.trim());
                          if (res) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                                (route) => false);
                          }
                        }
                      },
                      child: Text(isLogin != null && !isLogin!
                          ? isRegister
                              ? 'Tayyor'
                              : "Ro'yxatdan o'tish"
                          : "Kirish")))
            ],
          ),
        ),
      ),
    );
  }
}
