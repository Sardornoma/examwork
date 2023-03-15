import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: ElevatedButton(
        onPressed: (){ GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: <String>[
        'email',
          'https://www.googleapis.com/auth/contacts.readonly',
            ],
          );
        },
        child: Text('google'),),
      ),
    );
  }
}
