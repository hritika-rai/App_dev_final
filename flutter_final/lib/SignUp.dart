import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'HomeFinal.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
  }

  Future<void> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          print(userCredential.user);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeFinal()));
        }
      }
    } catch (e) {
      print('Error registering with Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to sign up with Google: $e'),
      ));
    }
  }

  Future<void> registerWithEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          print(userCredential.user);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeFinal()));
        }
      } catch (e) {
        print('Error registering with Email: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to sign up with Email: $e'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: registerWithEmail,
                child: const Text(
                  'Sign up with Email',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text('or'),
              SizedBox(height: 10),
              ElevatedButton.icon(
                  onPressed: registerWithGoogle,
                  icon: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/281/281764.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                label: const Text(
                  'Sign up with Google',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 0,),
                  TextButton(
                    onPressed: () {
                      // Replace with your Login page navigation
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()), // Ensure LoginPage is defined
                      );
                    },
                    child: const Text(
                      'Login Now.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            
            ],
          ),
        ),
      ),
    );
  }
}
