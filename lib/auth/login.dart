import 'package:course_learning/auth/enroll.dart';
import 'package:course_learning/auth/forgetpass.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xffeca731),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 135,
                    width: 300,
                    child: Image.asset(
                      'assets/authlogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xfffdfdfd),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          const TextField(
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Color(0xffeca731)),
                              hintText: 'Username',
                            ),
                          ),
                          const SizedBox(height: 16),
                          const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.lock, color: Color(0xffeca731)),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const EnrollmentForm(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xffeca731),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage(),
                          ));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xfffdfdfd),
                        fontSize: 16,
                      ),
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

void main() => runApp(MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xffeca731, {
          50: Color(0xffeca731),
          100: Color(0xffeca731),
          200: Color(0xffeca731),
          300: Color(0xffeca731),
          400: Color(0xffeca731),
          500: Color(0xffeca731),
          600: Color(0xffeca731),
          700: Color(0xffeca731),
          800: Color(0xffeca731),
          900: Color(0xffeca731),
        }),
      ),
    ));
