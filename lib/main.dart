import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:sizer/sizer.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation, DeviceType deviceType){
    return MaterialApp(
      debugShowCheckedModeBanner: false,home: LoginPage(),
    );
    }
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void _loginWithEmail() {
    if (kDebugMode) {
      print('Logging in with email');
    }
  }

  void _forgotPassword() {
    if (kDebugMode) {
      print('Forgot password');
    }
  }

  void _loginWithGoogle() {
    if (kDebugMode) {
      print('Logging in with Google');
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple,
      body: Stack(
        alignment: Alignment.center,
        children:[
          Positioned(top: 10.h,right: 45.w,
            child: Column(
              children: [
                const Text('Welcome Back!',style: TextStyle(fontSize: 25,color: Colors.white),),
                Padding(
                  padding:  EdgeInsets.only(top: 2.h,right: 10.w),
                  child: const Text('Log into your account',style: TextStyle(fontSize: 14,color: Colors.white),),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30.h,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: TextButton(
                      onPressed: _forgotPassword,
                      child: const Text('Forgot Password?',style: TextStyle(color: Colors.deepPurple),),
                    ),
                  ),
                  // SizedBox(height: 20),
                  SizedBox(width: 80.w,
                    child: ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent)
                    ),
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          _loginWithEmail();
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 20),
                 Padding(
                   padding:  EdgeInsets.only(left:20.w),
                   child: const Row(
                     children: [
                       Text("Don't have an Account?   ",style: TextStyle(fontSize: 13),),
                       Text('Singn Up',style: TextStyle(fontSize: 13,color: Colors.deepPurple),)
                     ],
                   ),
                 ),
                ],
              ),
            ),
          ),
          Positioned(top: 74.h,
              child: const Text("----- or -----",style: TextStyle(fontSize: 20,color: Colors.white),)),
          Positioned(top: 80.h,left: 53.w,
            child: TextButton(
              onPressed: _loginWithGoogle,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set background color
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)), // Optional padding
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login with ',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'facebook',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'YourCustomFont',
                    ),
                  ),
                ],
              ),
            )
          ),
          Positioned(top: 80.h,left: 7.w,
              child: TextButton(
                onPressed: _loginWithGoogle,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set background color
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)), // Optional padding
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login with ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'G',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'YourCustomFont',
                      ),
                    ),
                    Text(
                      'oogle',
                      style: TextStyle(color: Colors.orange), // Set text color
                    ),
                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}
