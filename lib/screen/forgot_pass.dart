import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minip/widget.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Text(
                'Enter the email you want to get reset link',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              reusableTextField(
                  "Email", Icons.person_outline, false, _emailTextController),
              const SizedBox(
                height: 20,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () async {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _emailTextController.text);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Your password reset email is sent')));
                    },
                    child: const Text('Send Email')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
