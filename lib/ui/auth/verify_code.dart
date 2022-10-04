import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/ui/auth/post/post_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/round_button.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;

  VerifyCode({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: verifyCodeController,
              decoration: const InputDecoration(hintText: '6 Digits Code'),
            ),
            const SizedBox(
              height: 100,
            ),
            RoundButton(
              title: 'Verify Code',
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = false;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verifyCodeController.text.toString());
                try {
                  await auth.signInWithCredential(credential);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostScreen()));
                } catch (e) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(e.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
