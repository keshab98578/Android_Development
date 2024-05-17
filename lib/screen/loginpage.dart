import 'package:android_development/common/authForm.dart';
import 'package:android_development/screen/dashboard.dart';
import 'package:android_development/screen/signuppage.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      if (passwordController.text.length < 8) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Password must be 8 characters long')));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
      }
      return;
    }
  }

  void goSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUppage()));
  }

  void fbpressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUppage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 208, 208),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 300,
            //   decoration: BoxDecoration(
            //       gradient: const LinearGradient(
            //           colors: [Colors.lightGreen, Colors.lightBlue],
            //           end: Alignment.topLeft,
            //           begin: Alignment.bottomRight),
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.blue),
            //   child: const Text(
            //     "foodie",
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontStyle: FontStyle.italic,
            //       fontSize: 50,
            //       color: Color.fromARGB(255, 26, 36, 82),
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.all(5),
            //   width: 200,
            // ),
            Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Colors.white, width: 5),
              ),
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: AuthForm(
                    formKey: _formKey,
                    passwordController: passwordController,
                    buttonText: 'Login',
                    buttonPressed: submit,
                    fbPressed: fbpressed,
                    showConfirmPassword: false,
                    confrimPasswordController: passwordController,
                    signPressed: goSignup,
                    islogin: false,
                    issign: true,
                    // loginPresses: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
