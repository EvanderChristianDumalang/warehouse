import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:database/provider/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140.0),
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0.0,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'Masuk',
                      style: TextStyle(color: Colors.black, fontSize: (50)),
                    ),
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                const SizedBox(height: 100),
                Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 300,
                    child: null),
                const SizedBox(height: 100),
                Container(
                  width: 25,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: ElevatedButton(
                    child: const Icon(Icons.vpn_key),
                    onPressed: () async {
                      dynamic result = await _auth.signInAnonymous();
                      if (result == null) {
                        if (kDebugMode) {
                          print('Error When Signing In');
                        }
                      } else {
                        if (kDebugMode) {
                          print('Sign In Successful');
                          print(result.uid);
                        }
                      }
                    },
                  ),
                ),
              ]),
        )));
  }
}
