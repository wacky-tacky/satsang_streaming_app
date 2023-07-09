import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:satsang_app/screens/authenticate/sign_in.dart';
import 'package:satsang_app/screens/home/home.dart';
import 'package:satsang_app/shared/loading.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final _auth = FirebaseAuth.instance;
  User? _user;
  // bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;

    // isLoading = false;
  }

  @override
  Widget build(BuildContext context) {

    return
         _user == null
            ? const SignIn()
            : const HomePage();
  }
}
