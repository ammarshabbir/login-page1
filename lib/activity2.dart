import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Activity2 extends StatefulWidget {
  @override
  _Activity2State createState() => _Activity2State();
}

class _Activity2State extends State<Activity2> {
  @override
  Widget build(BuildContext context) {

    final _auth = FirebaseFirestore.instance;

    String name;
    String email;
    String gender;


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      height: 200,
                      width: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 150,
                      height: 150,
                      width: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 50,
                      height: 50,
                      width: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/clock.png'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top:200,
                      left:150,
                      child:Text(
                        'Second Activity',
                        style:TextStyle(
                          color:Colors.white,
                          fontWeight:FontWeight.bold,
                          fontSize:40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey[100]),
                            ),
                          ),
                          child: TextField(
                            onChanged: (value){
                              name = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Name',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey[100]),
                            ),
                          ),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value){
                              email = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey[100]),
                            ),
                          ),
                          child: TextField(
                            obscureText: true,
                            onChanged: (value){
                              gender = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Gender',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: ()async{
                _auth.collection('messages').add({
                  'name':name,
                  'email':email,
                  'gender':gender,
                });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
