import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:satsang_app/screens/wrapper.dart';
import 'package:satsang_app/shared/loading.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen(
      {required this.mobileNo,
      required this.verificationId,
      required this.showLoading,
      Key? key})
      : super(key: key);
  String? mobileNo;
  String? verificationId;
  bool showLoading;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  dynamic otp;

  @override
  Widget build(BuildContext context) {
    return widget.showLoading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                const SizedBox(
                  height: 210,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  child: Text(
                    "Please Insert the OTP received in your Mobile Number +91-${widget.mobileNo}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 50,
                    otpFieldStyle: OtpFieldStyle(),
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 0.0,
                    onChanged: (pin) {
                    },
                    onCompleted: (pin) {
                      setState(() => otp = pin);
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final PhoneAuthCredential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId.toString(),
                          smsCode: otp);
                      final FirebaseAuth _auth = FirebaseAuth.instance;

                      setState(() => widget.showLoading = true);
                      try {
                        final authCreds = await _auth
                            .signInWithCredential(PhoneAuthCredential);
                        setState(() => widget.showLoading = false);

                        if(authCreds.user!=null){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const Wrapper()) );
                        }

                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      child: Text("Verify", style: TextStyle(fontSize: 19.0)),
                    ))
              ],
            )),
          );
  }
}
