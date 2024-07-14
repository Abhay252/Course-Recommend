import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minip/home.dart';
import 'package:minip/screen/forgot_pass.dart';
import 'package:minip/screen/signUp_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minip/widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Container(
        margin: const EdgeInsets.all(20),
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
              'Login',
              style: GoogleFonts.average(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            reusableTextField(
                'Email', Icons.person_outline, false, _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                'Password', Icons.lock_outline, true, _passwordTextController),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPass()));
              },
              child: const Text('Forgot Password?'),
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
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
                  }).onError((error, stackTrace) {
                    print('error');
                  });
                },
                child: const Text(
                  "Login",
                  textAlign: TextAlign.center,
                ),
                //.........
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: const Text('SignUp'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
