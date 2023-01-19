import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  _userInfo() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = user as Map<String, dynamic>;
          return Text("Full Name: ${data['LastName']} ${data['FirstName']}");
          // Map<String, dynamic> data = snapshot as Map<String, dynamic>;
          // return Text('Last Name: ${data['LastName']} ');
        }
        return Text('Loading');
      },
    );

    // Map<String, dynamic> data = user as Map<String, dynamic>;
    // return Text("Full Name: ${data['LastName']} ${data['FirstName']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello My User: ${user.email}',
          style: const TextStyle(color: Colors.amber, fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://static01.nyt.com/newsgraphics/2020/12/06/trees/assets/images/tree-cover-2000.jpg",
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Hello This is homeScreen of}',
                style: TextStyle(color: Colors.cyan),
              ),
              const Text(
                'kim',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton.filled(
                child: const Text('Sign out'),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
