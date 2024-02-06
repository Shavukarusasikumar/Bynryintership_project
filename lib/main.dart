import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  void _loginWithEmail() {
    print('Logging in with email');
  }

  void _forgotPassword() {
    print('Forgot password');
  }

  void _loginWithGoogle() {
    print('Logging in with Google');
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
            child: Container(
              child: Column(
                children: [
                  Text('Welcome Back!',style: TextStyle(fontSize: 25,color: Colors.white),),
                  Padding(
                    padding:  EdgeInsets.only(top: 2.h,right: 10.w),
                    child: Text('Log into your account',style: TextStyle(fontSize: 14,color: Colors.white),),
                  ),
                ],
              ),
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
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: TextButton(
                      onPressed: _forgotPassword,
                      child: Text('Forgot Password?',style: TextStyle(color: Colors.deepPurple),),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Container(width: 80.w,
                    child: ElevatedButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orangeAccent)
                    ),
                      onPressed: () {
                        if (Form.of(context)!.validate()) {
                          _loginWithEmail();
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: 20),
                 Padding(
                   padding:  EdgeInsets.only(left:20.w),
                   child: Row(
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
              child: Text("----- or -----",style: TextStyle(fontSize: 20,color: Colors.white),)),
          Positioned(top: 80.h,left: 53.w,
            child: TextButton(
              onPressed: _loginWithGoogle,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set background color
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)), // Optional padding
              ),
              child: Row(
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
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)), // Optional padding
                ),
                child: Row(
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
