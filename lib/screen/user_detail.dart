import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minip/home.dart';
import 'package:minip/widget.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _firstnameTextController = TextEditingController();
  final _lastnameTextController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose(){
    _usernameTextController.dispose();
    _emailTextController.dispose();
    _firstnameTextController.dispose();
    _lastnameTextController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future confirm(String username, String email, String firstname, String lastname, int age) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username':username,
      'email':email,
      'first name':firstname,
      'last name':lastname,
      'age':age,
    }).then((value){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/logo.jpg', width: 100,),
              const SizedBox(height: 20,),
              const Text('Enter User Details',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
              const SizedBox(height: 20,),
              reusableTextField('Username', Icons.person_outline, false, _usernameTextController),
              const SizedBox(height: 20,),
              reusableTextField('Email', Icons.person_outline, false, _emailTextController),
              const SizedBox(height: 20,),
              reusableTextField('First Name', Icons.person_outline, false, _firstnameTextController),
              const SizedBox(height: 20,),
              reusableTextField('Last Name', Icons.person_outline, false, _lastnameTextController),
              const SizedBox(height: 20,),
              reusableTextField('Age', Icons.date_range_outlined, false, _ageController),
              const SizedBox(height: 20,),
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
                    confirm(_usernameTextController.text, _emailTextController.text, _firstnameTextController.text, _lastnameTextController.text, int.parse(_ageController.text));
                  },
                  child: const Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                  ),
                  //.........
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
