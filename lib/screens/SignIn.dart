import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screens/HomePage.dart';
import 'package:first_app/screens/SignUp.dart';
import 'package:flutter/material.dart';
import './widget/text_field.dart';

class SignIn extends StatelessWidget {
  late UserCredential userCredential;
  TextEditingController Email_id = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void validation() {
    if (Email_id.text.trim().isEmpty || Email_id.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(
            'Email is empty !',
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
              'Sign In',
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
                  controller: Email_id,
                  hText: 'Email ID',
                  obsText: false,
                  //iconColor: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                myTextField(
                  controller: Password,
                  //icon: Icons.lock_outline,
                  hText: 'Password',
                  obsText: true,
                  //iconColor: Colors.white,
                ),
              ],
            ),
            Container(
              height: 50,
              width: 250,
              child: RaisedButton(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  validation();

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: Email_id.text, password: Password.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext ctx) => HomePage()));
                  }).onError((error, stackTrace) {
                    globalKey.currentState!.showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please confirm Email ID or Password !',
                        ),
                      ),
                    );
                  });

                  Email_id.clear();
                  Password.clear();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New user? ',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Container(
                  height: 50,
                  width: 110,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => SignUp()));
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
