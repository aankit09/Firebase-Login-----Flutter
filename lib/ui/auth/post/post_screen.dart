import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/ui/auth/login_screen.dart';
import 'package:firebase_test/ui/auth/post/add_post.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
