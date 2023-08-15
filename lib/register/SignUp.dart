import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shammarapp/homeScreen.dart';

import 'forget_password_screen.dart';

class MyLoginSignupScreen extends StatefulWidget {
  @override
  _MyLoginSignupScreenState createState() => _MyLoginSignupScreenState();
}

class _MyLoginSignupScreenState extends State<MyLoginSignupScreen> {
  bool _showLoginScreen = true;
  bool _obscureText = true;

  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  final FocusNode _EmailFocuse = FocusNode();
  final FocusNode _fullNameFocuse = FocusNode();
  final FocusNode _PasswordFocuse = FocusNode();


  void _toggleScreen() {
    setState(() {
      _showLoginScreen = !_showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFD8A9).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showLoginScreen = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: _showLoginScreen ? const Color(
                                  0xFFF1A661) : Color(0xFFFee5c8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: _showLoginScreen
                                    ? Colors.white
                                    : const Color(0xFFF1A661),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _showLoginScreen = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: !_showLoginScreen ? const Color(
                                  0xFFF1A661) : Color(0xFFFee5c8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: !_showLoginScreen
                                    ? Colors.white
                                    : const Color(0xFFF1A661),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  if (_showLoginScreen)
                    Column(children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline)),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _EmailController,
                        focusNode: _EmailFocuse,
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context).requestFocus(_PasswordFocuse);
                          _PasswordFocuse.requestFocus();
                        },

                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return ("This Field is required");

                          }

                          else {
                            return null;
                          }
                        },


                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: !_obscureText,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Toggle the password visibility
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.done,
                        controller: _PasswordController,
                        focusNode: _PasswordFocuse,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("This Field is required");

                          }

                          else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 128.0),
                        child: TextButton(onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                        );}, child: const Text(
                          'Forget  password?',
                          style: TextStyle(color: Colors.white),)),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: _EmailController.text, password: _PasswordController.text).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }).onError((error, stackTrace) {
                        print("Error");
                      });



                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                          _showLoginScreen ? const Color(0xFFFee5c8) : null,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Login', style: TextStyle(
                            color: Color(0xFFF1A661))),
                      ),
                    ])
                  else
                    Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(prefixIcon: Icon(Icons
                              .email_outlined)
                              , labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: _EmailController,
                          focusNode: _EmailFocuse,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return ("This field is required");
                            }
                            if (!value.trim().isEmail()) {
                              return ("This is not a valid email");
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(prefixIcon: Icon(Icons
                              .perm_identity_sharp),
                              labelText: 'Full name'),
                          controller: _fullNameController,
                          focusNode: _fullNameFocuse,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("This Field is required");
                            } else if (!value.isUsername()) {
                              return ("This is not a valid username");
                            } else {
                              return null;
                            }
                          },

                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: !_obscureText,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                // Toggle the password visibility
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          controller: _PasswordController,
                          focusNode: _PasswordFocuse,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("This Field is required");
                            } else if (!value.isPasswordHard()) {
                              return "This is an easy password Must contains at least:  "
                                  "\n 1 uppercase letter, 1 lowecase letter, 1 number, "
                                  "\n & 1 special character";
                              //        textAlign: TextAlign.center,
                              //    ),);
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: _EmailController.text, password: _PasswordController.text)
                                .then((value) {
                                  print("create new account");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            })
                                .catchError((error, stackTrace) {
                              print("Error ${error.toString()}");
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
                          child: const Text('Sign Up', style: TextStyle(
                              color: Color(0xFFF1A661)),),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
