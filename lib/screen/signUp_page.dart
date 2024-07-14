import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minip/screen/login_page.dart';
import 'package:minip/screen/user_detail.dart';
import 'package:minip/widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();

  static const snackBar = SnackBar(content: Text('Password Is Incorrect'));

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text);
    }
  }

  bool passwordConfirmed() {
    if(_passwordTextController.text == _confirmPasswordTextController){
      return true;
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25,
              ),
              Opacity(
                opacity: 1,
                child: Image.asset(
                  "assets/images/logo.jpg",
                  width: 100,
                ),
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Skill',
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: const Color.fromRGBO(101, 127, 243, 1),
                      ),
                    ),
                    Text(
                      'Route',
                      style: GoogleFonts.kanit(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: const Color.fromRGBO(69, 68, 89, 1),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Text(
                'SignUp',
                style: GoogleFonts.average(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30),
              reusableTextField(
                  'Email', Icons.person_outline, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  'Password', Icons.lock_outline, true, _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  'Confirm Password', Icons.lock_outline, true, _confirmPasswordTextController),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      backgroundColor: const Color.fromRGBO(209, 196, 243, 1),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created new account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const UserDetail()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: const Text(
                    "SignUp",
                    textAlign: TextAlign.center,
                  ),
                  //.........
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text('SignIn'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
