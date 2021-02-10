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


  String email;
  String password;

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
                        'Activity1',
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
                              email = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone or Email',
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
                              password = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
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
                  try{
                    UserCredential userCredential  = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                  }on FirebaseAuthException catch(e){
                    if(e.code == 'Weak Password'){
                      print('The password provided is too weak.');
                    }else if(e.code == 'email-already-in-use'){
                      print('The account already exists for that email.');
                    }
                  }catch(e){
                    print(e);
                  }
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
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:70),
              Text(
                'Forgot Password',
                style:TextStyle(
                  color:Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
