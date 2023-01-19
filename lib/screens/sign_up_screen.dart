import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Future login(String email, String password) async {
  //   try {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //           email: email,
  //           password: password,
  //         )
  //         .then((value) => Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (_) => const HomeScreen(),
  //               ),
  //             ));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       debugPrint('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       debugPrint('Wrong password provided for that user.');
  //     }
  //   }
  // }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://img.freepik.com/premium-vector/scenery-mobile-wallpaper-nature-background-with-bamboo-portrait-view-vector-illustration_619130-596.jpg"),
          ),
        ),
        child: Form(
          key: _key,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Please Fill In The Informaiton About You",
                      style:
                          TextStyle(color: Colors.cyan.shade300, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      validator: validateEmail,
                      controller: emailController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 193, 163, 73),
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 4,
                          ),
                        ),
                        hintText: ' Email Address',
                        hintStyle:
                            const TextStyle(color: Colors.amber, fontSize: 17),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: validatePassword,
                      obscureText: true,
                      controller: passwordController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 193, 163, 73),
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 4,
                          ),
                        ),
                        hintText: ' Password',
                        hintStyle:
                            const TextStyle(color: Colors.amber, fontSize: 17),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: firstNameController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 193, 163, 73),
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 131, 106, 174),
                            width: 4,
                          ),
                        ),
                        hintText: ' FirstName',
                        hintStyle:
                            const TextStyle(color: Colors.amber, fontSize: 17),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: lastNameController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 193, 163, 73),
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 131, 106, 174),
                            width: 4,
                          ),
                        ),
                        hintText: ' LastName',
                        hintStyle:
                            const TextStyle(color: Colors.amber, fontSize: 17),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: ageController,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 193, 163, 73),
                        fontSize: 17,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 131, 106, 174),
                            width: 4,
                          ),
                        ),
                        hintText: ' Age',
                        hintStyle: const TextStyle(
                          color: Colors.amber,
                          fontSize: 17,
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    CupertinoButton.filled(
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          try {
                            addUser(
                              emailController.text.trim(),
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                              int.parse(ageController.text.trim()),
                            );
                            signUp(emailController.text,
                                    passwordController.text)
                                .then(
                              (value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),
                              ),
                            );

                            errorMessage = '';
                          } on FirebaseAuthException catch (error) {
                            errorMessage = error.message!;
                          }

                          setState(() {});
                        }
                      },
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          'I am a member',
                          style: TextStyle(color: Colors.amber),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInScreen(),
                                ),
                              );
                            },
                            child: const Text('Sign In'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'You need to fill in the Email';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid Email Address Format.';
  return null;
}

String? validatePassword(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'You need to fill in the password';
  }
  return null;
}

Future addUser(String email, String firstName, String lastName, int age) async {
  await FirebaseFirestore.instance.collection('users').add({
    'email': email,
    'first name': firstName,
    'last name': lastName,
    'age': age,
  });
}

Future signUp(String emailController, String passwordController) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController,
    password: passwordController,
  );
}
