import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shammarapp/register/SignUp.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _EmailController = TextEditingController();
  final FocusNode _EmailFocuse = FocusNode();


  void _resetPassword(BuildContext context) {

    String email = _EmailController.text;
    print('Reset password for email: $email');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset'),
          content: Text('An email with instructions has been sent to $email.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate back to the login screen.
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
        Image.asset(
        'assets/welcomescreen.png', // Replace with your image path
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
         Center(
          child: Container(
            width: 300,
            height: 400,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFD8A9).withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email',
                      prefixIcon: Icon(Icons.mail_outline)),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  controller: _EmailController,
                  focusNode: _EmailFocuse,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("This field is required");
                    }
                    if (!value.isEmail()) {
                      return ("This is not a valid email");
                    } else {
                      return null;
                    }
                  },


                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(email: _EmailController.text).then((value) {
                      Navigator.of(context).pop();

                    }).onError((error, stackTrace) {
                      print("Error");
                    });



                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFee5c8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Reset Password', style: TextStyle(
                      color: Color(0xFFF1A661)),),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}


