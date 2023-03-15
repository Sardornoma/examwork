import 'package:flutter/material.dart';
import 'package:exes/utils/constants.dart';

import 'auth_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constant.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.055),
              padding: const EdgeInsets.all(8),
              width: size.width * 0.4,
              child: Image.network(
                  "https://cdn.paycom.uz/documentation_assets/payme_03.png?target=_blank"),
            ),
            Container(
              height: size.height * 0.23,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AuthScreen();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "РУССКИЙ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(
                      color: Constant.anyBottonc,
                      thickness: 1,
                      endIndent: size.width * 0.35,
                      indent: size.width * 0.35),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AuthScreen();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        "O'ZBEKCHA",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  Divider(
                      color: Constant.anyBottonc,
                      thickness: 1,
                      endIndent: size.width * 0.35,
                      indent: size.width * 0.35),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AuthScreen();
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text("ENGLISH",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: const Text(
                "Talqin 2.36.56",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
