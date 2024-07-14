import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minip/courses.dart';
import 'package:minip/courses.dart';
import 'package:minip/screen/user_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Get Api Request
  
   Future<Courses> fetchPost() async {
     final uri = Uri.parse('http://127.0.0.1:5000/api/courses');
     final response = await http.get(uri);

     if (response.statusCode == 200){
       return Courses.fromJson(json.decode(response.body));
     }
     else{
       throw Exception('failed to load message');
     }
   }

   //Send API request
   Future<Courses> createPost(String searchBar) async{
     Map<String, dynamic> request = {
       'search':searchBar,
     };
     final uri = Uri.parse('http://127.0.0.1:5000/api/courses');
     final response = await http.post(uri, body: request);

     if (response.statusCode == 201) {
       return Courses.fromJson(json.decode(response.body));
     }
     else{
       throw Exception('Failed to load');
     }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserDetail()));
                    }, icon: const Icon(Icons.account_circle_outlined,size: 45,color: Colors.black,)),
                    const SizedBox(width: 8),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Abhay Bhattacharya',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.notifications, color: Colors.blue,size: 30,),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search courses",
                    suffixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color:  const Color.fromRGBO(174, 218, 247, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Basic Math Easy',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '28 Lessons',
                            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserDetail()));
                    },
                    child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 208, 190, 253),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Machine Learning \n Easy',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '69 Lessons',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Discounts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(
                  label: const Text('All Courses'),
                  selected: true,
                  backgroundColor: Colors.grey[200],
                  selectedColor: Colors.blue,
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Math'),
                  selected: false,
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('ML'),
                  selected: false,
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {},
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('AI'),
                  selected: false,
                  backgroundColor: Colors.grey[200],
                  onSelected: (bool selected) {},
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Courses you may like',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Physics',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'By HC Verma',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
