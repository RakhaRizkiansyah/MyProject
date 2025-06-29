import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:listviw/page/main_page.dart';
import 'package:listviw/page/register_page.dart';
import 'package:listviw/style/color.dart';
import 'package:listviw/widget/custom_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(flex: 1, child: SizedBox(height: 10)),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formLoginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                        ),
                      ),

                      //Email
                      SizedBox(height: 40),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      //Password
                      SizedBox(height: 25),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberPassword,
                                onChanged: (bool? value) {
                                  setState(() {
                                    rememberPassword = value!;
                                  });
                                },
                                activeColor: primaryColor,
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(color: Colors.black45),
                              ),
                            ],
                          ),

                          //Forgot Password
                          GestureDetector(
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formLoginKey.currentState!.validate() &&
                                rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Success')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            } else if (!rememberPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please agree to the processing of personal data',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text('Login'),
                        ),
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Register with',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Brand(Brands.google),
                          Brand(Brands.facebook),
                          Brand(Brands.github),
                          Brand(Brands.twitter),
                        ],
                      ),

                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black45),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
