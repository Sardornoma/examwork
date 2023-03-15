import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/constants.dart';

void loading(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                    blurRadius: 10
                  )
                ]
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: Constant.anyBottonc,
                  backgroundColor: Color(0xFFA9A9A9).withOpacity(0.1),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
