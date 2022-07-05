import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/SignIn.dart';
import 'package:first_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import './widget/text_field.dart';

class SignUp extends StatelessWidget {
  TextEditingController Username = TextEditingController();
  TextEditingController Email_ID = TextEditingController();
  TextEditingController Password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void sendData() {
    FirebaseFirestore.instance.collection('User Data').add({
      'username': Username.text,
      'email id': Email_ID.text,
      'password': Password.text,
    });
  }

  void validation() {
    if (Username.text.trim().isEmpty || Username.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            'Username is empty !',
          ),
        ),
      );
      return;
    }

    if (Email_ID.text.trim().isEmpty || Email_ID.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            'Email ID is empty !',
          ),
        ),
      );
      return;
    }

    if (Password.text.trim().isEmpty || Password.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            'Password is empty !',
          ),
        ),
      );
      return;
    } else {
      sendData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                myTextField(
                  //icon: Icons.person_outline,
                  controller: Username,
                  hText: 'Username',
                  obsText: false,
                  //iconColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                myTextField(
                  //icon: Icons.email_outlined,
                  controller: Email_ID,
                  hText: 'Email ID',
                  obsText: false,
                  //iconColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                myTextField(
                  //icon: Icons.lock_outline,
                  controller: Password,
                  hText: 'Password',
                  obsText: true,
                  //iconColor: Colors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      validation();

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: Email_ID.text, password: Password.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignIn()));
                        globalKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text(
                              'Account created successfully !',
                            ),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        globalKey.currentState!.showSnackBar(
                          SnackBar(
                            content: Text(
                              'An error occurred',
                            ),
                          ),
                        );
                      });

                      Username.clear();
                      Email_ID.clear();
                      Password.clear();
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => welcome()));
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
