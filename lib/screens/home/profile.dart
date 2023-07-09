import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:satsang_app/screens/wrapper.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 120.0,),
            const CircleAvatar(
              backgroundColor: Colors.black,
              radius: 50.0,
              child: Icon(
                Icons.person,
                size: 100.0,
              ),
            ),
            const SizedBox(height: 20.0,),

            // Text("${_user!.phoneNumber}"),
            Text("${_user!.phoneNumber}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
            ),),
          const SizedBox(height: 230.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 120.0),
              child: ElevatedButton(

                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Wrapper()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Log Out",
                    style: TextStyle(
                      fontSize: 20.0
                    ),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
