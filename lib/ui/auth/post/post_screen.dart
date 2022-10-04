import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/ui/auth/login_screen.dart';
import 'package:firebase_test/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostScreen'),
        actions: [
          IconButton(
            onPressed: () {
              auth
                  .signOut()
                  .then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                  )
                  .onError(
                (error, stackTrace) {
                  Utils().toastMessage(error.toString());
                },
              );
            },
            icon: Icon(Icons.logout),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const Center(
          child: Text(
        'Logout',
        style: TextStyle(fontSize: 35),
      )),
    );
  }
}
